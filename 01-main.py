import ctypes
import numpy as np
import os

os.environ['LD_LIBRARY_PATH'] = '/usr/local/lib:/usr/lib'

BLOCK_SIZE = 128

lib = ctypes.CDLL('./add_kernel.so')
kernel = lib.add_kernel
kernel.argtypes = [ctypes.c_void_p, ctypes.c_void_p, ctypes.c_void_p, ctypes.c_int32, ctypes.c_int32]

def add(x, y, output):
    if output is None:
        output = np.empty_like(x)
    n_elements = x.size

    num_blocks = (n_elements + BLOCK_SIZE - 1) // BLOCK_SIZE

    for block_idx in range(num_blocks):
        kernel(x.ctypes.data, y.ctypes.data, output.ctypes.data, ctypes.c_int32(n_elements), ctypes.c_int32(block_idx))
    
    return output

np.random.seed(0)
size = 98432
x = np.random.rand(size).astype(np.float32)
y = np.random.rand(size).astype(np.float32)
output_triton_cpu = add(x, y, None)
correct = np.allclose(output_triton_cpu, x + y)
print(f"size {size:4d}: {'PASS' if correct else 'FAIL'}")

def benchmark(size, iterations=100):
    import time

    x = np.random.rand(size).astype(np.float32)
    y = np.random.rand(size).astype(np.float32)
    output = np.empty_like(x)

    quantiles = [0.5, 0.2, 0.8]
    timings = []
    for _ in range(iterations):
        start = time.perf_counter()
        add(x, y, output)
        end = time.perf_counter()
        timings.append((end - start) * 1000)
    timings_sorted = np.sort(timings)
    ms, min_ms, max_ms = [timings_sorted[int(quantile * len(timings_sorted))] for quantile in quantiles]

    return ms, min_ms, max_ms

sizes = [2**i for i in range(12, 28, 1)]
def run_benchmark():
    print(f"vector-add-performance (CPU_BLOCK_SIZE={BLOCK_SIZE}):")
    print(f"   {'size':>12} {'TritonCPU':>12}")

    results = []
    for idx, size in enumerate(sizes):
        if size <= 65536:
            iterations = 100
        elif size <= 262144:
            iterations = 50
        elif size <= 1048576:
            iterations = 30
        else:
            iterations = 1
        ms, min_ms, max_ms = benchmark(size, iterations)
        size = float(size)
        print(f"{idx:<2} {size:>12.1f} {ms:>12.6f}")

        gbps = lambda ms: (3 * size * 4 * 1e-9) / (ms * 1e-3 + 1e-9)
        results.append([gbps(ms), gbps(min_ms), gbps(max_ms)])

    return results
 
run_benchmark()
