# Useful Functions
A set of useful functions in assembly language for x86 architecture used to build a compiler for a simple language.

## Description
  useful_test.c is a test harness that will exercise the
     routines below.

     useful_libc.s is a framework necessary for
     the seven assembly language routines available:

        int readInteger( int *np )
        int readReal( double *dp )
        int writeBoolean( int b )
        int writeInteger( int n )
        int writeNewLine()
        int writeReal( double d )
        int writeString( char *str )
     
     Each of the routines starts with the
     same two-instruction prologue and end with the same
     two-instruction epilogue:
```
  pushq   %rbp          # Save old base (frame) ptr
  movq    %rsp, %rbp    # Make the current stack ptr the base (frame) ptr

  ...

  leave                 # Disestablish stack frame
  ret                   # Return to caller;  (integer) result in %eax
  ```
  useful_test.c is a C program that will exercise the assembly routines.  
  The assembly file is compiled and linked with this test routine.

        
## Testing
Each of the assembly language routines should return 1 for
     success and 0 for failure.
      Here's what the output of useful_test.c looks like when run
     with the reference routines:

```Just a test: intVal = 0xDEADBEEF, fpVal = nan
Type an integer: 123
Success!  Read 123
Type a real: 123.456
Success!  Read 123.456000
Write an integer [123] Success!
<Not followed by newline ... yet>
Success!  newline printed
Write a real [123.456000] Success!
<Here's a string with no newline>Success!  string printed
Write a zero-length string [] Success!  string printed
```

     For this run, I typed 123 as the integer input and 123.456 as
     the real input.


## Compile and run
1. Clone the repository onto your disk: `git clone https://github.com/ashishmainali/usefulfunctions.git` 
2. Assemble the source code into object code `as --gstabs+ -o u.o useful_libc.s`
   (--gstabs+ includes debugging info for gdb)
3. Make a static executable from the object code,
   linking it with stdlib and a test harness:  `gcc -static -o test u.o useful_test.c` 
4. Run: `./test `
5. Display the exit code from the run: `echo $?`
