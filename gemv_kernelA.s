--- |
  ; ModuleID = 'gemv_kernelA.llir'
  source_filename = "LLVMDialectModule"
  target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
  target triple = "riscv64-unknown-linux-gnu"
  
  ; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none)
  define void @gemv_kernel(ptr writeonly captures(none) %0, ptr %1, ptr %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11) local_unnamed_addr #0 !dbg !3 {
    %13 = icmp sgt i32 %4, 0, !dbg !6
    br i1 %13, label %.lr.ph.preheader, label %._crit_edge, !dbg !6
  
  .lr.ph.preheader:                                 ; preds = %12
    %14 = ptrtoint ptr %2 to i64, !dbg !7
    %15 = shl i32 %5, 2, !dbg !8
    %16 = mul i32 %15, %6, !dbg !7
    %17 = sext i32 %16 to i64, !dbg !7
    %18 = ptrtoint ptr %1 to i64, !dbg !9
    %19 = add i64 %17, %18, !dbg !7
    br label %.lr.ph, !dbg !6
  
  .lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader
    %20 = phi i64 [ %46, %.lr.ph ], [ %14, %.lr.ph.preheader ]
    %21 = phi i64 [ %45, %.lr.ph ], [ %19, %.lr.ph.preheader ]
    %22 = phi float [ %44, %.lr.ph ], [ 0.000000e+00, %.lr.ph.preheader ]
    %23 = phi i32 [ %47, %.lr.ph ], [ 0, %.lr.ph.preheader ]
    %24 = inttoptr i64 %21 to ptr, !dbg !10
    %25 = load <128 x float>, ptr %24, align 4, !dbg !10
    %26 = inttoptr i64 %20 to ptr, !dbg !11
    %27 = load <128 x float>, ptr %26, align 4, !dbg !11
    %28 = fmul <128 x float> %25, %27, !dbg !12
    %29 = shufflevector <128 x float> %28, <128 x float> poison, <128 x i32> <i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127, i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>, !dbg !13
    %30 = fadd <128 x float> %28, %29, !dbg !17
    %31 = shufflevector <128 x float> %30, <128 x float> poison, <128 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>, !dbg !13
    %32 = fadd <128 x float> %30, %31, !dbg !17
    %33 = shufflevector <128 x float> %32, <128 x float> poison, <128 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>, !dbg !13
    %34 = fadd <128 x float> %32, %33, !dbg !17
    %35 = shufflevector <128 x float> %34, <128 x float> poison, <128 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>, !dbg !13
    %36 = fadd <128 x float> %34, %35, !dbg !17
    %37 = shufflevector <128 x float> %36, <128 x float> poison, <128 x i32> <i32 4, i32 5, i32 6, i32 7, i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>, !dbg !13
    %38 = fadd <128 x float> %36, %37, !dbg !17
    %39 = shufflevector <128 x float> %38, <128 x float> poison, <128 x i32> <i32 2, i32 3, i32 0, i32 1, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>, !dbg !13
    %40 = fadd <128 x float> %38, %39, !dbg !17
    %41 = shufflevector <128 x float> %40, <128 x float> poison, <128 x i32> <i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>, !dbg !13
    %42 = fadd <128 x float> %40, %41, !dbg !17
    %43 = extractelement <128 x float> %42, i64 0, !dbg !13
    %44 = fadd float %22, %43, !dbg !18
    %45 = add i64 %21, 512, !dbg !19
    %46 = add i64 %20, 512, !dbg !20
    %47 = add i32 %23, 128, !dbg !6
    %48 = icmp slt i32 %47, %4, !dbg !6
    br i1 %48, label %.lr.ph, label %._crit_edge, !dbg !6
  
  ._crit_edge:                                      ; preds = %.lr.ph, %12
    %.lcssa = phi float [ 0.000000e+00, %12 ], [ %44, %.lr.ph ], !dbg !21
    %49 = sext i32 %6 to i64, !dbg !22
    %50 = getelementptr float, ptr %0, i64 %49, !dbg !22
    store float %.lcssa, ptr %50, align 4, !dbg !23
    ret void, !dbg !24
  }
  
  attributes #0 = { nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none) "target-features"="+m,+f,+d,+v" }
  
  !llvm.dbg.cu = !{!0}
  !llvm.module.flags = !{!2}
  
  !0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "triton", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly)
  !1 = !DIFile(filename: "matrix-vector-multiplication.py", directory: "/home/chlee/triton-cpu/python/tutorials")
  !2 = !{i32 2, !"Debug Info Version", i32 3}
  !3 = distinct !DISubprogram(name: "gemv_kernel", linkageName: "gemv_kernel", scope: !1, file: !1, line: 19, type: !4, scopeLine: 19, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
  !4 = !DISubroutineType(cc: DW_CC_normal, types: !5)
  !5 = !{}
  !6 = !DILocation(line: 37, column: 25, scope: !3)
  !7 = !DILocation(line: 34, column: 12, scope: !3)
  !8 = !DILocation(line: 33, column: 27, scope: !3)
  !9 = !DILocation(line: 33, column: 13, scope: !3)
  !10 = !DILocation(line: 38, column: 20, scope: !3)
  !11 = !DILocation(line: 39, column: 20, scope: !3)
  !12 = !DILocation(line: 40, column: 26, scope: !3)
  !13 = !DILocation(line: 286, column: 36, scope: !14, inlinedAt: !16)
  !14 = distinct !DILexicalBlockFile(scope: !3, file: !15, discriminator: 0)
  !15 = !DIFile(filename: "standard.py", directory: "/home/chlee/triton-cpu/python/triton/language")
  !16 = !DILocation(line: 40, column: 22, scope: !3)
  !17 = !DILocation(line: 256, column: 15, scope: !14, inlinedAt: !16)
  !18 = !DILocation(line: 40, column: 15, scope: !3)
  !19 = !DILocation(line: 41, column: 13, scope: !3)
  !20 = !DILocation(line: 42, column: 13, scope: !3)
  !21 = !DILocation(line: 36, column: 19, scope: !3)
  !22 = !DILocation(line: 44, column: 12, scope: !3)
  !23 = !DILocation(line: 45, column: 16, scope: !3)
  !24 = !DILocation(line: 45, column: 4, scope: !3)
...
---
name:            gemv_kernel
alignment:       4
exposesReturnsTwice: false
legalized:       false
regBankSelected: false
selected:        false
failedISel:      false
tracksRegLiveness: true
hasWinCFI:       false
noPhis:          true
isSSA:           false
noVRegs:         false
hasFakeUses:     false
callsEHReturn:   false
callsUnwindInit: false
hasEHContTarget: false
hasEHScopes:     false
hasEHFunclets:   false
isOutlined:      false
debugInstrRef:   false
failsVerification: false
tracksDebugUserValues: false
registers:
  - { id: 0, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 1, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 2, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 3, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 4, class: fpr32, preferred-register: '', flags: [  ] }
  - { id: 5, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 6, class: fpr32, preferred-register: '', flags: [  ] }
  - { id: 7, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 8, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 9, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 10, class: fpr32, preferred-register: '', flags: [  ] }
  - { id: 11, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 12, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 13, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 14, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 15, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 16, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 17, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 18, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 19, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 20, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 21, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 22, class: fpr32, preferred-register: '', flags: [  ] }
  - { id: 23, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 24, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 25, class: fpr32, preferred-register: '', flags: [  ] }
  - { id: 26, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 27, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 28, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 29, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 30, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 31, class: gprnox0, preferred-register: '', flags: [  ] }
  - { id: 32, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 33, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 34, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 35, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 36, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 37, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 38, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 39, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 40, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 41, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 42, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 43, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 44, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 45, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 46, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 47, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 48, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 49, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 50, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 51, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 52, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 53, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 54, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 55, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 56, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 57, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 58, class: vr, preferred-register: '', flags: [  ] }
  - { id: 59, class: vrm2, preferred-register: '', flags: [  ] }
  - { id: 60, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 61, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 62, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 63, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 64, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 65, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 66, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 67, class: vr, preferred-register: '', flags: [  ] }
  - { id: 68, class: vrm2, preferred-register: '', flags: [  ] }
  - { id: 69, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 70, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 71, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 72, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 73, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 74, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 75, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 76, class: vr, preferred-register: '', flags: [  ] }
  - { id: 77, class: vrm2, preferred-register: '', flags: [  ] }
  - { id: 78, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 79, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 80, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 81, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 82, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 83, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 84, class: vr, preferred-register: '', flags: [  ] }
  - { id: 85, class: fpr32, preferred-register: '', flags: [  ] }
  - { id: 86, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 87, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 88, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 89, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 90, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 91, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 92, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 93, class: vr, preferred-register: '', flags: [  ] }
  - { id: 94, class: vrm2, preferred-register: '', flags: [  ] }
  - { id: 95, class: vr, preferred-register: '', flags: [  ] }
  - { id: 96, class: vrm2, preferred-register: '', flags: [  ] }
  - { id: 97, class: vr, preferred-register: '', flags: [  ] }
  - { id: 98, class: vrm2, preferred-register: '', flags: [  ] }
  - { id: 99, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 100, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 101, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 102, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 103, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 104, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 105, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 106, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 107, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 108, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 109, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 110, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 111, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 112, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 113, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 114, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 115, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 116, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 117, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 118, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 119, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 120, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 121, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 122, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 123, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 124, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 125, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 126, class: fpr32, preferred-register: '', flags: [  ] }
  - { id: 127, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 128, class: fpr32, preferred-register: '', flags: [  ] }
liveins:
  - { reg: '$x10', virtual-reg: '%11' }
  - { reg: '$x11', virtual-reg: '%12' }
  - { reg: '$x12', virtual-reg: '%13' }
  - { reg: '$x14', virtual-reg: '%15' }
  - { reg: '$x15', virtual-reg: '%16' }
  - { reg: '$x16', virtual-reg: '%17' }
frameInfo:
  isFrameAddressTaken: false
  isReturnAddressTaken: false
  hasStackMap:     false
  hasPatchPoint:   false
  stackSize:       0
  offsetAdjustment: 0
  maxAlignment:    8
  adjustsStack:    false
  hasCalls:        false
  stackProtector:  ''
  functionContext: ''
  maxCallFrameSize: 4294967295
  cvBytesOfCalleeSavedRegisters: 0
  hasOpaqueSPAdjustment: false
  hasVAStart:      false
  hasMustTailInVarArgFunc: false
  hasTailCall:     false
  isCalleeSavedInfoValid: false
  localFrameSize:  0
fixedStack:
  - { id: 0, type: default, offset: 24, size: 8, alignment: 8, stack-id: default, 
      isImmutable: true, isAliased: false, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 1, type: default, offset: 16, size: 8, alignment: 16, stack-id: default, 
      isImmutable: true, isAliased: false, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 2, type: default, offset: 8, size: 8, alignment: 8, stack-id: default, 
      isImmutable: true, isAliased: false, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 3, type: default, offset: 0, size: 8, alignment: 16, stack-id: default, 
      isImmutable: true, isAliased: false, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
stack:           []
entry_values:    []
callSites:       []
debugValueSubstitutions: []
constants:
  - id:              0
    value:           '<16 x i8> <i8 4, i8 5, i8 6, i8 7, i8 0, i8 1, i8 2, i8 3, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15>'
    alignment:       16
    isTargetSpecific: false
  - id:              1
    value:           '<16 x i8> <i8 2, i8 3, i8 0, i8 1, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15>'
    alignment:       16
    isTargetSpecific: false
  - id:              2
    value:           '<16 x i8> <i8 1, i8 0, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15>'
    alignment:       16
    isTargetSpecific: false
machineFunctionInfo:
  varArgsFrameIndex: 0
  varArgsSaveSize: 0
body:             |
  bb.0 (%ir-block.12):
    successors: %bb.2(0x50000000), %bb.1(0x30000000)
    liveins: $x10, $x11, $x12, $x14, $x15, $x16
  
    %17:gpr = COPY $x16
    %16:gpr = COPY $x15
    %15:gpr = COPY $x14
    %124:gpr = COPY $x12
    %12:gpr = COPY $x11
    %23:gpr = ADDIW %15, 0
    %11:gpr = COPY $x10
    BLT $x0, %23, %bb.2,  debug-location !6
  
  bb.1:
    successors: %bb.4(0x80000000)
  
    %128:fpr32 = FMV_W_X $x0
    PseudoBR %bb.4,  debug-location !6
  
  bb.2..lr.ph.preheader:
    successors: %bb.3(0x80000000)
  
    %127:gpr = COPY $x0
    %27:gpr = MUL %16, %17,  debug-location !7
    %128:fpr32 = FMV_W_X $x0
    %28:gpr = SLLIW %27, 2,  debug-location !7
    %125:gpr = ADD %28, %12,  debug-location !7
    %90:gpr = AUIPC target-flags(riscv-pcrel-hi) %const.0,  pre-instr-symbol <mcsymbol .Lpcrel_hi0>
    %57:gpr = ADDI %90, target-flags(riscv-pcrel-lo) <mcsymbol .Lpcrel_hi0>
    %58:vr = PseudoVLE8_V_M1 undef %58, %57, 16, 3 /* e8 */, 2 /* tu, ma */ :: (load (s128) from constant-pool)
    %91:gpr = AUIPC target-flags(riscv-pcrel-hi) %const.1,  pre-instr-symbol <mcsymbol .Lpcrel_hi1>
    %66:gpr = ADDI %91, target-flags(riscv-pcrel-lo) <mcsymbol .Lpcrel_hi1>
    %67:vr = PseudoVLE8_V_M1 undef %67, %66, 16, 3 /* e8 */, 2 /* tu, ma */ :: (load (s128) from constant-pool)
    %92:gpr = AUIPC target-flags(riscv-pcrel-hi) %const.2,  pre-instr-symbol <mcsymbol .Lpcrel_hi2>
    %75:gpr = ADDI %92, target-flags(riscv-pcrel-lo) <mcsymbol .Lpcrel_hi2>
    %76:vr = PseudoVLE8_V_M1 undef %76, %75, 16, 3 /* e8 */, 2 /* tu, ma */ :: (load (s128) from constant-pool)
    %31:gprnox0 = ADDI $x0, 32
    early-clobber %59:vrm2 = PseudoVSEXT_VF2_M2 undef %59, %58, 16, 4 /* e16 */, 3 /* ta, ma */
    early-clobber %68:vrm2 = PseudoVSEXT_VF2_M2 undef %68, %67, 16, 4 /* e16 */, 3 /* ta, ma */
    early-clobber %77:vrm2 = PseudoVSEXT_VF2_M2 undef %77, %76, 16, 4 /* e16 */, 3 /* ta, ma */
  
  bb.3..lr.ph:
    successors: %bb.3(0x7c000000), %bb.4(0x04000000)
  
    %30:gpr = nuw ADDI %125, 128,  debug-location !10
    %33:gpr = nuw ADDI %125, 384,  debug-location !10
    %35:gpr = nuw ADDI %125, 256,  debug-location !10
    %37:vrm8 = PseudoVLE32_V_M8 undef %37, %125, %31, 5 /* e32 */, 2 /* tu, ma */,  debug-location !10 :: (load (s1024) from %ir.24, align 4)
    %32:vrm8 = PseudoVLE32_V_M8 undef %32, %30, %31, 5 /* e32 */, 2 /* tu, ma */,  debug-location !10 :: (load (s1024) from %ir.24 + 128, align 4)
    %38:gpr = nuw ADDI %124, 128,  debug-location !11
    %34:vrm8 = PseudoVLE32_V_M8 undef %34, %33, %31, 5 /* e32 */, 2 /* tu, ma */,  debug-location !10 :: (load (s1024) from %ir.24 + 384, align 4)
    %40:gpr = nuw ADDI %124, 384,  debug-location !11
    %36:vrm8 = PseudoVLE32_V_M8 undef %36, %35, %31, 5 /* e32 */, 2 /* tu, ma */,  debug-location !10 :: (load (s1024) from %ir.24 + 256, align 4)
    %42:gpr = nuw ADDI %124, 256,  debug-location !11
    %44:vrm8 = PseudoVLE32_V_M8 undef %44, %124, %31, 5 /* e32 */, 2 /* tu, ma */,  debug-location !11 :: (load (s1024) from %ir.26, align 4)
    %43:vrm8 = PseudoVLE32_V_M8 undef %43, %42, %31, 5 /* e32 */, 2 /* tu, ma */,  debug-location !11 :: (load (s1024) from %ir.26 + 256, align 4)
    %41:vrm8 = PseudoVLE32_V_M8 undef %41, %40, %31, 5 /* e32 */, 2 /* tu, ma */,  debug-location !11 :: (load (s1024) from %ir.26 + 384, align 4)
    %39:vrm8 = PseudoVLE32_V_M8 undef %39, %38, %31, 5 /* e32 */, 2 /* tu, ma */,  debug-location !11 :: (load (s1024) from %ir.26 + 128, align 4)
    %45:vrm8 = nofpexcept PseudoVFMUL_VV_M8_E32 undef %45, %37, %44, 7, %31, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !12
    %46:vrm8 = nofpexcept PseudoVFMUL_VV_M8_E32 undef %46, %36, %43, 7, %31, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !12
    %47:vrm8 = nofpexcept PseudoVFMUL_VV_M8_E32 undef %47, %34, %41, 7, %31, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !12
    %48:vrm8 = nofpexcept PseudoVFMUL_VV_M8_E32 undef %48, %32, %39, 7, %31, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !12
    %49:vrm8 = nofpexcept PseudoVFADD_VV_M8_E32 undef %49, %48, %47, 7, %31, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !17
    %50:vrm8 = nofpexcept PseudoVFADD_VV_M8_E32 undef %50, %45, %46, 7, %31, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !17
    %51:vrm8 = nofpexcept PseudoVFADD_VV_M8_E32 undef %51, %50, %49, 7, %31, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !17
    %53:vrm8 = PseudoVSLIDEDOWN_VI_M8 undef %53, %51, 16, %31, 5 /* e32 */, 3 /* ta, ma */,  debug-location !13
    early-clobber %53:vrm8 = PseudoVSLIDEUP_VI_M8 %53, %51, 16, %31, 5 /* e32 */, 1 /* ta, mu */,  debug-location !13
    %55:vrm8 = nofpexcept PseudoVFADD_VV_M8_E32 undef %55, %51, %53, 7, %31, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !17
    early-clobber %60:vrm8 = PseudoVRGATHEREI16_VV_M8_E64_M2 undef %60, %55, %59, 16, 6 /* e64 */, 1 /* ta, mu */,  debug-location !13
    %64:vrm8 = nofpexcept PseudoVFADD_VV_M8_E32 undef %64, %55, %60, 7, %31, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !17
    early-clobber %69:vrm8 = PseudoVRGATHEREI16_VV_M8_E64_M2 undef %69, %64, %68, 16, 6 /* e64 */, 1 /* ta, mu */,  debug-location !13
    %73:vrm8 = nofpexcept PseudoVFADD_VV_M8_E32 undef %73, %64, %69, 7, %31, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !17
    early-clobber %78:vrm8 = PseudoVRGATHEREI16_VV_M8_E64_M2 undef %78, %73, %77, 16, 6 /* e64 */, 1 /* ta, mu */,  debug-location !13
    %81:vrm8 = nofpexcept PseudoVFADD_VV_M8_E32 undef %81, %73, %78, 7, %31, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !17
    early-clobber %82:vrm8 = PseudoVRGATHER_VI_M8 undef %82, %81, 1, %31, 5 /* e32 */, 1 /* ta, mu */,  debug-location !13
    %83:vrm8 = nofpexcept PseudoVFADD_VV_M8_E32 undef %83, %81, %82, 7, %31, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !17
    %85:fpr32 = PseudoVFMV_FPR32_S %83.sub_vrm1_0, 5 /* e32 */,  debug-location !13
    %125:gpr = ADDI %125, 512,  debug-location !19
    %127:gpr = ADDIW %127, 128,  debug-location !6
    %128:fpr32 = nofpexcept FADD_S %128, %85, 7, implicit $frm,  debug-location !18
    %124:gpr = ADDI %124, 512,  debug-location !20
    BLT %127, %23, %bb.3,  debug-location !6
    PseudoBR %bb.4,  debug-location !6
  
  bb.4.._crit_edge:
    %87:gpr = ADDIW %17, 0,  debug-location !22
    %88:gpr = SLLI %87, 2,  debug-location !22
    %89:gpr = ADD %11, %88,  debug-location !22
    FSW %128, %89, 0,  debug-location !23 :: (store (s32) into %ir.50)
    PseudoRET debug-location !24
...
