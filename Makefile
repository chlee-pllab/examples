LLVM_CONFIG ?= ~/llvm-project/install/bin/llvm-config
LLVM_BIN ?= ~/llvm-project/install/bin
CXX=`$(LLVM_CONFIG) --bindir`/clang
LLC=`$(LLVM_CONFIG) --bindir`/llc
#CXX=$(LLVM_BIN)/clang
#LLC=$(LLVM_BIN)/llc
GCC=~/toolchain/bin/riscv64-unknown-linux-gnu-gcc
OBJDUMP=`$(LLVM_CONFIG) --bindir`/llvm-objdump
NM=`$(LLVM_CONFIG) --bindir`/llvm-nm
CXXFLAGS=`$(LLVM_CONFIG) --cppflags` -fPIC -fno-rtti
LDFLAGS=`$(LLVM_CONFIG) --ldflags`
IRFLAGS=-Xclang -disable-O0-optnone -fno-discard-value-names -S -emit-llvm
OPT=`$(LLVM_CONFIG) --bindir`/opt
DIS=`$(LLVM_CONFIG) --bindir`/llvm-dis

RISCV := ~/riscv
TOOLCHAIN := $(HOME)/toolchain
SPIKE := $(RISCV)/bin/spike
TARGET := --target=riscv64-unknown-linux-gnu
SYSROOT := --sysroot=$(TOOLCHAIN)/sysroot
GCC_TOOLCHAIN := --gcc-toolchain=$(HOME)/toolchain
ARCH := -march=rv64gcv

SRC := add_kernel.c
#SRC := test2.c
#SRC := gemv_kernel.c
MIN := $(SRC:_kernel.c=_min.c)
MAIN := $(SRC:_kernel.c=_main3.c)
LLIR_FILE = $(SRC:.c=.llir)
IR_FILE = $(SRC:.c=.ll)
MR_FILE = $(SRC:.c=.mir)
S_FILE = $(SRC:.c=.s)
OUT_FILE = $(SRC:.c=.out)
O_FILE = $(SRC:.c=.o)
SO_FILE = lib$(SRC:.c=.so)
EXE_FILE = $(SRC:.c=)
OPT_FILE = $(SRC:.c=_opt.ll)

CFLAGS :=
LFLAGS :=
CFLAGS += $(ARCH)
CFLAGS += $(SYSROOT)
CFLAGS += $(GCC_TOOLCHAIN)
CFLAGS += -fPIC
LFLAGS += -mllvm --prefer-predicate-over-epilogue=predicate-else-scalar-epilogue
#FLAGS += -mllvm -force-tail-folding-style=data-with-evl
#FLAGS += -mllvm -force-tail-folding-style=data
#LFLAGS += -mllvm -force-tail-folding-style=data-without-lane-mask
#LFLAGS += -mllvm -force-tail-folding-style=data-and-control
#LFLAGS += -menable-experimental-extensions
#ISA := rv64gcv_zicntr
LFLAGS += -fno-inline
#LFLAGS += -mllvm -unswitch-threshold=1
LFLAGS += -mllvm -riscv-v-vector-bits-min=128
LFLAGS += -mllvm --riscv-v-fixed-length-vector-lmul-max=8
LFLAGS += -mllvm --riscv-v-register-bit-width-lmul=8
#LFLAGS += -fno-vectorize
#LFLAGS += -fslp-vectorize -fvectorize
#CFLAGS += -mllvm -debug-only=loop-vectorize,slp-vectorizer
#CFLAGS += -Xclang -vectorize-slp -mllvm -debug-only=slp-vectorizer
SFLAGS := --riscv-disable-using-constant-pool-for-large-ints --riscv-use-rematerializable-movimm --riscv-enable-copy-propagation --riscv-enable-copyelim --riscv-enable-sink-fold --riscv-enable-register-pressure-opt

.PHONY: s ss o d-% compile compil all v t run llc opt clean
all: compile

ss:
	$(LLC) -mattr=+m,+f,+d,+v -disable-lsr -relocation-model=pic -riscv-v-vector-bits-min=128 $(LLIR_FILE) -filetype=asm -o $(S_FILE) -a

sss-%:
	$(LLC) -mattr=+m,+f,+d,+v -disable-lsr -relocation-model=pic -riscv-v-vector-bits-min=128 add_kernel$*.llir -filetype=asm -o add_kernel$*.s

sss:
	$(LLC) -mattr=+m,+f,+d,+v -disable-lsr -relocation-model=pic -riscv-v-vector-bits-min=128 $(LLIR_FILE) -filetype=asm -o $(S_FILE) -sink

s:
	$(LLC) -mattr=+m,+f,+d,+v -disable-lsr -relocation-model=pic -riscv-v-vector-bits-min=128 $(LLIR_FILE) -filetype=asm -o $(S_FILE)

o-%:
	$(CXX) --target=riscv64-unknown-linux-gnu $(ARCH) -fPIC \
  -c add_kernel$*.s -o add_kernel$*.o
	$(CXX) \
  --target=riscv64-unknown-linux-gnu -march=rv64gcv \
  --sysroot=$(HOME)/toolchain/sysroot \
  --gcc-toolchain=$(HOME)/toolchain \
  -fPIC -shared \
  add_kernel$*.o -o libadd_kernel$*.so

o:
	$(CXX) --target=riscv64-unknown-linux-gnu $(ARCH) -fPIC \
  -c $(S_FILE) -o $(O_FILE)
	$(CXX) \
  --target=riscv64-unknown-linux-gnu -march=rv64gcv \
  --sysroot=$(HOME)/toolchain/sysroot \
  --gcc-toolchain=$(HOME)/toolchain \
  -fPIC -shared \
  $(O_FILE) -o $(SO_FILE)

e:
	$(CXX) \
  --target=riscv64-unknown-linux-gnu $(ARCH) \
  --sysroot=$(HOME)/toolchain/sysroot \
  --gcc-toolchain=$(HOME)/toolchain \
  -fuse-ld=$(HOME)/toolchain/bin/riscv64-unknown-linux-gnu-ld \
  -fPIC \
  -L . \
  -Wl,-rpath,'$$ORIGIN' \
  main.o -l$(EXE_FILE) -o $(OUT_FILE)
#  -static \

self:
	$(CXX) \
  -O3 \
  --target=riscv64-unknown-linux-gnu \
  -march=rv64gcv \
  --sysroot=$(HOME)/toolchain/sysroot \
  --gcc-toolchain=$(HOME)/toolchain \
  -c $(MAIN) -o main.o
	$(CXX) \
  --target=riscv64-unknown-linux-gnu \
  $(ARCH) \
  --sysroot=$(HOME)/toolchain/sysroot \
  --gcc-toolchain=$(HOME)/toolchain \
  -fuse-ld=$(HOME)/toolchain/bin/riscv64-unknown-linux-gnu-ld \
  -Wl,-rpath,'$$ORIGIN' \
  main.o -o $(OUT_FILE)

d-%:
	$(CXX) --target=riscv64-unknown-linux-gnu -march=rv64gcv -fPIC -c $*.s -o $*.o
	$(OBJDUMP) -d $*.o | wc -l

mca:
	~/llvm-project/install/bin/llvm-mca \
  -mtriple=riscv64 -mcpu=generic \
  -mattr=+m,+f,+d,+v \
  $(S_FILE)

nm:
	$(NM) -D libadd_kernel.so | grep add_kernel

foo:
	`~/llvm-project/install/bin/llvm-config --bindir`/clang \
  -O3 \
  -mllvm --prefer-predicate-over-epilogue=predicate-else-scalar-epilogue \
  -mllvm -riscv-v-vector-bits-min=128 \
  -mllvm --riscv-v-fixed-length-vector-lmul-max=8 \
  -mllvm --riscv-v-register-bit-width-lmul=8 \
  -mllvm -force-tail-folding-style=data-with-evl \
  --target=riscv64-unknown-linux-gnu \
  -march=rv64gcv \
  --sysroot=$(HOME)/toolchain/sysroot \
  --gcc-toolchain=$(HOME)/toolchain \
  -fPIC -shared \
  foo.c -o libfoo.so

m-%:
	$(CXX) \
  -O3 \
  --target=riscv64-unknown-linux-gnu -march=rv64gcv \
  --sysroot=$(HOME)/toolchain/sysroot \
  --gcc-toolchain=$(HOME)/toolchain \
  -fPIC \
  -c main_1e$*.c -o main_1e$*.o

main:
	$(CXX) \
  -O3 \
  --target=riscv64-unknown-linux-gnu -march=rv64gcv \
  --sysroot=$(HOME)/toolchain/sysroot \
  --gcc-toolchain=$(HOME)/toolchain \
  -fPIC \
  -c $(MIN) -o main.o
#  -I . \

e-%:
	$(eval KERNEL=$(word 2,$(subst -, ,$*)))
	$(eval SIZE=$(word 1,$(subst -, ,$*)))
	$(CXX) \
  --target=riscv64-unknown-linux-gnu $(ARCH) \
  --sysroot=$(HOME)/toolchain/sysroot \
  --gcc-toolchain=$(HOME)/toolchain \
  -fuse-ld=$(HOME)/toolchain/bin/riscv64-unknown-linux-gnu-ld \
  -fPIC \
  -L . \
  -Wl,-rpath,'$$ORIGIN' \
  main_1e$(SIZE).o -ladd_kernel$(KERNEL) -o main_1e$*.out

main3:
	`~/llvm-project/install/bin/llvm-config --bindir`/clang \
  -O3 \
  --target=riscv64-unknown-linux-gnu -march=rv64gcv \
  --sysroot=$(HOME)/toolchain/sysroot \
  --gcc-toolchain=$(HOME)/toolchain \
  -fPIC \
  -c $(MAIN) -o main.o
#  -I . \

compile:
	$(CXX) -S -O3 -emit-llvm $(LFLAGS) -mllvm -force-tail-folding-style=data-with-evl --target=riscv64-unknown-linux-gnu $(CFLAGS) -o $(LLIR_FILE) $(SRC)
#$(CXX) -S -O3 -emit-llvm -fslp-vectorize -mllvm --scalable-vectorization=preferred -mllvm -riscv-v-vector-bits-min=128 --target=riscv64-unknown-elf -march=rv64gcv1p0 $(CFLAGS) -o $(IR_FILE) $(SRC)

compil:
	$(CXX) -S -O3 -emit-llvm $(LFLAGS) -mllvm -force-tail-folding-style=data --target=riscv64-unknown-linux-gnu -march=rv64gcv1p0 $(CFLAGS) -o $(IR_FILE) $(SRC)

vl:
	$(LLC) -stop-after=riscv-vl-optimizer -debug-only=riscvsink -mattr=+m,+f,+d,+v -disable-lsr -relocation-model=pic -riscv-v-vector-bits-min=128 --riscv-v-fixed-length-vector-lmul-max=8 --riscv-v-register-bit-width-lmul=8 $(LLIR_FILE) -o $(MR_FILE) -sink

r:
	$(LLC) -stop-after=expand-large-div-rem -debug-only=riscvsink -mattr=+m,+f,+d,+v -disable-lsr -relocation-model=pic -riscv-v-vector-bits-min=128 $(LLIR_FILE) -o $(MR_FILE) -sink

v:
	$(LLC) -stop-after=register-coalescer -debug-only=riscvsink -mattr=+m,+f,+d,+v -disable-lsr -relocation-model=pic -riscv-v-vector-bits-min=128 $(LLIR_FILE) -o $(MR_FILE) -sink

t:
	$(LLC) -stop-after=stack-slot-coloring -debug-only=expandpseudos -mattr=+m,+f,+d,+v -disable-lsr -relocation-model=pic -riscv-v-vector-bits-min=128 $(LLIR_FILE) -o $(MR_FILE) -sink

isa:
	$(LLC) -stop-after=expandpseudos -debug-only=expandpseudos -mattr=+m,+f,+d,+v -disable-lsr -relocation-model=pic -riscv-v-vector-bits-min=128 $(LLIR_FILE) -filetype=asm -o $(S_FILE) -stats -sink

i:
	$(LLC) -debug-only=expandpseudos -mattr=+m,+f,+d,+v -disable-lsr -relocation-model=pic -riscv-v-vector-bits-min=128 $(LLIR_FILE) -filetype=asm -o $(S_FILE) -stats -sink

stat:
	$(LLC) -mattr=+m,+f,+d,+v -disable-lsr -relocation-model=pic -riscv-v-vector-bits-min=128 $(LLIR_FILE) -filetype=asm -o $(S_FILE) -stats
	grep "8-byte Folded Spill" add_kernel.s
	grep "8-byte Folded Reload" add_kernel.s
	grep "64-byte Folded Spill" add_kernel.s
	grep "64-byte Folded Reload" add_kernel.s

run:
	$(LLC) -stop-after=machine-scheduler $(IR_FILE) -o $(MR_FILE)

pk:
	$(SPIKE) --isa=rv64gcv pk $(OUT_FILE)

llc:
	$(LLC) -debug-pass=Structure $(LLIR_FILE) -o $(MR_FILE)

opt:
	$(OPT) -passes="mem2reg,print<memoryssa>" $(LLIR_FILE)
#$(OPT) -passes=mem2reg $(IR_FILE) -S -o $(OPT_FILE)
#$(OPT) -passes=mem2reg $(IR_FILE) | $(DIS) -o $(OPT_FILE)

clean:
	rm -f $(IR_FILE) $(MR_FILE)
