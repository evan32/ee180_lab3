###############################################################################
# File         : jr.S
# Project      : EE180 Lab 2: MIPS
#
# Standards/Formatting:
#   MIPS gas, soft tab, 80 column
#
# Description:
#   Test the functionality of the 'jr' instruction.
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
    ori     $t0, $0, 0x005C 
    nop
    nop
    nop
    ori     $v0, $0, 0          # The test result starts as a failure
    nop
    nop
    nop
    jalr    $t1, $t0
    nop
    nop
    nop
   
$finish:
    ori     $v0, $0, 1          # Set the result to pass
    nop
    nop
    nop
    sw      $v0, 4($s0)
    sw      $s1, 0($s0)

$done:
    j       $done
    nop

$target:
    addi    $t5, $0, 6
    nop
    nop
    j       $t1
    nop

    .end boot
