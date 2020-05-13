# Dalio, Brian A.
# dalioba
# 2018-10-10

# as --gstabs+ -o p.o printf_libc.s  <- Assemble the source code into object code.
#                                       (--gstabs+ includes debugging info for gdb)
# gcc -static -o test p.o            <- Make a static executable from the object code,
#                                       linking it with stdlib.
# ./test                             <- Run the executable.
# echo $?                            <- Display the exit code from the run.

.global main

.text
main:
  # Establish stack frame.
  pushq   %rbp          # Save old base (frame) ptr
  movq    %rsp, %rbp    # Make the current stack ptr the base (frame) ptr

  # printf( fmt, 'a', 123, 3.14... )
  movq    $fmt, %rdi    # Arg 1: format
  movl    $97, %esi     # Arg 2: character 'a'
  movl    $123, %edx    # Arg 3: integer 123
  movq    val, %xmm0    # Arg 4: fp 3.14...

  movl    $1, %eax      # One arg is in the FP registers
  call    printf        # printf( const char *fmt, ... )

  # The return value from printf is in %rax.  We use that
  # value as our exit code.  (It's the number of characters
  # that printf actually printed.)
  # exit( <num chars printed> )
  movl    %eax, %edi    # Arg 1: exit code
  call    exit          # exit( int status )

  # No disestablish stack frame here as exit never returns.
  # However, in a 'normal' function, it would be:
  #leave                 # Disestablish stack frame
  #ret                   # Return to caller;  (integer) result in $rax.

.data

# Need asciz here to get NUL byte on end.
.align 8
fmt:
  .asciz  "Hello, world, from printf! %c, %d, %f\n"

.align 8
val:
  .double 3.141592653589793
