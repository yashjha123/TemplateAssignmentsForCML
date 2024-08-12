.data

invalidCsvStr:	.asciz "ERROR: Invalid character found for event type.\n"
invalidAssembly:	.asciz "ERROR: Invalid assembly file.\n"
noArguments:    .asciz "ERROR: No arguments given."
notEnoughArguments: .asciz "ERROR: Only one argument given but two are required."
incorrectBitMap:    .asciz "ERROR: Argument is not a valid register bit map. Bit maps should be 8 characters and all capitals (1234FFFF)."
output	:.asciz "The sum of the two numbers is: "

.text

#------------------------------------------------------------------------------
# main
# Calls the functions to run the program and print outputs.
# 
# Register Usage:
#	s0: start of the function
#	s1: end of the function
#------------------------------------------------------------------------------
checkArgs:


   	mv s0, a1	     # s0 <- pointer of pointer to the file path string
	addi s1, s0, 4   # s1 <- pointer of pointer to the table.csv  file
    # check that argument was given	
    beq s0, zero, main_noArg
    # make sure arg is not 0
    lw  s0, 0(s0)
    beq s0, zero, main_noArg
    # arg was given and is not 0
    j   main_checkSecondArg
    
    main_noArg:
	    # no argument was given so print error
	    la  a0, noArguments
	    li  a7, 4
	    ecall
	    # end program
	    j   end
	    
    main_checkSecondArg:
	    # check that arg 2 is not 0
	    lw  s1, 0(s1)
	    beq s1, zero, main_notEnoughArgs
	    # arg is not 0
	    j   main_argsPassed
	  
    main_notEnoughArgs:
	    # no argument was given so print error
	    la  a0, notEnoughArguments
	    li  a7, 4
	    ecall
	    # end program
	    j   end
	    
    main_argsPassed:

		
		mv a0, s0 # s0 <- pointer to the string to the binary file path
		#ebreak
		lb a0, 0(a0)
		jal strToInt
		mv s0, a0
		#ebreak
		mv a0, s1 # s1 <- pointer to the string to table.csv file path
		lb a0, 0(a0)
		jal strToInt
		mv s1, a0
		
		
	
main:
	add s3, s1, s0
	la a0, output
	jal print
	mv a0, s3
	jal printInt
	j end


#----------------------------------------------------------------------------------------------
# strToInt
# Parses an ascii string representing an interger into that integer. Note that instead of a
# string, this function takes in the bytes representing the integer stored in a register. As
# such only 4 digit numbers maybe parsed using this function.
#
# Inputs:
#    a0: The ascii representation of the number
#
# Returns:
#     a0: The parsed integer.
#----------------------------------------------------------------------------------------------
strToInt:
    li    a1, 0            # Used to store intermediate results.
    li    t0, 0            # Amount of bits to shift right.
    li    t1, 1            # Used to store the place value of our current digit.
    li    t2, 24            # Used to store the constant 24
    li    t3, 10            # Used to store the constant 10
    li    t4, 0xFF        # Bitmask to extract the lower 8 bits.

_strToIntLoop:
    srl    t6, a0, t0        # t6 <- a0 shifted by number of bits required to get the next 8 bits to the lower
                    # part of the register.
    and    t5, t6, t4        # t5 <- Lower 8 bits of t6
    beqz    t5, _strToIntLoopEnd    # No more ascii representation of digits to convert.
    addi    t5, t5, -48        # Adjustment for ascii to integer values.
    mul    t5, t5, t1        # Multiply the number we just parsed by its placeholder value in the number.
    add    a1, a1, t5        # Add the number we just parsed to our intermediate result.
    
    addi    t0, t0, 8        # Increment the number of shift to get the next ascii character.
    mul    t1, t1, t3        # Multiply our current placeholder value by 10 for the next iteration.
    ble    t0, t2, _strToIntLoop    # Ensures that we run the loop at most 4 times. An ascii character takes 1 byte and since a word is
                    # 4 bytes, we can have at most 4 characters in a register.

_strToIntLoopEnd:
    mv    a0, a1
    ret
    
printInt:
    addi sp, sp, -4
    sw ra, 0(sp)
    
    li a7, 1
    ecall
    
    lw ra, 0(sp)
    addi sp, sp, 4
    jr ra


print:
    addi sp, sp, -4
    sw ra, 0(sp)
    
    li a7, 4
    ecall
    
    lw ra, 0(sp)
    addi sp, sp, 4
    jr ra

end: 
	# end program
	li	a7, 10
	ecall

