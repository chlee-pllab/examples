import ctypes
import numpy as np
import os

os.environ['LD_LIBRARY_PATH'] = '/usr/local/lib:/usr/lib'

BLOCK_SIZE_M = 1
BLOCK_SIZE_N = 128

lib = ctypes.CDLL('./gemv_kernel.so')
kernel = lib.gemv_kernel
kernel.argtypes = [ctypes.c_void_p, ctypes.c_void_p, ctypes.c_void_p, ctypes.c_int32, ctypes.c_int32, ctypes.c_int32, ctypes.c_int32]

def gemv(weight, x, output):
    M, N = weight.shape
    if output is None:
        output = np.empty(M, dtype=np.float32)

    num_blocks = (M + BLOCK_SIZE_M - 1) // BLOCK_SIZE_M

    for block_idx in range(num_blocks):
        kernel(output.ctypes.data, weight.ctypes.data, x.ctypes.data, ctypes.c_int32(M), ctypes.c_int32(N), ctypes.c_int32(weight.strides[0] // weight.itemsize), ctypes.c_int32(block_idx))
    
    return output

np.random.seed(0)
M, N = 512, 1024
weight = np.random.rand(M, N).astype(np.float32)
x = np.random.rand(N).astype(np.float32)
output_triton_cpu = gemv(weight, x, None)
correct = np.allclose(output_triton_cpu, np.dot(weight, x))
print(f"size {M:4d} {N:4d}: {'PASS' if correct else 'FAIL'}")

def benchmark(M, N, iterations=100):
    import time

    weight = np.random.rand(M, N).astype(np.float32)
    x = np.random.rand(N).astype(np.float32)
    output = np.empty(M, dtype=np.float32)

    quantiles = [0.5, 0.2, 0.8]
    timings = []
    for _ in range(iterations):
        start = time.perf_counter()
        gemv(weight, x, output)
        end = time.perf_counter()
        timings.append((end - start) * 1000)
    timings_sorted = np.sort(timings)
    ms, min_ms, max_ms = [timings_sorted[int(quantile * len(timings_sorted))] for quantile in quantiles]

    return ms, min_ms, max_ms

sizes_N = [512*i for i in range(10, 21)]
M_fixed = 4096
def run_benchmark():
    print(f"gemv-add-performance (BLOCK_SIZE_M={BLOCK_SIZE_M}, BLOCK_SIZE_N={BLOCK_SIZE_N}):")
    print(f"{'M':>6} {'N':>12} {'TritonCPU':>12}")

    results = []
    for idx, N in enumerate(sizes_N):
        M = M_fixed
        if N <= 65536:
            iterations = 1
        else:
            iterations = 1
        ms, min_ms, max_ms = benchmark(M, N, iterations)
        M, N = float(M), float(N)
        print(f"{idx:<2} {M:>6.1f} {N:>12.1f} {ms:>15.6f}")

        gbps = lambda ms: (2 * M * N * 1e-9) / (ms * 1e-3 + 1e-9)
        results.append([gbps(ms), gbps(min_ms), gbps(max_ms)])

    return results
 
run_benchmark()
