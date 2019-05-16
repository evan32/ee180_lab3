###############################################################################
# File         : xor.S
# Project      : EE180 Lab 2: MIPS
#
# Standards/Formatting:
#   MIPS gas, soft tab, 80 column
#
# Description:
#   Test the functionality of the 'xor' instruction.
#
###############################################################################

    .section .boot, "x"
    .balign 4
    .set    noreorder
    .global boot
    .ent    boot
boot:
    lui     $s0, 0x8002           # Load the base address of the status/test registers
    ori     $s1, $0, 1                 # Prepare the 'done' status
    xori    $t1, $0, 0xabcd       # D = xor(A,B) = 0xefeee7c9
    nop 
    nop
    nop
    nop
    xori    $t2, $t1, 0xabcc       # E = xor(C,D) = 0x1
    nop
    nop
    nop
    sw      $t2, 4($s0)         # Set the test result
    sw      $s1, 0($s0)         # Set 'done'

$done:
    j       $done
    nop

    .end boot
