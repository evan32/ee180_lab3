###############################################################################
# File         : srav.S
# Project      : EE180 Lab 2: MIPS
#
# Standards/Formatting:
#   MIPS gas, soft tab, 80 column
#
# Description:
#   Test the functionality of the 'srav' instruction.
#
###############################################################################

    .section .boot, "x"
    .balign 4
    .set    noreorder
    .global boot
    .ent    boot
boot:
    lui     $s0, 0x8002         # Load the base address of the status/test registers
    ori     $s1, $0, 1          # Prepare the 'done' status
    lui     $t0, 0xdeaf         # A = 0xdeafbeef
    ori     $t0, $t0, 0xbeef
    ori     $t1, $0, 4
    srav    $t2, $t0, $t1       # B = 0xdeafbeef >> 4 = 0xfdeafbee
    lui     $t3, 0xfdea         # C = 0xfdeafbee
    ori     $t3, $t3, 0xfbee
    subu    $t4, $t2, $t3       # D = B - C = 1
    sltiu   $v0, $t4, 1
    sw      $v0, 4($s0)         # Set the test result
    sw      $s1, 0($s0)         # Set 'done'

$done:
    j       $done
    nop

    .end boot
