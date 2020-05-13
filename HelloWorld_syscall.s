# Dalio, Brian A.
# dalioba
# 2018-10-10

# as --gstabs+ -o hw.o HelloWorld_syscall.s
# ld -o test hw.o

.global _start

.text
_start:
  movl    $4, %eax      # Sys call number:  sys_write
  movl    $1, %ebx      # Arg 1:  destination: stdout
  movl    $msg, %ecx    # Arg 2:  buffer start
  movl    $len, %edx    # Arg 3:  num chars to write
  int     $0x80         # SYSCALL!

  movl    $1, %eax      # Sys call number:  sys_exit
  movl    $0, %ebx      # Arg 1:  exit code
  int     $0x80         # SYSCALL!

.data
msg:
  .ascii  "Hello, world, from a syscall!\n"
  len =   . - msg
