# Dalio, Brian A.
# dalioba
# 2018-10-31

# as --gstabs+ -o s.o scanf_libc.s   <- Assemble the source code into object code.
#                                       (--gstabs+ includes debugging info for gdb)
# gcc -static -o test s.o            <- Make a static executable from the object code,
#                                       linking it with stdlib.
# ./test                             <- Run the executable.
# echo $?                            <- Display the exit code from the run.

.global main

.text
main:
  # Establish stack frame.
  pushq   %rbp          # Save old base (frame) ptr
  movq    %rsp, %rbp    # Make the current stack ptr the base (frame) ptr
  subq    $16, %rsp     # Get space for locals

  # scanf( fmt, &fpVal )
  movq    $fmt, %rdi    # Arg 1: format
  leaq    -16(%rbp), %rsi # Arg 2: &fpVal

  movl    $0, %eax      # Zero args are in the FP registers
  call    scanf         # scanf( const char *fmt, &fpVal )

  # conv <- scanf()
  movl    %eax, -4(%rbp) # conv <- scanf ...
  cmpl    $1, %eax      # Stupid processor doesn't set condition codes on move
  jne     ERROR         # error if unsuccessful

  # printf( msg0, fpVal )
  movq    $msg0, %rdi   # Arg 1: format
  movq    -16(%rbp), %xmm0 # Arg 2: fpVal

  movl    $1, %eax      # One arg is in the FP registers
  call    printf        # printf( const char *msg0, fpVal )

  jmp     LEAVE         # All done!

ERROR:  # Jump here if scan unsuccessful
  # puts( msg1 )
  movq    $msg1, %rdi   # Arg 1: string
  call    puts          # puts( const char *str )

LEAVE:  # Jump here when ready to leave
  movl    -4(%rbp), %eax # <result> <- conv
  leave                 # Disestablish stack frame
  ret                   # Return to caller;  (integer) result in %rax

.data

# Need asciz here to get NUL byte on end.
.align 8
fmt:
  .asciz  " %lf"
msg0:
  .asciz  "Scanned %lf\n"
msg1:
  .asciz  "Scan was not successful."
