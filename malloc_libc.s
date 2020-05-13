# Dalio, Brian A.
# dalioba
# 2018-10-11

# as --gstabs+ -o m.o malloc_libc.s  <- Assemble the source code into object code.
#                                       (--gstabs+ includes debugging info for gdb)
# gcc -static -o test m.o            <- Make a static executable from the object code,
#                                       linking it with stdlib.
# ./test                             <- Run the executable.
# echo $?                            <- Display the exit code from the run.

.global main

.text
main:
  # Establish stack frame.
  pushq   %rbp          # Save old base (frame) ptr
  movq    %rsp, %rbp    # Make the current stack ptr the base (frame) ptr

  subq    $16, %rsp     # Get some space on the stack.

  movl    $4, %edi      # Arg 1: sizeof( int )
  call    malloc        # malloc ...
  movq    %rax, -8(%rbp) # ptr = malloc ...

  cmpq    $0, %rax      # ptr == NULL?
  jne     .L2           # No, jump to using it

  movq    $msg0, %rdi   # Yes, error!
  call    puts          # puts( msg0 )

  movl    $1, %eax      # return code 1
  jmp     .L3           # go return

.L2:
  movl    $42, (%rax)   # *ptr = 42

  movq    $msg1, %rdi   # Arg 1: format
  movl    (%rax), %esi  # Arg 2: *ptr
  movl    $0, %eax      # No args in FP registers
  call    printf        # printf ...

  movq    -8(%rbp), %rdi # Arg 1: ptr
  call    free          # free ...

  movl    $0, %eax      # return code 0

.L3:
  leave                 # Undo stack frame
  ret                   # return from main
                        #   status is in %eax

.data

# Need asciz here to get NUL byte on end.
.align 8
msg0:
  .asciz  "malloc returned NULL"

msg1:
  .asciz  "*ptr is %d\n"
