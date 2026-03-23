	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_f2p2_d2p2_v1p0_zicsr2p0_zmmul1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"LLVMDialectModule"
	.text
	.globl	add_kernel                      # -- Begin function add_kernel
	.p2align	2
	.type	add_kernel,@function
add_kernel:                             # @add_kernel
.Lfunc_begin0:
	.file	1 "/home/chlee/triton-cpu/python/tutorials" "01-vector-add.py"
	.loc	1 35 0                          # 01-vector-add.py:35:0
	.cfi_sections .debug_frame
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	csrr	a5, vlenb
	li	a6, 36
	mul	a5, a5, a6
	sub	sp, sp, a5
	.cfi_escape 0x0f, 0x0d, 0x72, 0x00, 0x11, 0x10, 0x22, 0x11, 0x24, 0x92, 0xa2, 0x38, 0x00, 0x1e, 0x22 # sp + 16 + 36 * vlenb
.Ltmp0:
	.loc	1 49 24 prologue_end            # 01-vector-add.py:49:24
	slliw	a5, a4, 7
	li	a6, 32
	li	a4, 96
	.loc	1 50 28                         # 01-vector-add.py:50:28
	vsetvli	zero, a6, e32, m8, ta, mu
	vid.v	v24
	vadd.vx	v8, v24, a4
	csrr	a4, vlenb
	li	a7, 28
	mul	a4, a4, a7
	add	a4, sp, a4
	addi	a4, a4, 16
	vs8r.v	v8, (a4)                        # vscale x 64-byte Folded Spill
	li	a4, 64
	vadd.vx	v16, v24, a4
	.loc	1 55 24                         # 01-vector-add.py:55:24
	slli	a4, a5, 2
	.loc	1 50 28                         # 01-vector-add.py:50:28
	vor.vx	v0, v24, a5
	vor.vx	v16, v16, a5
	.loc	1 52 21                         # 01-vector-add.py:52:21
	vmslt.vx	v8, v0, a3
	csrr	a7, vlenb
	li	t0, 27
	mul	a7, a7, t0
	add	a7, sp, a7
	addi	a7, a7, 16
	vs1r.v	v8, (a7)                        # vscale x 8-byte Folded Spill
	vmslt.vx	v4, v16, a3
	csrr	a7, vlenb
	li	t0, 26
	mul	a7, a7, t0
	add	a7, sp, a7
	addi	a7, a7, 16
	vs1r.v	v4, (a7)                        # vscale x 8-byte Folded Spill
	.loc	1 55 16                         # 01-vector-add.py:55:16
	vmv.v.i	v16, 0
	.loc	1 50 28                         # 01-vector-add.py:50:28
	vadd.vx	v24, v24, a6
	.loc	1 55 24                         # 01-vector-add.py:55:24
	add	a0, a0, a4
	csrr	a6, vlenb
	li	a7, 28
	mul	a6, a6, a7
	add	a6, sp, a6
	addi	a6, a6, 16
	vl8r.v	v8, (a6)                        # vscale x 64-byte Folded Reload
	.loc	1 50 28                         # 01-vector-add.py:50:28
	vor.vx	v8, v8, a5
	.loc	1 52 21                         # 01-vector-add.py:52:21
	vmslt.vx	v5, v8, a3
	csrr	a6, vlenb
	li	a7, 28
	mul	a6, a6, a7
	add	a6, sp, a6
	addi	a6, a6, 16
	vs8r.v	v16, (a6)                       # vscale x 64-byte Folded Spill
	.loc	1 50 28                         # 01-vector-add.py:50:28
	vor.vx	v8, v24, a5
	.loc	1 52 21                         # 01-vector-add.py:52:21
	vmslt.vx	v6, v8, a3
	csrr	a3, vlenb
	li	a5, 25
	mul	a3, a3, a5
	add	a3, sp, a3
	addi	a3, a3, 16
	vs1r.v	v6, (a3)                        # vscale x 8-byte Folded Spill
	.loc	1 55 16                         # 01-vector-add.py:55:16
	vmv.v.i	v8, 0
	addi	a3, a0, 384
	addi	a5, a0, 256
	csrr	a6, vlenb
	li	a7, 27
	mul	a6, a6, a7
	add	a6, sp, a6
	addi	a6, a6, 16
	vl1r.v	v7, (a6)                        # vscale x 8-byte Folded Reload
	vmv1r.v	v0, v7
	csrr	a6, vlenb
	li	a7, 28
	mul	a6, a6, a7
	add	a6, sp, a6
	addi	a6, a6, 16
	vl8r.v	v24, (a6)                       # vscale x 64-byte Folded Reload
	vle32.v	v24, (a0), v0.t
	csrr	a6, vlenb
	li	a7, 28
	mul	a6, a6, a7
	add	a6, sp, a6
	addi	a6, a6, 16
	vs8r.v	v24, (a6)                       # vscale x 64-byte Folded Spill
	vmv1r.v	v0, v5
	addi	a6, sp, 16
	vs1r.v	v5, (a6)                        # vscale x 8-byte Folded Spill
	vle32.v	v8, (a3), v0.t
	csrr	a3, vlenb
	add	a3, sp, a3
	addi	a3, a3, 16
	vs8r.v	v8, (a3)                        # vscale x 64-byte Folded Spill
	vmv.v.i	v8, 0
	vmv1r.v	v0, v4
	vle32.v	v8, (a5), v0.t
	csrr	a3, vlenb
	slli	a5, a3, 4
	add	a3, a5, a3
	add	a3, sp, a3
	addi	a3, a3, 16
	vs8r.v	v8, (a3)                        # vscale x 64-byte Folded Spill
	addi	a0, a0, 128
	vmv.v.i	v8, 0
	vmv1r.v	v0, v6
	vle32.v	v8, (a0), v0.t
	csrr	a0, vlenb
	slli	a3, a0, 3
	add	a0, a3, a0
	add	a0, sp, a0
	addi	a0, a0, 16
	vs8r.v	v8, (a0)                        # vscale x 64-byte Folded Spill
	.loc	1 56 24                         # 01-vector-add.py:56:24
	add	a1, a1, a4
	.loc	1 56 16 is_stmt 0               # 01-vector-add.py:56:16
	vmv.v.i	v8, 0
	vmv1r.v	v0, v7
	vle32.v	v8, (a1), v0.t
	addi	a0, a1, 384
	vmv.v.i	v24, 0
	vmv1r.v	v0, v5
	vle32.v	v24, (a0), v0.t
	csrr	a0, vlenb
	li	a3, 28
	mul	a0, a0, a3
	add	a0, sp, a0
	addi	a0, a0, 16
	vl8r.v	v0, (a0)                        # vscale x 64-byte Folded Reload
	.loc	1 57 17 is_stmt 1               # 01-vector-add.py:57:17
	vfadd.vv	v8, v0, v8
	csrr	a0, vlenb
	li	a3, 28
	mul	a0, a0, a3
	add	a0, sp, a0
	addi	a0, a0, 16
	vs8r.v	v8, (a0)                        # vscale x 64-byte Folded Spill
	.loc	1 56 16                         # 01-vector-add.py:56:16
	addi	a0, a1, 256
	vmv.v.i	v8, 0
	csrr	a3, vlenb
	li	a5, 26
	mul	a3, a3, a5
	add	a3, sp, a3
	addi	a3, a3, 16
	vl1r.v	v0, (a3)                        # vscale x 8-byte Folded Reload
	vle32.v	v8, (a0), v0.t
	csrr	a0, vlenb
	add	a0, sp, a0
	addi	a0, a0, 16
	vl8r.v	v0, (a0)                        # vscale x 64-byte Folded Reload
	.loc	1 57 17                         # 01-vector-add.py:57:17
	vfadd.vv	v24, v0, v24
	csrr	a0, vlenb
	add	a0, sp, a0
	addi	a0, a0, 16
	vs8r.v	v24, (a0)                       # vscale x 64-byte Folded Spill
	.loc	1 56 16                         # 01-vector-add.py:56:16
	addi	a0, a1, 128
	csrr	a1, vlenb
	li	a3, 25
	mul	a1, a1, a3
	add	a1, sp, a1
	addi	a1, a1, 16
	vl1r.v	v0, (a1)                        # vscale x 8-byte Folded Reload
	vle32.v	v16, (a0), v0.t
	csrr	a0, vlenb
	slli	a1, a0, 4
	add	a0, a1, a0
	add	a0, sp, a0
	addi	a0, a0, 16
	vl8r.v	v0, (a0)                        # vscale x 64-byte Folded Reload
	.loc	1 57 17                         # 01-vector-add.py:57:17
	vfadd.vv	v8, v0, v8
	.loc	1 59 26                         # 01-vector-add.py:59:26
	add	a2, a2, a4
	csrr	a0, vlenb
	li	a1, 27
	mul	a0, a0, a1
	add	a0, sp, a0
	addi	a0, a0, 16
	vl1r.v	v0, (a0)                        # vscale x 8-byte Folded Reload
	csrr	a0, vlenb
	li	a1, 28
	mul	a0, a0, a1
	add	a0, sp, a0
	addi	a0, a0, 16
	vl8r.v	v24, (a0)                       # vscale x 64-byte Folded Reload
	.loc	1 59 35 is_stmt 0               # 01-vector-add.py:59:35
	vse32.v	v24, (a2), v0.t
	csrr	a0, vlenb
	slli	a1, a0, 3
	add	a0, a1, a0
	add	a0, sp, a0
	addi	a0, a0, 16
	vl8r.v	v0, (a0)                        # vscale x 64-byte Folded Reload
	.loc	1 57 17 is_stmt 1               # 01-vector-add.py:57:17
	vfadd.vv	v16, v0, v16
	.loc	1 59 35                         # 01-vector-add.py:59:35
	addi	a0, a2, 384
	addi	a1, sp, 16
	vl1r.v	v0, (a1)                        # vscale x 8-byte Folded Reload
	csrr	a1, vlenb
	add	a1, sp, a1
	addi	a1, a1, 16
	vl8r.v	v24, (a1)                       # vscale x 64-byte Folded Reload
	vse32.v	v24, (a0), v0.t
	addi	a0, a2, 256
	csrr	a1, vlenb
	li	a3, 26
	mul	a1, a1, a3
	add	a1, sp, a1
	addi	a1, a1, 16
	vl1r.v	v0, (a1)                        # vscale x 8-byte Folded Reload
	vse32.v	v8, (a0), v0.t
	addi	a0, a2, 128
	csrr	a1, vlenb
	li	a2, 25
	mul	a1, a1, a2
	add	a1, sp, a1
	addi	a1, a1, 16
	vl1r.v	v0, (a1)                        # vscale x 8-byte Folded Reload
	vse32.v	v16, (a0), v0.t
	.loc	1 59 4 epilogue_begin is_stmt 0 # 01-vector-add.py:59:4
	csrr	a0, vlenb
	li	a1, 36
	mul	a0, a0, a1
	add	sp, sp, a0
	.cfi_def_cfa sp, 16
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Ltmp1:
.Lfunc_end0:
	.size	add_kernel, .Lfunc_end0-add_kernel
	.cfi_endproc
                                        # -- End function
	.section	.debug_abbrev,"",@progbits
	.byte	1                               # Abbreviation Code
	.byte	17                              # DW_TAG_compile_unit
	.byte	0                               # DW_CHILDREN_no
	.byte	37                              # DW_AT_producer
	.byte	14                              # DW_FORM_strp
	.byte	19                              # DW_AT_language
	.byte	5                               # DW_FORM_data2
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	16                              # DW_AT_stmt_list
	.byte	23                              # DW_FORM_sec_offset
	.byte	27                              # DW_AT_comp_dir
	.byte	14                              # DW_FORM_strp
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	0                               # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.word	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.half	4                               # DWARF version number
	.word	.debug_abbrev                   # Offset Into Abbrev. Section
	.byte	8                               # Address Size (in bytes)
	.byte	1                               # Abbrev [1] 0xb:0x1f DW_TAG_compile_unit
	.word	.Linfo_string0                  # DW_AT_producer
	.half	2                               # DW_AT_language
	.word	.Linfo_string1                  # DW_AT_name
	.word	.Lline_table_start0             # DW_AT_stmt_list
	.word	.Linfo_string2                  # DW_AT_comp_dir
	.quad	.Lfunc_begin0                   # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
.Ldebug_info_end0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"triton"                        # string offset=0
.Linfo_string1:
	.asciz	"01-vector-add.py"              # string offset=7
.Linfo_string2:
	.asciz	"/home/chlee/triton-cpu/python/tutorials" # string offset=24
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
