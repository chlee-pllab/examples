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
	.loc	1 34 0                          # 01-vector-add.py:34:0
	.cfi_sections .debug_frame
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	csrr	a5, vlenb
	li	a6, 24
	mul	a5, a5, a6
	sub	sp, sp, a5
.Ltmp0:
	.loc	1 48 24 prologue_end            # 01-vector-add.py:48:24
	slliw	a5, a4, 7
	.loc	1 54 16                         # 01-vector-add.py:54:16
	sext.w	a3, a3
	.loc	1 54 24 is_stmt 0               # 01-vector-add.py:54:24
	slli	a4, a5, 2
	.loc	1 54 16                         # 01-vector-add.py:54:16
	sub	a3, a3, a5
	li	a5, 128
	.loc	1 54 24                         # 01-vector-add.py:54:24
	add	a0, a0, a4
	.loc	1 54 16                         # 01-vector-add.py:54:16
	bgeu	a5, a3, .LBB0_2
# %bb.1:
	.loc	1 0 16                          # 01-vector-add.py:0:16
	li	a3, 32
	.loc	1 54 16                         # 01-vector-add.py:54:16
	addi	a5, a0, 256
	addi	a6, a0, 384
	vsetvli	zero, a3, e32, m8, ta, ma
	vle32.v	v8, (a0)
	addi	a0, a0, 128
	.loc	1 55 24 is_stmt 1               # 01-vector-add.py:55:24
	add	a1, a1, a4
	.loc	1 54 16                         # 01-vector-add.py:54:16
	vle32.v	v16, (a0)
	.loc	1 55 16                         # 01-vector-add.py:55:16
	addi	a0, a1, 256
	addi	a3, a1, 384
	addi	a7, a1, 128
	vle32.v	v24, (a1)
	vle32.v	v0, (a7)
	.loc	1 56 17                         # 01-vector-add.py:56:17
	vfadd.vv	v24, v8, v24
	vfadd.vv	v8, v16, v0
	csrr	a1, vlenb
	slli	a1, a1, 3
	sub	a1, s0, a1
	addi	a1, a1, -32
	vs8r.v	v8, (a1)                        # vscale x 64-byte Folded Spill
	.loc	1 54 16                         # 01-vector-add.py:54:16
	vle32.v	v16, (a6)
	.loc	1 55 16                         # 01-vector-add.py:55:16
	vle32.v	v0, (a3)
	.loc	1 56 17                         # 01-vector-add.py:56:17
	vfadd.vv	v16, v16, v0
	.loc	1 54 16                         # 01-vector-add.py:54:16
	vle32.v	v0, (a5)
	.loc	1 55 16                         # 01-vector-add.py:55:16
	vle32.v	v8, (a0)
	.loc	1 56 17                         # 01-vector-add.py:56:17
	vfadd.vv	v8, v0, v8
	.loc	1 58 26                         # 01-vector-add.py:58:26
	add	a2, a2, a4
	.loc	1 58 35 is_stmt 0               # 01-vector-add.py:58:35
	vse32.v	v24, (a2)
	addi	a0, a2, 256
	vse32.v	v8, (a0)
	addi	a0, a2, 384
	vse32.v	v16, (a0)
	addi	a0, a2, 128
	csrr	a1, vlenb
	slli	a1, a1, 3
	sub	a1, s0, a1
	addi	a1, a1, -32
	vl8r.v	v8, (a1)                        # vscale x 64-byte Folded Reload
	vse32.v	v8, (a0)
	j	.LBB0_8
.LBB0_2:
	.loc	1 54 16 is_stmt 1               # 01-vector-add.py:54:16
	addi	a5, sp, -512
	andi	a5, a5, -512
	mv	sp, a5
	li	a6, 0
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	sub	a7, a3, a6
	slli	t0, a6, 2
	vsetvli	a7, a7, e32, m8, ta, ma
	add	t1, a0, t0
	vle32.v	v8, (t1)
	add	t0, a5, t0
	add	a6, a7, a6
	vse32.v	v8, (t0)
	bltu	a6, a3, .LBB0_3
# %bb.4:
	.loc	1 0 16 is_stmt 0                # 01-vector-add.py:0:16
	li	a0, 32
	.loc	1 54 16                         # 01-vector-add.py:54:16
	addi	a6, a5, 384
	vsetvli	zero, a0, e32, m8, ta, ma
	vle32.v	v8, (a6)
	csrr	a0, vlenb
	slli	a0, a0, 3
	sub	a0, s0, a0
	addi	a0, a0, -32
	vs8r.v	v8, (a0)                        # vscale x 64-byte Folded Spill
	addi	a0, a5, 256
	vle32.v	v24, (a5)
	addi	a5, a5, 128
	vle32.v	v8, (a0)
	csrr	a0, vlenb
	slli	a0, a0, 4
	sub	a0, s0, a0
	addi	a0, a0, -32
	vs8r.v	v8, (a0)                        # vscale x 64-byte Folded Spill
	vle32.v	v0, (a5)
	.loc	1 55 24 is_stmt 1               # 01-vector-add.py:55:24
	add	a1, a1, a4
	.loc	1 55 16 is_stmt 0               # 01-vector-add.py:55:16
	addi	a0, sp, -512
	andi	a0, a0, -512
	mv	sp, a0
	li	a5, 0
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	sub	a6, a3, a5
	slli	a7, a5, 2
	vsetvli	a6, a6, e32, m8, ta, ma
	add	t0, a1, a7
	vle32.v	v8, (t0)
	add	a7, a0, a7
	add	a5, a6, a5
	vse32.v	v8, (a7)
	bltu	a5, a3, .LBB0_5
# %bb.6:
	addi	a1, a0, 384
	li	a5, 32
	addi	a6, a0, 256
	addi	a7, a0, 128
	vsetvli	zero, a5, e32, m8, ta, ma
	vle32.v	v8, (a0)
	vle32.v	v16, (a7)
	.loc	1 56 17 is_stmt 1               # 01-vector-add.py:56:17
	vfadd.vv	v8, v24, v8
	csrr	a0, vlenb
	li	a5, 24
	mul	a0, a0, a5
	sub	a0, s0, a0
	addi	a0, a0, -32
	vs8r.v	v8, (a0)                        # vscale x 64-byte Folded Spill
	vfadd.vv	v0, v0, v16
	.loc	1 55 16                         # 01-vector-add.py:55:16
	vle32.v	v8, (a6)
	csrr	a0, vlenb
	slli	a0, a0, 4
	sub	a0, s0, a0
	addi	a0, a0, -32
	vl8r.v	v16, (a0)                       # vscale x 64-byte Folded Reload
	.loc	1 56 17                         # 01-vector-add.py:56:17
	vfadd.vv	v16, v16, v8
	.loc	1 55 16                         # 01-vector-add.py:55:16
	vle32.v	v8, (a1)
	csrr	a0, vlenb
	slli	a0, a0, 3
	sub	a0, s0, a0
	addi	a0, a0, -32
	vl8r.v	v24, (a0)                       # vscale x 64-byte Folded Reload
	.loc	1 56 17                         # 01-vector-add.py:56:17
	vfadd.vv	v8, v24, v8
	.loc	1 58 26                         # 01-vector-add.py:58:26
	add	a2, a2, a4
	.loc	1 58 35 is_stmt 0               # 01-vector-add.py:58:35
	addi	a0, sp, -512
	andi	a0, a0, -512
	mv	sp, a0
	li	a1, 0
	addi	a4, a0, 384
	vse32.v	v8, (a4)
	addi	a4, a0, 256
	vse32.v	v16, (a4)
	addi	a4, a0, 128
	vse32.v	v0, (a4)
	csrr	a4, vlenb
	li	a5, 24
	mul	a4, a4, a5
	sub	a4, s0, a4
	addi	a4, a4, -32
	vl8r.v	v8, (a4)                        # vscale x 64-byte Folded Reload
	vse32.v	v8, (a0)
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	sub	a4, a3, a1
	slli	a5, a1, 2
	vsetvli	a4, a4, e32, m8, ta, ma
	add	a6, a0, a5
	vle32.v	v8, (a6)
	add	a5, a2, a5
	add	a1, a4, a1
	vse32.v	v8, (a5)
	bltu	a1, a3, .LBB0_7
.LBB0_8:                                # %.loopexit
	.loc	1 58 4 epilogue_begin           # 01-vector-add.py:58:4
	addi	sp, s0, -32
	.cfi_def_cfa sp, 32
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 32
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
