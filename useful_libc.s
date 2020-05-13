# Mainali, Ashish.
# axm3019
# 2020-02-26

# as --gstabs+ -o u.o useful_libc.s     <- Assemble the source code into object code.
#                                          (--gstabs+ includes debugging info for gdb)
# gcc -static -o test u.o useful_test.c <- Make a static executable from the object code,
#                                          linking it with stdlib and a test harness.
# ./test                                <- Run the executable.
# echo $?                               <- Display the exit code from the run.

.global readInteger
.global readReal
.global writeBoolean
.global writeInteger
.global writeNewLine
.global writeReal
.global writeString

.text
#-----------------------------------------------------------
readInteger:
  # Establish stack frame.
  pushq   %rbp            # Save old base (frame) ptr
  movq    %rsp, %rbp      # Make the current stack ptr the base (frame) ptr
  
  movq    %rdi, %rsi      # Move the input parameter (address) as 2nd argument
  movq    $int_fmt, %rdi  # Move the format to as the first argument

  movl    $0, %eax        # Zero args are in the FP registers
  call    scanf           # scanf( const char *read_int_fmt, &address )

  leave                   # Disestablish stack frame
  ret                     # Return to caller;  (integer) result in %eax

#-----------------------------------------------------------
readReal:
 
  pushq   %rbp            # Save old base (frame) ptr
  movq    %rsp, %rbp      # Make the current stack ptr the base (frame) ptr
 
  movq    %rdi, %rsi      # Arg 2: &fpVal
  movq    $real_fmt, %rdi # Arg 1: format
  movl    $0, %eax        # Zero args are in the FP registers
  call    scanf           # scanf( const char *fmt, &fpVal )  

  leave                   # Disestablish stack frame
  ret                     # Return to caller;  (integer) result in %eax

#-----------------------------------------------------------
writeBoolean:
  pushq   %rbp            # Save old base (frame) ptr
  movq    %rsp, %rbp      # Make the current stack ptr the base (frame) ptr
  
  cmpq    $0, %rdi        # check the boolean input
  je      .L1             # jump to L1 if input is false

  movq    $true, %rsi     # move true as 2nd input for printf
  jmp     .L2             # jump to L2

  .L1:                    # False condition label
  movq    $false, %rsi    # move false as 2nd input parameter for printf
 
  .L2:                    # Scanf Ready
  movq    $str_fmt, %rdi  # Load format string for printf as first argument
  
  call    printf          # printf( const char *str_fmt, &addr )
  push    %rax            # Save the return value of printf in stack

  movq    stdout, %rdi    # Arg 1: stdout
  call    fflush          # fflush( FILE *stream )

  pop  %rax               # Extract the return value of printf from stack
  cmpl  $0, %eax          # Compare the output from printf
  setge %al               # Set 1 if greater than or equal to 0
  movzbl	%al, %eax       # Move the value to eax for return

  leave                   # Disestablish stack frame
  ret                     # Return to caller;  (integer) result in %eax

# -----------------------------------------------------------
writeInteger:
  pushq   %rbp              # Save old base (frame) ptr
  movq    %rsp, %rbp        # Make the current stack ptr the base (frame) ptr

  movq    %rdi, %rsi        # Moving the input parameter to %rsi register
  movq    $write_int, %rdi  # Moving the input paramater for printf function
  
  call    printf            # printf( const char *str_fmt, &addr )
  push    %rax              # Save the return value of printf in stack

  movq    stdout, %rdi      # Arg 1: stdout
  call    fflush            # fflush( FILE *stream )

  pop     %rax              # Extract the return value of printf from stack
  cmpl    $0, %eax          # Comparing the output with
  setge   %al               # Set %al to 1 
  movzbl	%al, %eax         # Move the value to eax for return 
  

  leave                     # Disestablish stack frame
  ret                       # Return to caller;  (integer) result in %eax

#-----------------------------------------------------------
writeNewLine:
  pushq   %rbp          # Save old base (frame) ptr
  movq    %rsp, %rbp    # Make the current stack ptr the base (frame) ptr

  movq    $10, %rdi     # Move ascii code of '\n' as the 1st argument
  
  call    putchar       # printf( const char *str_fmt, &addr )
  push    %rax          # Save the return value of printf in stack

  movq    stdout, %rdi  # Arg 1: stdout
  call    fflush        # fflush( FILE *stream )


  pop     %rax          # Extract the return value of printf from stack
  cmpl    $0, %eax      # Comparing the output with
  setge   %al           # Set %al to 1 
  movzbl	%al, %eax     # Move value to eax for return

  leave                 # Disestablish stack frame
  ret                   # Return to caller;  (integer) result in %eax

#-----------------------------------------------------------
writeReal:
  pushq   %rbp                # Save old base (frame) ptr
  movq    %rsp, %rbp          # Make the current stack ptr the base (frame) ptr

  movq    $write_real, %rdi   # Arg 1: format
  movl    $1, %eax            # One arg is in the FP registers
  call    printf              # printf( const char *str_fmt, &addr )

  push    %rax                # Save the return value of printf in stack

  movq    stdout, %rdi        # Arg 1: stdout
  call    fflush              # fflush( FILE *stream )
  pop     %rax                # Extract the return value of printf from stack
  cmpl    $0, %eax            # Comparing the output with
  setge   %al                 # Set %al to 1 
  movzbl	%al, %eax           # Move value to eax for return 

  leave                       # Disestablish stack frame
  ret                         # Return to caller;  (integer) result in %eax

#-----------------------------------------------------------
writeString:
  pushq   %rbp            # Save old base (frame) ptr
  movq    %rsp, %rbp      # Make the current stack ptr the base (frame) ptr

  movq    %rdi, %rsi      # Move the input address to rsi as 2nd argument.
  movq    $str_fmt, %rdi  # Move the string fromat as 1st argument. 
  
  call    printf          # printf( const char *str_fmt, &addr )
  push    %rax            # Push the return value from printf to stack

  movq    stdout, %rdi    # Arg 1: stdout
  call    fflush          # fflush( FILE *stream )

  pop     %rax            # Extract the return value of printf from stack
  cmpl    $0, %eax        # Comparing the output with
  setge   %al             # Set %al to 1 
  movzbl	%al, %eax       # Move the return value to eax

  leave                   # Disestablish stack frame
  ret                     # Return to caller;  (integer) result in %eax



#-----------------------------------------------------------


.data



.align 8
int_fmt:
  .asciz	" %d"

.align 8
real_fmt:
  .asciz " %lf"

.align 8
write_int:
  .asciz "%d"

.align 8
write_real:
  .asciz "%lf"

.align 8
true:
  .asciz "true"

.align 8
false:
  .asciz "false"

.align 8
str_fmt:
  .asciz "%s"

#-----------------------------------------------------------

