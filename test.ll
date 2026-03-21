; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-linux-gnu"

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite) uwtable vscale_range(2,1024)
define dso_local void @s221(ptr noalias noundef readonly captures(none) %a, ptr noalias noundef readonly captures(none) %b, ptr noalias noundef readonly captures(none) %c, ptr noalias noundef readonly captures(none) %d, ptr noalias noundef captures(none) %e) local_unnamed_addr #0 {
entry:
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %entry
  %evl.based.iv = phi i64 [ 0, %entry ], [ %index.evl.next, %vector.body ]
  %avl = phi i64 [ 12000, %entry ], [ %avl.next, %vector.body ]
  %0 = tail call i32 @llvm.experimental.get.vector.length.i64(i64 %avl, i32 16, i1 true)
  %1 = getelementptr inbounds nuw i32, ptr %a, i64 %evl.based.iv
  %vp.op.load = tail call <vscale x 16 x i32> @llvm.vp.load.nxv16i32.p0(ptr align 4 %1, <vscale x 16 x i1> splat (i1 true), i32 %0), !tbaa !9
  %2 = getelementptr inbounds nuw i32, ptr %b, i64 %evl.based.iv
  %vp.op.load23 = tail call <vscale x 16 x i32> @llvm.vp.load.nxv16i32.p0(ptr align 4 %2, <vscale x 16 x i1> splat (i1 true), i32 %0), !tbaa !9
  %3 = add nsw <vscale x 16 x i32> %vp.op.load23, %vp.op.load
  %4 = getelementptr inbounds nuw i32, ptr %c, i64 %evl.based.iv
  %vp.op.load24 = tail call <vscale x 16 x i32> @llvm.vp.load.nxv16i32.p0(ptr align 4 %4, <vscale x 16 x i1> splat (i1 true), i32 %0), !tbaa !9
  %5 = add nsw <vscale x 16 x i32> %3, %vp.op.load24
  %6 = getelementptr inbounds nuw i32, ptr %d, i64 %evl.based.iv
  %vp.op.load25 = tail call <vscale x 16 x i32> @llvm.vp.load.nxv16i32.p0(ptr align 4 %6, <vscale x 16 x i1> splat (i1 true), i32 %0), !tbaa !9
  %7 = add nsw <vscale x 16 x i32> %5, %vp.op.load25
  %8 = getelementptr inbounds nuw i32, ptr %e, i64 %evl.based.iv
  %vp.op.load26 = tail call <vscale x 16 x i32> @llvm.vp.load.nxv16i32.p0(ptr align 4 %8, <vscale x 16 x i1> splat (i1 true), i32 %0), !tbaa !9
  %9 = add nsw <vscale x 16 x i32> %7, %vp.op.load26
  tail call void @llvm.vp.store.nxv16i32.p0(<vscale x 16 x i32> %9, ptr align 4 %8, <vscale x 16 x i1> splat (i1 true), i32 %0), !tbaa !9
  %10 = zext i32 %0 to i64
  %index.evl.next = add nuw i64 %evl.based.iv, %10
  %avl.next = sub nuw i64 %avl, %10
  %11 = icmp eq i64 %avl.next, 0
  br i1 %11, label %for.cond.cleanup, label %vector.body, !llvm.loop !13

for.cond.cleanup:                                 ; preds = %vector.body
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.experimental.get.vector.length.i64(i64, i32 immarg, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 16 x i32> @llvm.vp.load.nxv16i32.p0(ptr captures(none), <vscale x 16 x i1>, i32) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.vp.store.nxv16i32.p0(<vscale x 16 x i32>, ptr captures(none), <vscale x 16 x i1>, i32) #3

attributes #0 = { nofree noinline norecurse nosync nounwind memory(argmem: readwrite) uwtable vscale_range(2,1024) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zaamo,+zalrsc,+zca,+zcd,+zicsr,+zifencei,+zmmul,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl128b,+zvl32b,+zvl64b,-b,-e,-experimental-p,-experimental-svukte,-experimental-xqccmp,-experimental-xqcia,-experimental-xqciac,-experimental-xqcibi,-experimental-xqcibm,-experimental-xqcicli,-experimental-xqcicm,-experimental-xqcics,-experimental-xqcicsr,-experimental-xqciint,-experimental-xqciio,-experimental-xqcilb,-experimental-xqcili,-experimental-xqcilia,-experimental-xqcilo,-experimental-xqcilsm,-experimental-xqcisim,-experimental-xqcisls,-experimental-xqcisync,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zalasr,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvkgs,-experimental-zvqdotq,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zce,-zcf,-zclsd,-zcmop,-zcmp,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl4096b,-zvl512b,-zvl65536b,-zvl8192b" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: read) }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(argmem: write) }

!llvm.module.flags = !{!0, !1, !2, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 6, !"riscv-isa", !3}
!3 = !{!"rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"}
!4 = !{i32 8, !"PIC Level", i32 2}
!5 = !{i32 7, !"PIE Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 2}
!7 = !{i32 8, !"SmallDataLimit", i32 0}
!8 = !{!"clang version 22.0.0git (https://github.com/llvm/llvm-project.git 55906374f88f4f47767f1800ddfdcb3fa4e2e9c6)"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C/C++ TBAA"}
!13 = distinct !{!13, !14, !15, !16, !17}
!14 = !{!"llvm.loop.mustprogress"}
!15 = !{!"llvm.loop.isvectorized", i32 1}
!16 = !{!"llvm.loop.isvectorized.tailfoldingstyle", !"evl"}
!17 = !{!"llvm.loop.unroll.runtime.disable"}
