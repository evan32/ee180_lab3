###############################################################################
# File         : ori.S
# Project      : EE180 Lab 2: MIPS
#
# Standards/Formatting:
#   MIPS gas, soft tab, 80 column
#
# Description:
#   Test the functionality of the 'ori' instruction.
#
###############################################################################

    .section .boot, "x"
    .balign 4
    .set    noreorder
    .global boot
    .ent    boot
boot:
    lui     $s0, 0x8002         # Load the base address of the status/test registers
    xori    $s1, $0, 1
    lui     $t1, 0xabcd
    ori     $t1, $t1, 0x0000
    lui     $t2, 0x5432
    ori     $t2, $t2, 0xfffe
    nor     $t3, $t2, $t1
    sw      $t3, 4($s0)         # Set the test result
    sw      $s1, 0($s0)         # Set 'done'

$done:
    j       $done
    nop

    .end boot
