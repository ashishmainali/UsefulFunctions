# Dalio, Brian A.
# dalioba
# 2018-10-10

# as --gstabs+ -o hw.o HelloWorld_libc.s
# gcc -static -o test hw.o

.global main

.text
main:
  movq    $msg, %rdi    # Arg 1: string.
  call    puts          # puts( const char *str )

  movl    $0, %edi      # Arg 1: exit code
  call    exit          # exit( int status )

.data

# Need asciz to get NUL byte on end.
# puts adds a \n so don't need one.
msg:
  .asciz  "Hello, world, from puts!"
