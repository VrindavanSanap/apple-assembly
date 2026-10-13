# AArch64 Instructions on This Machine

**CPU:** Apple M2 (`arm64`, ARMv8.5-A)
**ISA:** AArch64. x86 instructions (`mov eax, …`, `push`, `pop`) will not assemble here.

Only user-mode instructions are listed. Kernel-only instructions are omitted.

## Table of Contents

- [Data movement](#data-movement)
- [Arithmetic](#arithmetic)
- [Logical and bit manipulation](#logical-and-bit-manipulation)
- [Load and store](#load-and-store)
- [Branches and control flow](#branches-and-control-flow)
- [Conditional select and compare](#conditional-select-and-compare)
- [System and barriers](#system-and-barriers)
- [Pointer authentication and BTI](#pointer-authentication-and-bti)
- [Floating point](#floating-point-scalar)
- [NEON / Advanced SIMD](#neon--advanced-simd)
- [Crypto extensions](#crypto-extensions)
- [Not available on the M2](#not-available-on-the-m2)
- [Notes](#notes)

---

## Data movement

| Instructions | Purpose |
|---|---|
| `MOV` `MOVZ` `MOVK` `MOVN` `MVN` | Move and build immediates |
| `ADR` `ADRP` | PC-relative address |
| `FMOV` | Move to or from FP registers |
| `DUP` `INS` `UMOV` `SMOV` | Vector element moves |

## Arithmetic

| Category | Instructions |
|---|---|
| Add and subtract | `ADD` `ADDS` `SUB` `SUBS` `ADC` `ADCS` `SBC` `SBCS` |
| Negate and compare | `NEG` `NEGS` `NGC` `CMP` `CMN` |
| Multiply | `MUL` `MADD` `MSUB` `MNEG` `SMULL` `UMULL` `SMADDL` `UMADDL` `SMSUBL` `UMSUBL` `SMULH` `UMULH` |
| Divide | `SDIV` `UDIV` |
| Misc | `ABS` `CNEG` `CINC` `CINV` |

## Logical and bit manipulation

| Category | Instructions |
|---|---|
| Logical | `AND` `ANDS` `ORR` `ORN` `EOR` `EON` `BIC` `BICS` `TST` |
| Shift and rotate | `LSL` `LSR` `ASR` `ROR` `EXTR` |
| Bitfield | `UBFM` `SBFM` `BFM` `UBFX` `SBFX` `UBFIZ` `SBFIZ` `BFI` `BFXIL` `BFC` |
| Extend | `SXTB` `SXTH` `SXTW` `UXTB` `UXTH` |
| Count and reverse | `CLS` `CLZ` `RBIT` `REV` `REV16` `REV32` |

## Load and store

| Category | Instructions |
|---|---|
| Load | `LDR` `LDRB` `LDRH` `LDRSB` `LDRSH` `LDRSW` `LDUR*` `LDTR*` |
| Store | `STR` `STRB` `STRH` `STUR*` `STTR*` |
| Pairs | `LDP` `STP` `LDPSW` `LDNP` `STNP` |
| Prefetch | `PRFM` |
| Exclusives | `LDXR` `STXR` `LDAXR` `STLXR` `LDXP` `STXP` |
| Acquire / release | `LDAR` `STLR` `LDAPR` |
| LSE atomics (FEAT_LSE) | `CAS` `CASP` `SWP` `LDADD` `LDCLR` `LDEOR` `LDSET` `LDSMAX` `LDSMIN` `LDUMAX` `LDUMIN` and their `ST*` forms |

**Addressing modes:**

```asm
ldr x0, [x1, #8]      // offset
ldr x0, [x1, #8]!     // pre-index
ldr x0, [x1], #8      // post-index
ldr x0, [x1, x2]      // register offset
```

## Branches and control flow

| Instructions | Purpose |
|---|---|
| `B` `BL` | Branch, branch with link |
| `BR` `BLR` `RET` | Register branch, return |
| `B.cond` | `EQ NE CS CC MI PL VS VC HI LS GE LT GT LE AL` |
| `CBZ` `CBNZ` | Compare and branch on zero / non-zero |
| `TBZ` `TBNZ` | Test bit and branch |

## Conditional select and compare

`CSEL` `CSINC` `CSINV` `CSNEG` `CSET` `CSETM` `CCMP` `CCMN` `SETF8` `SETF16` `CFINV` `RMIF`

## System and barriers

| Instructions | Purpose |
|---|---|
| `SVC` | Syscall (`svc #0x80` on macOS) |
| `NOP` `YIELD` `BRK` | Hints and breakpoint |
| `DMB` `DSB` `ISB` `SB` | Barriers |
| `CLREX` | Clear exclusive monitor |
| `MRS` `MSR` | Limited user registers: `NZCV`, `FPCR`, `FPSR`, `TPIDR_EL0` |
| `DC ZVA` `DC CVAC` `IC IVAU` | Cache maintenance |

## Pointer authentication and BTI

`PACIA` `PACIB` `PACDA` `PACDB` `AUTIA` `AUTIB` `AUTDA` `AUTDB` `PACIASP` `AUTIASP` `RETAA` `RETAB` `BRAA` `BLRAA` `XPACI` `XPACD` `BTI`

## Floating point (scalar)

Half, single and double precision.

| Category | Instructions |
|---|---|
| Arithmetic | `FADD` `FSUB` `FMUL` `FDIV` `FNEG` `FABS` `FSQRT` |
| Fused multiply-add | `FMADD` `FMSUB` `FNMADD` `FNMSUB` |
| Min / max | `FMAX` `FMIN` `FMAXNM` `FMINNM` |
| Compare | `FCMP` `FCMPE` `FCCMP` `FCSEL` |
| Convert (float ↔ float, int) | `FCVT` `FCVTZS` `FCVTZU` `FCVTAS` `FCVTMS` `FCVTNS` `FCVTPS` `SCVTF` `UCVTF` |
| Round | `FRINTA` `FRINTI` `FRINTM` `FRINTN` `FRINTP` `FRINTX` `FRINTZ` `FRINT32Z/X` `FRINT64Z/X` |
| JavaScript conversion | `FJCVTZS` |

## NEON / Advanced SIMD

128-bit vectors.

| Category | Instructions |
|---|---|
| Arithmetic | `ADD` `SUB` `MUL` `MLA` `MLS` `ADDP` `ADDV` `SADDL` `UADDL` `SABD` `UABD` `SQADD` `UQADD` `SQSUB` `UQSUB` `SHADD` `FMLA` `FMLS` `FADDP` `FMAXV` `FMINV` |
| Dot product and matrix (DotProd, I8MM, BF16, FHM) | `SDOT` `UDOT` `USDOT` `SMMLA` `UMMLA` `USMMLA` `BFDOT` `BFMMLA` `BFCVT` `FMLAL` `FMLSL` |
| Complex numbers (FCMA) | `FCADD` `FCMLA` |
| Compare | `CMEQ` `CMGE` `CMGT` `CMHI` `CMHS` `CMLT` `CMTST` `FCMEQ` `FCMGE` `FCMGT` |
| Shift and narrow | `SHL` `SSHR` `USHR` `SSHL` `USHL` `SHRN` `XTN` `SQXTN` `UQXTN` `SXTL` `UXTL` |
| Permute and table | `ZIP1/2` `UZP1/2` `TRN1/2` `EXT` `REV64` `TBL` `TBX` `BSL` `BIT` `BIF` |
| Bit and count | `CNT` `CLZ` `RBIT` `NOT` `AND` `ORR` `EOR` `BIC` |
| Vector load / store | `LD1` `LD2` `LD3` `LD4` `LD1R` `ST1` `ST2` `ST3` `ST4` |

## Crypto extensions

| Extension | Instructions |
|---|---|
| AES | `AESE` `AESD` `AESMC` `AESIMC` |
| SHA-1 | `SHA1C` `SHA1M` `SHA1P` `SHA1H` `SHA1SU0` `SHA1SU1` |
| SHA-256 | `SHA256H` `SHA256H2` `SHA256SU0` `SHA256SU1` |
| SHA-512 | `SHA512H` `SHA512H2` `SHA512SU0` `SHA512SU1` |
| SHA-3 | `EOR3` `RAX1` `XAR` `BCAX` |
| Polynomial multiply | `PMULL` `PMULL2` |
| CRC32 | `CRC32B/H/W/X` `CRC32CB/H/W/X` |

## Not available on the M2

- **SVE and SVE2:** the Scalable Vector Extension isn't implemented.
- **SME:** the matrix extension arrives with the M4.
- **x86 instructions:** these only run through Rosetta 2, and only when assembled with `-arch x86_64`.

## Notes

- Assemble with `as` or `clang` using `-arch arm64`.
- **Registers:**
  - `x0–x30` (64-bit)
  - `w0–w30` (32-bit)
  - `sp`
  - `xzr` / `wzr` (zero register)
  - `v0–v31` (SIMD)
  - `d` / `s` / `h` / `b` (FP views)
- **macOS syscalls:** the syscall number goes in `x16`, then `svc #0x80`.
- **Test any instruction:** `clang -arch arm64 -c file.s`
- **List supported assembler features:** `llvm-mc -arch=arm64 -mattr=help`

## Features reported by this CPU

`FEAT_AES` `FEAT_BF16` `FEAT_BTI` `FEAT_CRC32` `FEAT_DIT` `FEAT_DPB` `FEAT_DPB2` `FEAT_DotProd` `FEAT_ECV` `FEAT_FCMA` `FEAT_FHM` `FEAT_FP16` `FEAT_FPAC` `FEAT_FRINTTS` `FEAT_FlagM` `FEAT_FlagM2` `FEAT_I8MM` `FEAT_JSCVT` `FEAT_LRCPC` `FEAT_LRCPC2` `FEAT_LSE` `FEAT_LSE2` `FEAT_PAuth` `FEAT_PAuth2` `FEAT_PMULL` `FEAT_RDM` `FEAT_SB` `FEAT_SHA1` `FEAT_SHA256` `FEAT_SHA3` `FEAT_SHA512` `FEAT_SSBS`
