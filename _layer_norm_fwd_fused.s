--- |
  ; ModuleID = '_layer_norm_fwd_fused.llir'
  source_filename = "LLVMDialectModule"
  target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
  target triple = "riscv64-unknown-linux-gnu"
  
  ; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
  define void @_layer_norm_fwd_fused(ptr readonly captures(none) %0, ptr writeonly captures(none) %1, ptr readonly captures(none) %2, ptr readonly captures(none) %3, ptr writeonly captures(none) %4, ptr writeonly captures(none) %5, i32 %6, i32 %7, float %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13, i32 %14) local_unnamed_addr #0 !dbg !3 {
    %16 = mul i32 %9, %6, !dbg !6
    %17 = sext i32 %16 to i64, !dbg !7
    %18 = getelementptr float, ptr %1, i64 %17, !dbg !7
    %19 = getelementptr float, ptr %0, i64 %17, !dbg !8
    %20 = icmp sgt i32 %7, 0, !dbg !9
    br i1 %20, label %.lr.ph.preheader, label %._crit_edge, !dbg !9
  
  .lr.ph.preheader:                                 ; preds = %15
    br label %.lr.ph, !dbg !9
  
  .lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
    %21 = phi <128 x float> [ %32, %.lr.ph ], [ zeroinitializer, %.lr.ph.preheader ]
    %22 = phi i32 [ %33, %.lr.ph ], [ 0, %.lr.ph.preheader ]
    %23 = insertelement <128 x i32> poison, i32 %22, i64 0, !dbg !10
    %24 = shufflevector <128 x i32> %23, <128 x i32> poison, <128 x i32> zeroinitializer, !dbg !10
    %25 = or disjoint <128 x i32> %24, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>, !dbg !10
    %26 = insertelement <128 x i32> poison, i32 %7, i64 0, !dbg !11
    %27 = shufflevector <128 x i32> %26, <128 x i32> poison, <128 x i32> zeroinitializer, !dbg !11
    %28 = icmp slt <128 x i32> %25, %27, !dbg !11
    %29 = sext i32 %22 to i64, !dbg !12
    %30 = getelementptr float, ptr %19, i64 %29, !dbg !12
    %31 = tail call <128 x float> @llvm.masked.load.v128f32.p0(ptr %30, i32 4, <128 x i1> %28, <128 x float> zeroinitializer), !dbg !13
    %32 = fadd <128 x float> %21, %31, !dbg !14
    %33 = add i32 %22, 128, !dbg !9
    %34 = icmp slt i32 %33, %7, !dbg !9
    br i1 %34, label %.lr.ph, label %.lr.ph6.preheader, !dbg !9
  
  ._crit_edge:                                      ; preds = %15
    %35 = tail call reassoc float @llvm.vector.reduce.fadd.v128f32(float 0.000000e+00, <128 x float> zeroinitializer), !dbg !15
    %36 = sitofp i32 %7 to float, !dbg !19
    %37 = fdiv float %35, %36, !dbg !19
    %38 = insertelement <128 x float> poison, float %37, i64 0, !dbg !20
    %39 = shufflevector <128 x float> %38, <128 x float> poison, <128 x i32> zeroinitializer, !dbg !20
    br label %._crit_edge7, !dbg !21
  
  .lr.ph6.preheader:                                ; preds = %.lr.ph
    %40 = tail call reassoc float @llvm.vector.reduce.fadd.v128f32(float 0.000000e+00, <128 x float> %32), !dbg !15
    %41 = uitofp nneg i32 %7 to float, !dbg !19
    %42 = fdiv float %40, %41, !dbg !19
    %43 = insertelement <128 x float> poison, float %42, i64 0, !dbg !20
    %44 = shufflevector <128 x float> %43, <128 x float> poison, <128 x i32> zeroinitializer, !dbg !20
    br label %.lr.ph6, !dbg !21
  
  .lr.ph6:                                          ; preds = %.lr.ph6, %.lr.ph6.preheader
    %45 = phi <128 x float> [ %59, %.lr.ph6 ], [ zeroinitializer, %.lr.ph6.preheader ]
    %46 = phi i32 [ %60, %.lr.ph6 ], [ 0, %.lr.ph6.preheader ]
    %47 = insertelement <128 x i32> poison, i32 %46, i64 0, !dbg !22
    %48 = shufflevector <128 x i32> %47, <128 x i32> poison, <128 x i32> zeroinitializer, !dbg !22
    %49 = or disjoint <128 x i32> %48, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>, !dbg !22
    %50 = insertelement <128 x i32> poison, i32 %7, i64 0, !dbg !11
    %51 = shufflevector <128 x i32> %50, <128 x i32> poison, <128 x i32> zeroinitializer, !dbg !11
    %52 = icmp slt <128 x i32> %49, %51, !dbg !23
    %53 = sext i32 %46 to i64, !dbg !24
    %54 = getelementptr float, ptr %19, i64 %53, !dbg !24
    %55 = tail call <128 x float> @llvm.masked.load.v128f32.p0(ptr %54, i32 4, <128 x i1> %52, <128 x float> zeroinitializer), !dbg !25
    %56 = fsub <128 x float> %55, %44, !dbg !20
    %57 = select <128 x i1> %52, <128 x float> %56, <128 x float> zeroinitializer, !dbg !26
    %58 = fmul <128 x float> %57, %57, !dbg !27
    %59 = fadd <128 x float> %45, %58, !dbg !28
    %60 = add i32 %46, 128, !dbg !21
    %61 = icmp slt i32 %60, %7, !dbg !21
    br i1 %61, label %.lr.ph6, label %._crit_edge7, !dbg !21
  
  ._crit_edge7:                                     ; preds = %.lr.ph6, %._crit_edge
    %62 = phi <128 x float> [ %39, %._crit_edge ], [ %44, %.lr.ph6 ]
    %63 = phi float [ %37, %._crit_edge ], [ %42, %.lr.ph6 ]
    %64 = phi float [ %36, %._crit_edge ], [ %41, %.lr.ph6 ]
    %.lcssa = phi <128 x float> [ zeroinitializer, %._crit_edge ], [ %59, %.lr.ph6 ], !dbg !29
    %65 = icmp sgt i32 %7, 0, !dbg !9
    %66 = tail call reassoc float @llvm.vector.reduce.fadd.v128f32(float 0.000000e+00, <128 x float> %.lcssa), !dbg !30
    %67 = fdiv float %66, %64, !dbg !32
    %68 = fadd float %8, %67, !dbg !33
    %69 = tail call float @llvm.sqrt.f32(float %68), !dbg !34
    %70 = fdiv float 1.000000e+00, %69, !dbg !35
    %71 = sext i32 %9 to i64, !dbg !36
    %72 = getelementptr float, ptr %4, i64 %71, !dbg !36
    store float %63, ptr %72, align 4, !dbg !37
    %73 = getelementptr float, ptr %5, i64 %71, !dbg !38
    store float %70, ptr %73, align 4, !dbg !39
    br i1 %65, label %.lr.ph10.preheader, label %._crit_edge11, !dbg !40
  
  .lr.ph10.preheader:                               ; preds = %._crit_edge7
    br label %.lr.ph10, !dbg !40
  
  .lr.ph10:                                         ; preds = %.lr.ph10.preheader, %.lr.ph10
    %74 = phi i32 [ %95, %.lr.ph10 ], [ 0, %.lr.ph10.preheader ]
    %75 = insertelement <128 x i32> poison, i32 %74, i64 0, !dbg !41
    %76 = shufflevector <128 x i32> %75, <128 x i32> poison, <128 x i32> zeroinitializer, !dbg !41
    %77 = or disjoint <128 x i32> %76, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>, !dbg !41
    %78 = insertelement <128 x i32> poison, i32 %7, i64 0, !dbg !11
    %79 = shufflevector <128 x i32> %78, <128 x i32> poison, <128 x i32> zeroinitializer, !dbg !11
    %80 = icmp slt <128 x i32> %77, %79, !dbg !42
    %81 = sext i32 %74 to i64, !dbg !43
    %82 = getelementptr float, ptr %2, i64 %81, !dbg !43
    %83 = tail call <128 x float> @llvm.masked.load.v128f32.p0(ptr %82, i32 4, <128 x i1> %80, <128 x float> zeroinitializer), !dbg !44
    %84 = getelementptr float, ptr %3, i64 %81, !dbg !45
    %85 = tail call <128 x float> @llvm.masked.load.v128f32.p0(ptr %84, i32 4, <128 x i1> %80, <128 x float> zeroinitializer), !dbg !46
    %86 = getelementptr float, ptr %19, i64 %81, !dbg !47
    %87 = tail call <128 x float> @llvm.masked.load.v128f32.p0(ptr %86, i32 4, <128 x i1> %80, <128 x float> zeroinitializer), !dbg !48
    %88 = fsub <128 x float> %87, %62, !dbg !49
    %89 = insertelement <128 x float> poison, float %70, i64 0, !dbg !50
    %90 = shufflevector <128 x float> %89, <128 x float> poison, <128 x i32> zeroinitializer, !dbg !50
    %91 = fmul <128 x float> %90, %88, !dbg !50
    %92 = fmul <128 x float> %83, %91, !dbg !51
    %93 = fadd <128 x float> %85, %92, !dbg !52
    %94 = getelementptr float, ptr %18, i64 %81, !dbg !53
    tail call void @llvm.masked.store.v128f32.p0(<128 x float> %93, ptr %94, i32 4, <128 x i1> %80), !dbg !54
    %95 = add i32 %74, 128, !dbg !40
    %96 = icmp slt i32 %95, %7, !dbg !40
    br i1 %96, label %.lr.ph10, label %._crit_edge11, !dbg !40
  
  ._crit_edge11:                                    ; preds = %.lr.ph10, %._crit_edge7
    ret void, !dbg !55
  }
  
  ; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
  declare float @llvm.vector.reduce.fadd.v128f32(float, <128 x float>) #1
  
  ; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
  declare float @llvm.sqrt.f32(float) #1
  
  ; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
  declare <128 x float> @llvm.masked.load.v128f32.p0(ptr captures(none), i32 immarg, <128 x i1>, <128 x float>) #2
  
  ; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
  declare void @llvm.masked.store.v128f32.p0(<128 x float>, ptr captures(none), i32 immarg, <128 x i1>) #3
  
  attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "target-features"="+m,+f,+d,+v" }
  attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) "target-features"="+m,+f,+d,+v" }
  attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: read) "target-features"="+m,+f,+d,+v" }
  attributes #3 = { nocallback nofree nosync nounwind willreturn memory(argmem: write) "target-features"="+m,+f,+d,+v" }
  
  !llvm.dbg.cu = !{!0}
  !llvm.module.flags = !{!2}
  
  !0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "triton", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly)
  !1 = !DIFile(filename: "05-layer-norm.py", directory: "/home/chlee/triton-cpu/python/tutorials")
  !2 = !{i32 2, !"Debug Info Version", i32 3}
  !3 = distinct !DISubprogram(name: "_layer_norm_fwd_fused", linkageName: "_layer_norm_fwd_fused", scope: !1, file: !1, line: 49, type: !4, scopeLine: 49, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
  !4 = !DISubroutineType(cc: DW_CC_normal, types: !5)
  !5 = !{}
  !6 = !DILocation(line: 63, column: 15, scope: !3)
  !7 = !DILocation(line: 63, column: 9, scope: !3)
  !8 = !DILocation(line: 64, column: 9, scope: !3)
  !9 = !DILocation(line: 68, column: 27, scope: !3)
  !10 = !DILocation(line: 69, column: 21, scope: !3)
  !11 = !DILocation(line: 70, column: 42, scope: !3)
  !12 = !DILocation(line: 70, column: 24, scope: !3)
  !13 = !DILocation(line: 70, column: 20, scope: !3)
  !14 = !DILocation(line: 71, column: 17, scope: !3)
  !15 = !DILocation(line: 286, column: 36, scope: !16, inlinedAt: !18)
  !16 = distinct !DILexicalBlockFile(scope: !3, file: !17, discriminator: 0)
  !17 = !DIFile(filename: "standard.py", directory: "/home/chlee/triton-cpu/python/triton/language")
  !18 = !DILocation(line: 72, column: 18, scope: !3)
  !19 = !DILocation(line: 72, column: 35, scope: !3)
  !20 = !DILocation(line: 78, column: 35, scope: !3)
  !21 = !DILocation(line: 75, column: 27, scope: !3)
  !22 = !DILocation(line: 76, column: 21, scope: !3)
  !23 = !DILocation(line: 77, column: 42, scope: !3)
  !24 = !DILocation(line: 77, column: 24, scope: !3)
  !25 = !DILocation(line: 77, column: 20, scope: !3)
  !26 = !DILocation(line: 78, column: 41, scope: !3)
  !27 = !DILocation(line: 79, column: 20, scope: !3)
  !28 = !DILocation(line: 79, column: 16, scope: !3)
  !29 = !DILocation(line: 74, column: 20, scope: !3)
  !30 = !DILocation(line: 286, column: 36, scope: !16, inlinedAt: !31)
  !31 = !DILocation(line: 80, column: 17, scope: !3)
  !32 = !DILocation(line: 80, column: 33, scope: !3)
  !33 = !DILocation(line: 81, column: 29, scope: !3)
  !34 = !DILocation(line: 81, column: 23, scope: !3)
  !35 = !DILocation(line: 81, column: 15, scope: !3)
  !36 = !DILocation(line: 83, column: 20, scope: !3)
  !37 = !DILocation(line: 83, column: 25, scope: !3)
  !38 = !DILocation(line: 84, column: 20, scope: !3)
  !39 = !DILocation(line: 84, column: 25, scope: !3)
  !40 = !DILocation(line: 86, column: 27, scope: !3)
  !41 = !DILocation(line: 87, column: 21, scope: !3)
  !42 = !DILocation(line: 88, column: 22, scope: !3)
  !43 = !DILocation(line: 89, column: 24, scope: !3)
  !44 = !DILocation(line: 89, column: 20, scope: !3)
  !45 = !DILocation(line: 90, column: 24, scope: !3)
  !46 = !DILocation(line: 90, column: 20, scope: !3)
  !47 = !DILocation(line: 91, column: 24, scope: !3)
  !48 = !DILocation(line: 91, column: 20, scope: !3)
  !49 = !DILocation(line: 92, column: 21, scope: !3)
  !50 = !DILocation(line: 92, column: 29, scope: !3)
  !51 = !DILocation(line: 93, column: 20, scope: !3)
  !52 = !DILocation(line: 93, column: 24, scope: !3)
  !53 = !DILocation(line: 95, column: 21, scope: !3)
  !54 = !DILocation(line: 95, column: 27, scope: !3)
  !55 = !DILocation(line: 86, column: 4, scope: !3)
...
---
name:            _layer_norm_fwd_fused
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
  - { id: 2, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 3, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 4, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 5, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 6, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 7, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 8, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 9, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 10, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 11, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 12, class: fpr32, preferred-register: '', flags: [  ] }
  - { id: 13, class: fpr32, preferred-register: '', flags: [  ] }
  - { id: 14, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 15, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 16, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 17, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 18, class: fpr32, preferred-register: '', flags: [  ] }
  - { id: 19, class: fpr32, preferred-register: '', flags: [  ] }
  - { id: 20, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 21, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 22, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 23, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 24, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 25, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 26, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 27, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 28, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 29, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 30, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 31, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 32, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 33, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 34, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 35, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 36, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 37, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 38, class: fpr32, preferred-register: '', flags: [  ] }
  - { id: 39, class: fpr32, preferred-register: '', flags: [  ] }
  - { id: 40, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 41, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 42, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 43, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 44, class: fpr32, preferred-register: '', flags: [  ] }
  - { id: 45, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 46, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 47, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 48, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 49, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 50, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 51, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 52, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 53, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 54, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 55, class: fpr32, preferred-register: '', flags: [  ] }
  - { id: 56, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 57, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 58, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 59, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 60, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 61, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 62, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 63, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 64, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 65, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 66, class: gprnox0, preferred-register: '', flags: [  ] }
  - { id: 67, class: vr, preferred-register: '', flags: [  ] }
  - { id: 68, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 69, class: vr, preferred-register: '', flags: [  ] }
  - { id: 70, class: fpr32, preferred-register: '', flags: [  ] }
  - { id: 71, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 72, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 73, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 74, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 75, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 76, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 77, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 78, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 79, class: gprnox0, preferred-register: '', flags: [  ] }
  - { id: 80, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 81, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 82, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 83, class: gprnox0, preferred-register: '', flags: [  ] }
  - { id: 84, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 85, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 86, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 87, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 88, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 89, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 90, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 91, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 92, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 93, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 94, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 95, class: vr, preferred-register: '', flags: [  ] }
  - { id: 96, class: vr, preferred-register: '', flags: [  ] }
  - { id: 97, class: vr, preferred-register: '', flags: [  ] }
  - { id: 98, class: vr, preferred-register: '', flags: [  ] }
  - { id: 99, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 100, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 101, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 102, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 103, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 104, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 105, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 106, class: vmv0, preferred-register: '', flags: [  ] }
  - { id: 107, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 108, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 109, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 110, class: vmv0, preferred-register: '', flags: [  ] }
  - { id: 111, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 112, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 113, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 114, class: vmv0, preferred-register: '', flags: [  ] }
  - { id: 115, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 116, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 117, class: vmv0, preferred-register: '', flags: [  ] }
  - { id: 118, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 119, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 120, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 121, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 122, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 123, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 124, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 125, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 126, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 127, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 128, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 129, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 130, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 131, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 132, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 133, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 134, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 135, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 136, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 137, class: gprnox0, preferred-register: '', flags: [  ] }
  - { id: 138, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 139, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 140, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 141, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 142, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 143, class: vr, preferred-register: '', flags: [  ] }
  - { id: 144, class: vr, preferred-register: '', flags: [  ] }
  - { id: 145, class: fpr32, preferred-register: '', flags: [  ] }
  - { id: 146, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 147, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 148, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 149, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 150, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 151, class: gprnox0, preferred-register: '', flags: [  ] }
  - { id: 152, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 153, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 154, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 155, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 156, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 157, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 158, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 159, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 160, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 161, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 162, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 163, class: vr, preferred-register: '', flags: [  ] }
  - { id: 164, class: vr, preferred-register: '', flags: [  ] }
  - { id: 165, class: vr, preferred-register: '', flags: [  ] }
  - { id: 166, class: vr, preferred-register: '', flags: [  ] }
  - { id: 167, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 168, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 169, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 170, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 171, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 172, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 173, class: vmv0, preferred-register: '', flags: [  ] }
  - { id: 174, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 175, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 176, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 177, class: vmv0, preferred-register: '', flags: [  ] }
  - { id: 178, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 179, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 180, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 181, class: vmv0, preferred-register: '', flags: [  ] }
  - { id: 182, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 183, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 184, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 185, class: vmv0, preferred-register: '', flags: [  ] }
  - { id: 186, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 187, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 188, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 189, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 190, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 191, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 192, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 193, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 194, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 195, class: vmv0, preferred-register: '', flags: [  ] }
  - { id: 196, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 197, class: vmv0, preferred-register: '', flags: [  ] }
  - { id: 198, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 199, class: vmv0, preferred-register: '', flags: [  ] }
  - { id: 200, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 201, class: vmv0, preferred-register: '', flags: [  ] }
  - { id: 202, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 203, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 204, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 205, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 206, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 207, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 208, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 209, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 210, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 211, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 212, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 213, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 214, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 215, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 216, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 217, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 218, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 219, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 220, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 221, class: gprnox0, preferred-register: '', flags: [  ] }
  - { id: 222, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 223, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 224, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 225, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 226, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 227, class: vr, preferred-register: '', flags: [  ] }
  - { id: 228, class: vr, preferred-register: '', flags: [  ] }
  - { id: 229, class: fpr32, preferred-register: '', flags: [  ] }
  - { id: 230, class: fpr32, preferred-register: '', flags: [  ] }
  - { id: 231, class: fpr32, preferred-register: '', flags: [  ] }
  - { id: 232, class: fpr32, preferred-register: '', flags: [  ] }
  - { id: 233, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 234, class: fpr32, preferred-register: '', flags: [  ] }
  - { id: 235, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 236, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 237, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 238, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 239, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 240, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 241, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 242, class: gprnox0, preferred-register: '', flags: [  ] }
  - { id: 243, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 244, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 245, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 246, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 247, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 248, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 249, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 250, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 251, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 252, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 253, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 254, class: vr, preferred-register: '', flags: [  ] }
  - { id: 255, class: vr, preferred-register: '', flags: [  ] }
  - { id: 256, class: vr, preferred-register: '', flags: [  ] }
  - { id: 257, class: vr, preferred-register: '', flags: [  ] }
  - { id: 258, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 259, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 260, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 261, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 262, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 263, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 264, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 265, class: vmv0, preferred-register: '', flags: [  ] }
  - { id: 266, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 267, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 268, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 269, class: vmv0, preferred-register: '', flags: [  ] }
  - { id: 270, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 271, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 272, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 273, class: vmv0, preferred-register: '', flags: [  ] }
  - { id: 274, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 275, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 276, class: vmv0, preferred-register: '', flags: [  ] }
  - { id: 277, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 278, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 279, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 280, class: vmv0, preferred-register: '', flags: [  ] }
  - { id: 281, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 282, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 283, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 284, class: vmv0, preferred-register: '', flags: [  ] }
  - { id: 285, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 286, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 287, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 288, class: vmv0, preferred-register: '', flags: [  ] }
  - { id: 289, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 290, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 291, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 292, class: vmv0, preferred-register: '', flags: [  ] }
  - { id: 293, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 294, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 295, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 296, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 297, class: vmv0, preferred-register: '', flags: [  ] }
  - { id: 298, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 299, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 300, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 301, class: vmv0, preferred-register: '', flags: [  ] }
  - { id: 302, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 303, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 304, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 305, class: vmv0, preferred-register: '', flags: [  ] }
  - { id: 306, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 307, class: vrm8nov0, preferred-register: '', flags: [  ] }
  - { id: 308, class: vmv0, preferred-register: '', flags: [  ] }
  - { id: 309, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 310, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 311, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 312, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 313, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 314, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 315, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 316, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 317, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 318, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 319, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 320, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 321, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 322, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 323, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 324, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 325, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 326, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 327, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 328, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 329, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 330, class: vmv0, preferred-register: '', flags: [  ] }
  - { id: 331, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 332, class: vmv0, preferred-register: '', flags: [  ] }
  - { id: 333, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 334, class: vmv0, preferred-register: '', flags: [  ] }
  - { id: 335, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 336, class: vmv0, preferred-register: '', flags: [  ] }
  - { id: 337, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 338, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 339, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 340, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 341, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 342, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 343, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 344, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 345, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 346, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 347, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 348, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 349, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 350, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 351, class: vr, preferred-register: '', flags: [  ] }
  - { id: 352, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 353, class: vr, preferred-register: '', flags: [  ] }
  - { id: 354, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 355, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 356, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 357, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 358, class: vr, preferred-register: '', flags: [  ] }
  - { id: 359, class: vr, preferred-register: '', flags: [  ] }
  - { id: 360, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 361, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 362, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 363, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 364, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 365, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 366, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 367, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 368, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 369, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 370, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 371, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 372, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 373, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 374, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 375, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 376, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 377, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 378, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 379, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 380, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 381, class: vr, preferred-register: '', flags: [  ] }
  - { id: 382, class: vr, preferred-register: '', flags: [  ] }
  - { id: 383, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 384, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 385, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 386, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 387, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 388, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 389, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 390, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 391, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 392, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 393, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 394, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 395, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 396, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 397, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 398, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 399, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 400, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 401, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 402, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 403, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 404, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 405, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 406, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 407, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 408, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 409, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 410, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 411, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 412, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 413, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 414, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 415, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 416, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 417, class: gpr, preferred-register: '', flags: [  ] }
  - { id: 418, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 419, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 420, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 421, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 422, class: fpr32, preferred-register: '', flags: [  ] }
  - { id: 423, class: fpr32, preferred-register: '', flags: [  ] }
  - { id: 424, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 425, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 426, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 427, class: vrm8, preferred-register: '', flags: [  ] }
  - { id: 428, class: gpr, preferred-register: '', flags: [  ] }
liveins:
  - { reg: '$x10', virtual-reg: '%47' }
  - { reg: '$x11', virtual-reg: '%48' }
  - { reg: '$x12', virtual-reg: '%49' }
  - { reg: '$x13', virtual-reg: '%50' }
  - { reg: '$x14', virtual-reg: '%51' }
  - { reg: '$x15', virtual-reg: '%52' }
  - { reg: '$x16', virtual-reg: '%53' }
  - { reg: '$x17', virtual-reg: '%54' }
  - { reg: '$f10_f', virtual-reg: '%55' }
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
  - { id: 0, type: default, offset: 40, size: 8, alignment: 8, stack-id: default, 
      isImmutable: true, isAliased: false, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 1, type: default, offset: 32, size: 8, alignment: 16, stack-id: default, 
      isImmutable: true, isAliased: false, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 2, type: default, offset: 24, size: 8, alignment: 8, stack-id: default, 
      isImmutable: true, isAliased: false, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 3, type: default, offset: 16, size: 8, alignment: 16, stack-id: default, 
      isImmutable: true, isAliased: false, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 4, type: default, offset: 8, size: 8, alignment: 8, stack-id: default, 
      isImmutable: true, isAliased: false, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 5, type: default, offset: 0, size: 8, alignment: 16, stack-id: default, 
      isImmutable: true, isAliased: false, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
stack:           []
entry_values:    []
callSites:       []
debugValueSubstitutions: []
constants:       []
machineFunctionInfo:
  varArgsFrameIndex: 0
  varArgsSaveSize: 0
body:             |
  bb.0 (%ir-block.15):
    successors: %bb.1(0x50000000), %bb.3(0x30000000)
    liveins: $x10, $x11, $x12, $x13, $x14, $x15, $x16, $x17, $f10_f
  
    %55:fpr32 = COPY $f10_f
    %54:gpr = COPY $x17
    %53:gpr = COPY $x16
    %52:gpr = COPY $x15
    %51:gpr = COPY $x14
    %50:gpr = COPY $x13
    %49:gpr = COPY $x12
    %48:gpr = COPY $x11
    %47:gpr = COPY $x10
    %57:gpr = LW %fixed-stack.5, 0 :: (load (s64) from %fixed-stack.5, align 16)
    %58:gpr = ADDIW %54, 0
    %59:gpr = MULW %57, %53,  debug-location !6
    %60:gpr = SLLI %59, 2,  debug-location !7
    %1:gpr = ADD %47, %60,  debug-location !8
    BGE $x0, %58, %bb.3,  debug-location !9
    PseudoBR %bb.1,  debug-location !9
  
  bb.1..lr.ph.preheader:
    successors: %bb.2(0x80000000)
  
    %412:gpr = COPY $x0
    %79:gprnox0 = ADDI $x0, 32
    %74:vrm8 = PseudoVMV_V_I_M8 undef %74, 0, %79, 5 /* e32 */, 0 /* tu, mu */
    %85:gpr = ADDI $x0, 64
    %88:gpr = ADDI $x0, 96
    %408:vrm8 = COPY %74
    %409:vrm8 = COPY %74
    %410:vrm8 = COPY %74
    %411:vrm8 = COPY %74
  
  bb.2..lr.ph:
    successors: %bb.2(0x7c000000), %bb.4(0x04000000)
  
    %84:vrm8 = PseudoVID_V_M8 undef %84, %79, 5 /* e32 */, 1 /* ta, mu */,  debug-location !10
    %100:gpr = SLLI %412, 2,  debug-location !12
    %104:vrm8nov0 = COPY %74,  debug-location !13
    %86:vrm8 = PseudoVADD_VX_M8 undef %86, %84, %85, %79, 5 /* e32 */, 1 /* ta, mu */,  debug-location !10
    %92:vrm8 = PseudoVADD_VX_M8 undef %92, %84, %79, %79, 5 /* e32 */, 1 /* ta, mu */,  debug-location !10
    %101:gpr = ADD %1, %100,  debug-location !12
    %93:vrm8 = disjoint PseudoVOR_VX_M8 undef %93, %92, %412, %79, 5 /* e32 */, 1 /* ta, mu */,  debug-location !10
    early-clobber %98:vr = PseudoVMSLT_VX_M8 %93, %54, %79, 5 /* e32 */,  debug-location !11
    %102:gpr = ADDI %101, 128,  debug-location !13
    $v0 = COPY %98,  debug-location !13
    %104:vrm8nov0 = PseudoVLE32_V_M8_MASK %104, %102, $v0, %79, 5 /* e32 */, 1 /* ta, mu */,  debug-location !13 :: (load unknown-size from %ir.30 + 128, align 4)
    %91:vrm8 = disjoint PseudoVOR_VX_M8 undef %91, %84, %412, %79, 5 /* e32 */, 1 /* ta, mu */,  debug-location !10
    %87:vrm8 = disjoint PseudoVOR_VX_M8 undef %87, %86, %412, %79, 5 /* e32 */, 1 /* ta, mu */,  debug-location !10
    early-clobber %95:vr = PseudoVMSLT_VX_M8 %91, %54, %79, 5 /* e32 */,  debug-location !11
    early-clobber %97:vr = PseudoVMSLT_VX_M8 %87, %54, %79, 5 /* e32 */,  debug-location !11
    %108:vrm8nov0 = COPY %74,  debug-location !13
    %89:vrm8 = PseudoVADD_VX_M8 undef %89, %84, %88, %79, 5 /* e32 */, 1 /* ta, mu */,  debug-location !10
    %90:vrm8 = disjoint PseudoVOR_VX_M8 undef %90, %89, %412, %79, 5 /* e32 */, 1 /* ta, mu */,  debug-location !10
    %107:gpr = ADDI %101, 256,  debug-location !13
    $v0 = COPY %97,  debug-location !13
    %108:vrm8nov0 = PseudoVLE32_V_M8_MASK %108, %107, $v0, %79, 5 /* e32 */, 1 /* ta, mu */,  debug-location !13 :: (load unknown-size from %ir.30 + 256, align 4)
    early-clobber %96:vr = PseudoVMSLT_VX_M8 %90, %54, %79, 5 /* e32 */,  debug-location !11
    %112:vrm8nov0 = COPY %74,  debug-location !13
    %111:gpr = ADDI %101, 384,  debug-location !13
    $v0 = COPY %96,  debug-location !13
    %112:vrm8nov0 = PseudoVLE32_V_M8_MASK %112, %111, $v0, %79, 5 /* e32 */, 1 /* ta, mu */,  debug-location !13 :: (load unknown-size from %ir.30 + 384, align 4)
    %115:vrm8nov0 = COPY %74,  debug-location !13
    $v0 = COPY %95,  debug-location !13
    %115:vrm8nov0 = PseudoVLE32_V_M8_MASK %115, %101, $v0, %79, 5 /* e32 */, 1 /* ta, mu */,  debug-location !13 :: (load unknown-size from %ir.30, align 4)
    %410:vrm8 = nofpexcept PseudoVFADD_VV_M8_E32 undef %410, %410, %108, 7, %79, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !14
    %411:vrm8 = nofpexcept PseudoVFADD_VV_M8_E32 undef %411, %411, %112, 7, %79, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !14
    %408:vrm8 = nofpexcept PseudoVFADD_VV_M8_E32 undef %408, %408, %115, 7, %79, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !14
    %412:gpr = ADDIW %412, 128,  debug-location !9
    %409:vrm8 = nofpexcept PseudoVFADD_VV_M8_E32 undef %409, %409, %104, 7, %79, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !14
    BLT %412, %58, %bb.2,  debug-location !9
    PseudoBR %bb.4,  debug-location !9
  
  bb.3.._crit_edge:
    successors: %bb.6(0x80000000)
  
    %66:gprnox0 = ADDI $x0, 32
    %67:vr = PseudoVMV_S_X undef %67, $x0, %66, 5 /* e32 */,  debug-location !15
    %424:vrm8 = PseudoVMV_V_I_M8 undef %424, 0, %66, 5 /* e32 */, 0 /* tu, mu */,  debug-location !15
    %69:vr = nofpexcept PseudoVFREDUSUM_VS_M8_E32 undef %69, %424, %67, 7, %66, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !15
    %70:fpr32 = PseudoVFMV_FPR32_S %69, 5 /* e32 */,  debug-location !15
    %423:fpr32 = nofpexcept FCVT_S_W %54, 7, implicit $frm,  debug-location !19
    %422:fpr32 = nofpexcept FDIV_S %70, %423, 7, implicit $frm,  debug-location !19
    %421:vrm8 = PseudoVFMV_V_FPR32_M8 undef %421, %422, %66, 5 /* e32 */, 0 /* tu, mu */,  debug-location !20
    %425:vrm8 = COPY %424
    %426:vrm8 = COPY %424
    %427:vrm8 = COPY %424
    PseudoBR %bb.6,  debug-location !21
  
  bb.4..lr.ph6.preheader:
    successors: %bb.5(0x80000000)
  
    %417:gpr = COPY $x0
    %137:gprnox0 = ADDI $x0, 32
    %423:fpr32 = nofpexcept FCVT_S_WU %54, 7, implicit $frm,  debug-location !19
    %138:vrm8 = reassoc nofpexcept PseudoVFADD_VV_M8_E32 undef %138, %408, %410, 7, %137, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !15
    %141:vrm8 = reassoc nofpexcept PseudoVFADD_VV_M8_E32 undef %141, %409, %411, 7, %137, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !15
    %143:vr = PseudoVMV_S_X undef %143, $x0, %137, 5 /* e32 */,  debug-location !15
    %142:vrm8 = reassoc nofpexcept PseudoVFADD_VV_M8_E32 undef %142, %138, %141, 7, %137, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !15
    %144:vr = nofpexcept PseudoVFREDUSUM_VS_M8_E32 undef %144, %142, %143, 7, %137, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !15
    %145:fpr32 = PseudoVFMV_FPR32_S %144, 5 /* e32 */,  debug-location !15
    %422:fpr32 = nofpexcept FDIV_S %145, %423, 7, implicit $frm,  debug-location !19
    %154:gpr = ADDI $x0, 96
    %130:vrm8 = PseudoVMV_V_I_M8 undef %130, 0, %137, 5 /* e32 */, 0 /* tu, mu */
    %421:vrm8 = PseudoVFMV_V_FPR32_M8 undef %421, %422, %137, 5 /* e32 */, 0 /* tu, mu */,  debug-location !20
    %157:gpr = ADDI $x0, 64
    %424:vrm8 = COPY %130
    %425:vrm8 = COPY %130
    %426:vrm8 = COPY %130
    %427:vrm8 = COPY %130
  
  bb.5..lr.ph6:
    successors: %bb.5(0x7c000000), %bb.6(0x04000000)
  
    %152:vrm8 = PseudoVID_V_M8 undef %152, %137, 5 /* e32 */, 1 /* ta, mu */,  debug-location !22
    %168:gpr = SLLI %417, 2,  debug-location !24
    %171:vrm8nov0 = COPY %130,  debug-location !25
    %153:vrm8 = disjoint PseudoVOR_VX_M8 undef %153, %152, %417, %137, 5 /* e32 */, 1 /* ta, mu */,  debug-location !22
    %158:vrm8 = PseudoVADD_VX_M8 undef %158, %152, %157, %137, 5 /* e32 */, 1 /* ta, mu */,  debug-location !22
    %159:vrm8 = disjoint PseudoVOR_VX_M8 undef %159, %158, %417, %137, 5 /* e32 */, 1 /* ta, mu */,  debug-location !22
    early-clobber %165:vr = PseudoVMSLT_VX_M8 %153, %54, %137, 5 /* e32 */,  debug-location !23
    early-clobber %163:vr = PseudoVMSLT_VX_M8 %159, %54, %137, 5 /* e32 */,  debug-location !23
    %155:vrm8 = PseudoVADD_VX_M8 undef %155, %152, %154, %137, 5 /* e32 */, 1 /* ta, mu */,  debug-location !22
    %156:vrm8 = disjoint PseudoVOR_VX_M8 undef %156, %155, %417, %137, 5 /* e32 */, 1 /* ta, mu */,  debug-location !22
    early-clobber %164:vr = PseudoVMSLT_VX_M8 %156, %54, %137, 5 /* e32 */,  debug-location !23
    %175:vrm8nov0 = COPY %130,  debug-location !25
    %160:vrm8 = PseudoVADD_VX_M8 undef %160, %152, %137, %137, 5 /* e32 */, 1 /* ta, mu */,  debug-location !22
    %161:vrm8 = disjoint PseudoVOR_VX_M8 undef %161, %160, %417, %137, 5 /* e32 */, 1 /* ta, mu */,  debug-location !22
    early-clobber %166:vr = PseudoVMSLT_VX_M8 %161, %54, %137, 5 /* e32 */,  debug-location !23
    %179:vrm8nov0 = COPY %130,  debug-location !25
    %169:gpr = ADD %1, %168,  debug-location !24
    %174:gpr = ADDI %169, 384,  debug-location !25
    $v0 = COPY %165,  debug-location !25
    %171:vrm8nov0 = PseudoVLE32_V_M8_MASK %171, %169, $v0, %137, 5 /* e32 */, 1 /* ta, mu */,  debug-location !25 :: (load unknown-size from %ir.54, align 4)
    $v0 = COPY %164,  debug-location !25
    %175:vrm8nov0 = PseudoVLE32_V_M8_MASK %175, %174, $v0, %137, 5 /* e32 */, 1 /* ta, mu */,  debug-location !25 :: (load unknown-size from %ir.54 + 384, align 4)
    %178:gpr = ADDI %169, 256,  debug-location !25
    %182:gpr = ADDI %169, 128,  debug-location !25
    $v0 = COPY %163,  debug-location !25
    %179:vrm8nov0 = PseudoVLE32_V_M8_MASK %179, %178, $v0, %137, 5 /* e32 */, 1 /* ta, mu */,  debug-location !25 :: (load unknown-size from %ir.54 + 256, align 4)
    %183:vrm8nov0 = COPY %130,  debug-location !25
    $v0 = COPY %166,  debug-location !25
    %183:vrm8nov0 = PseudoVLE32_V_M8_MASK %183, %182, $v0, %137, 5 /* e32 */, 1 /* ta, mu */,  debug-location !25 :: (load unknown-size from %ir.54 + 128, align 4)
    %194:vrm8nov0 = COPY %130,  debug-location !20
    $v0 = COPY %165,  debug-location !20
    %194:vrm8nov0 = nofpexcept PseudoVFSUB_VV_M8_E32_MASK %194, %171, %421, $v0, 7, %137, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !20
    %196:vrm8nov0 = COPY %130,  debug-location !20
    $v0 = COPY %164,  debug-location !20
    %196:vrm8nov0 = nofpexcept PseudoVFSUB_VV_M8_E32_MASK %196, %175, %421, $v0, 7, %137, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !20
    %198:vrm8nov0 = COPY %130,  debug-location !20
    $v0 = COPY %163,  debug-location !20
    %198:vrm8nov0 = nofpexcept PseudoVFSUB_VV_M8_E32_MASK %198, %179, %421, $v0, 7, %137, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !20
    %204:vrm8 = nofpexcept PseudoVFMUL_VV_M8_E32 undef %204, %194, %194, 7, %137, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !27
    %200:vrm8nov0 = COPY %130,  debug-location !20
    $v0 = COPY %166,  debug-location !20
    %200:vrm8nov0 = nofpexcept PseudoVFSUB_VV_M8_E32_MASK %200, %183, %421, $v0, 7, %137, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !20
    %203:vrm8 = nofpexcept PseudoVFMUL_VV_M8_E32 undef %203, %196, %196, 7, %137, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !27
    %202:vrm8 = nofpexcept PseudoVFMUL_VV_M8_E32 undef %202, %198, %198, 7, %137, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !27
    %205:vrm8 = nofpexcept PseudoVFMUL_VV_M8_E32 undef %205, %200, %200, 7, %137, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !27
    %424:vrm8 = nofpexcept PseudoVFADD_VV_M8_E32 undef %424, %424, %204, 7, %137, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !28
    %427:vrm8 = nofpexcept PseudoVFADD_VV_M8_E32 undef %427, %427, %203, 7, %137, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !28
    %426:vrm8 = nofpexcept PseudoVFADD_VV_M8_E32 undef %426, %426, %202, 7, %137, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !28
    %417:gpr = ADDIW %417, 128,  debug-location !21
    %425:vrm8 = nofpexcept PseudoVFADD_VV_M8_E32 undef %425, %425, %205, 7, %137, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !28
    BLT %417, %58, %bb.5,  debug-location !21
    PseudoBR %bb.6,  debug-location !21
  
  bb.6.._crit_edge7:
    successors: %bb.7(0x50000000), %bb.9(0x30000000)
  
    %221:gprnox0 = ADDI $x0, 32
    %222:vrm8 = reassoc nofpexcept PseudoVFADD_VV_M8_E32 undef %222, %424, %426, 7, %221, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !30
    %225:vrm8 = reassoc nofpexcept PseudoVFADD_VV_M8_E32 undef %225, %425, %427, 7, %221, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !30
    %226:vrm8 = reassoc nofpexcept PseudoVFADD_VV_M8_E32 undef %226, %222, %225, 7, %221, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !30
    %227:vr = PseudoVMV_S_X undef %227, $x0, %221, 5 /* e32 */,  debug-location !30
    %228:vr = nofpexcept PseudoVFREDUSUM_VS_M8_E32 undef %228, %226, %227, 7, %221, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !30
    %229:fpr32 = PseudoVFMV_FPR32_S %228, 5 /* e32 */,  debug-location !30
    %230:fpr32 = nofpexcept FDIV_S %229, %423, 7, implicit $frm,  debug-location !32
    %231:fpr32 = nofpexcept FADD_S %55, %230, 7, implicit $frm,  debug-location !33
    %232:fpr32 = nofpexcept FSQRT_S %231, 7, implicit $frm,  debug-location !34
    %233:gpr = LUI 260096
    %234:fpr32 = FMV_W_X %233
    %44:fpr32 = nofpexcept FDIV_S %234, %232, 7, implicit $frm,  debug-location !35
    %236:gpr = SLLI %57, 2,  debug-location !36
    %237:gpr = ADD %51, %236,  debug-location !36
    FSW %422, %237, 0,  debug-location !37 :: (store (s32) into %ir.72)
    %238:gpr = ADD %52, %236,  debug-location !38
    FSW %44, %238, 0,  debug-location !39 :: (store (s32) into %ir.73)
    BGE $x0, %58, %bb.9,  debug-location !40
    PseudoBR %bb.7,  debug-location !40
  
  bb.7..lr.ph10.preheader:
    successors: %bb.8(0x80000000)
  
    %428:gpr = COPY $x0
    %0:gpr = ADD %48, %60
    %244:gpr = ADDI $x0, 64
    %247:gpr = ADDI $x0, 96
  
  bb.8..lr.ph10:
    successors: %bb.8(0x7c000000), %bb.9(0x04000000)
  
    %243:vrm8 = PseudoVID_V_M8 undef %243, %221, 5 /* e32 */, 1 /* ta, mu */,  debug-location !41
    %259:gpr = SLLI %428, 2,  debug-location !43
    %306:vrm8nov0 = PseudoVMV_V_I_M8 undef %306, 0, %221, 5 /* e32 */, 0 /* tu, mu */,  debug-location !44
    %248:vrm8 = PseudoVADD_VX_M8 undef %248, %243, %247, %221, 5 /* e32 */, 1 /* ta, mu */,  debug-location !41
    %250:vrm8 = disjoint PseudoVOR_VX_M8 undef %250, %243, %428, %221, 5 /* e32 */, 1 /* ta, mu */,  debug-location !41
    %249:vrm8 = disjoint PseudoVOR_VX_M8 undef %249, %248, %428, %221, 5 /* e32 */, 1 /* ta, mu */,  debug-location !41
    early-clobber %254:vr = PseudoVMSLT_VX_M8 %250, %54, %221, 5 /* e32 */,  debug-location !42
    early-clobber %255:vr = PseudoVMSLT_VX_M8 %249, %54, %221, 5 /* e32 */,  debug-location !42
    %245:vrm8 = PseudoVADD_VX_M8 undef %245, %243, %244, %221, 5 /* e32 */, 1 /* ta, mu */,  debug-location !41
    %251:vrm8 = PseudoVADD_VX_M8 undef %251, %243, %221, %221, 5 /* e32 */, 1 /* ta, mu */,  debug-location !41
    %260:gpr = ADD %49, %259,  debug-location !43
    %246:vrm8 = disjoint PseudoVOR_VX_M8 undef %246, %245, %428, %221, 5 /* e32 */, 1 /* ta, mu */,  debug-location !41
    early-clobber %256:vr = PseudoVMSLT_VX_M8 %246, %54, %221, 5 /* e32 */,  debug-location !42
    %263:vrm8nov0 = COPY %306,  debug-location !44
    %252:vrm8 = disjoint PseudoVOR_VX_M8 undef %252, %251, %428, %221, 5 /* e32 */, 1 /* ta, mu */,  debug-location !41
    early-clobber %257:vr = PseudoVMSLT_VX_M8 %252, %54, %221, 5 /* e32 */,  debug-location !42
    %267:vrm8nov0 = COPY %306,  debug-location !44
    %261:gpr = ADDI %260, 128,  debug-location !44
    $v0 = COPY %257,  debug-location !44
    %263:vrm8nov0 = PseudoVLE32_V_M8_MASK %263, %261, $v0, %221, 5 /* e32 */, 1 /* ta, mu */,  debug-location !44 :: (load unknown-size from %ir.82 + 128, align 4)
    %266:gpr = ADDI %260, 256,  debug-location !44
    $v0 = COPY %256,  debug-location !44
    %267:vrm8nov0 = PseudoVLE32_V_M8_MASK %267, %266, $v0, %221, 5 /* e32 */, 1 /* ta, mu */,  debug-location !44 :: (load unknown-size from %ir.82 + 256, align 4)
    %270:gpr = ADDI %260, 384,  debug-location !44
    %271:vrm8nov0 = COPY %306,  debug-location !44
    $v0 = COPY %255,  debug-location !44
    %271:vrm8nov0 = PseudoVLE32_V_M8_MASK %271, %270, $v0, %221, 5 /* e32 */, 1 /* ta, mu */,  debug-location !44 :: (load unknown-size from %ir.82 + 384, align 4)
    %274:vrm8nov0 = COPY %306,  debug-location !44
    $v0 = COPY %254,  debug-location !44
    %274:vrm8nov0 = PseudoVLE32_V_M8_MASK %274, %260, $v0, %221, 5 /* e32 */, 1 /* ta, mu */,  debug-location !44 :: (load unknown-size from %ir.82, align 4)
    %277:gpr = ADD %50, %259,  debug-location !45
    %278:vrm8nov0 = COPY %306,  debug-location !46
    $v0 = COPY %254,  debug-location !46
    %278:vrm8nov0 = PseudoVLE32_V_M8_MASK %278, %277, $v0, %221, 5 /* e32 */, 1 /* ta, mu */,  debug-location !46 :: (load unknown-size from %ir.84, align 4)
    %281:gpr = ADDI %277, 384,  debug-location !46
    %282:vrm8nov0 = COPY %306,  debug-location !46
    $v0 = COPY %255,  debug-location !46
    %282:vrm8nov0 = PseudoVLE32_V_M8_MASK %282, %281, $v0, %221, 5 /* e32 */, 1 /* ta, mu */,  debug-location !46 :: (load unknown-size from %ir.84 + 384, align 4)
    %285:gpr = ADDI %277, 256,  debug-location !46
    %286:vrm8nov0 = COPY %306,  debug-location !46
    $v0 = COPY %256,  debug-location !46
    %286:vrm8nov0 = PseudoVLE32_V_M8_MASK %286, %285, $v0, %221, 5 /* e32 */, 1 /* ta, mu */,  debug-location !46 :: (load unknown-size from %ir.84 + 256, align 4)
    %289:gpr = ADDI %277, 128,  debug-location !46
    %290:vrm8nov0 = COPY %306,  debug-location !46
    $v0 = COPY %257,  debug-location !46
    %290:vrm8nov0 = PseudoVLE32_V_M8_MASK %290, %289, $v0, %221, 5 /* e32 */, 1 /* ta, mu */,  debug-location !46 :: (load unknown-size from %ir.84 + 128, align 4)
    %293:gpr = ADD %1, %259,  debug-location !47
    %294:gpr = ADDI %293, 128,  debug-location !48
    %295:vrm8nov0 = COPY %306,  debug-location !48
    $v0 = COPY %257,  debug-location !48
    %295:vrm8nov0 = PseudoVLE32_V_M8_MASK %295, %294, $v0, %221, 5 /* e32 */, 1 /* ta, mu */,  debug-location !48 :: (load unknown-size from %ir.86 + 128, align 4)
    %298:gpr = ADDI %293, 256,  debug-location !48
    %299:vrm8nov0 = COPY %306,  debug-location !48
    $v0 = COPY %256,  debug-location !48
    %299:vrm8nov0 = PseudoVLE32_V_M8_MASK %299, %298, $v0, %221, 5 /* e32 */, 1 /* ta, mu */,  debug-location !48 :: (load unknown-size from %ir.86 + 256, align 4)
    %302:gpr = ADDI %293, 384,  debug-location !48
    %303:vrm8nov0 = COPY %306,  debug-location !48
    $v0 = COPY %255,  debug-location !48
    %303:vrm8nov0 = PseudoVLE32_V_M8_MASK %303, %302, $v0, %221, 5 /* e32 */, 1 /* ta, mu */,  debug-location !48 :: (load unknown-size from %ir.86 + 384, align 4)
    %316:vrm8 = nofpexcept PseudoVFSUB_VV_M8_E32 undef %316, %295, %421, 7, %221, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !49
    %314:vrm8 = nofpexcept PseudoVFSUB_VV_M8_E32 undef %314, %299, %421, 7, %221, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !49
    $v0 = COPY %254,  debug-location !48
    %306:vrm8nov0 = PseudoVLE32_V_M8_MASK %306, %293, $v0, %221, 5 /* e32 */, 1 /* ta, mu */,  debug-location !48 :: (load unknown-size from %ir.86, align 4)
    %312:vrm8 = nofpexcept PseudoVFSUB_VV_M8_E32 undef %312, %303, %421, 7, %221, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !49
    %317:vrm8 = nofpexcept PseudoVFMUL_VFPR32_M8_E32 undef %317, %316, %44, 7, %221, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !50
    %324:vrm8 = nofpexcept PseudoVFMUL_VV_M8_E32 undef %324, %263, %317, 7, %221, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !51
    %310:vrm8 = nofpexcept PseudoVFSUB_VV_M8_E32 undef %310, %306, %421, 7, %221, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !49
    %318:vrm8 = nofpexcept PseudoVFMUL_VFPR32_M8_E32 undef %318, %314, %44, 7, %221, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !50
    %323:vrm8 = nofpexcept PseudoVFMUL_VV_M8_E32 undef %323, %267, %318, 7, %221, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !51
    %325:vrm8 = nofpexcept PseudoVFADD_VV_M8_E32 undef %325, %290, %324, 7, %221, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !52
    %320:vrm8 = nofpexcept PseudoVFMUL_VFPR32_M8_E32 undef %320, %310, %44, 7, %221, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !50
    %321:vrm8 = nofpexcept PseudoVFMUL_VV_M8_E32 undef %321, %274, %320, 7, %221, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !51
    %328:vrm8 = nofpexcept PseudoVFADD_VV_M8_E32 undef %328, %278, %321, 7, %221, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !52
    %329:gpr = ADD %0, %259,  debug-location !53
    $v0 = COPY %254,  debug-location !54
    PseudoVSE32_V_M8_MASK %328, %329, $v0, %221, 5 /* e32 */,  debug-location !54 :: (store unknown-size into %ir.94, align 4)
    %319:vrm8 = nofpexcept PseudoVFMUL_VFPR32_M8_E32 undef %319, %312, %44, 7, %221, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !50
    %322:vrm8 = nofpexcept PseudoVFMUL_VV_M8_E32 undef %322, %271, %319, 7, %221, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !51
    %326:vrm8 = nofpexcept PseudoVFADD_VV_M8_E32 undef %326, %286, %323, 7, %221, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !52
    %327:vrm8 = nofpexcept PseudoVFADD_VV_M8_E32 undef %327, %282, %322, 7, %221, 5 /* e32 */, 1 /* ta, mu */, implicit $frm,  debug-location !52
    %331:gpr = ADDI %329, 384,  debug-location !54
    $v0 = COPY %255,  debug-location !54
    PseudoVSE32_V_M8_MASK %327, %331, $v0, %221, 5 /* e32 */,  debug-location !54 :: (store unknown-size into %ir.94 + 384, align 4)
    %333:gpr = ADDI %329, 256,  debug-location !54
    $v0 = COPY %256,  debug-location !54
    PseudoVSE32_V_M8_MASK %326, %333, $v0, %221, 5 /* e32 */,  debug-location !54 :: (store unknown-size into %ir.94 + 256, align 4)
    %335:gpr = ADDI %329, 128,  debug-location !54
    %428:gpr = ADDIW %428, 128,  debug-location !40
    $v0 = COPY %257,  debug-location !54
    PseudoVSE32_V_M8_MASK %325, %335, $v0, %221, 5 /* e32 */,  debug-location !54 :: (store unknown-size into %ir.94 + 128, align 4)
    BLT %428, %58, %bb.8,  debug-location !40
    PseudoBR %bb.9,  debug-location !40
  
  bb.9.._crit_edge11:
    PseudoRET debug-location !55
...
