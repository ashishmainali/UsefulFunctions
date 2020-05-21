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

  pushq   %rbp          # Save old base (frame) ptr
  movq    %rsp, %rbp    # Make the current stack ptr the base (frame) ptr

  ...

  leave                 # Disestablish stack frame
  ret                   # Return to caller;  (integer) result in %eax
  
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

## Usage
```c++
#include "HAASH.h" //include HAASH definition

HAASH haash; //instantiate a HAASH object
haash.hash("Example"); //returns the hash as a string
```
## Test Cases
Verify the the output of the program matches with given test cases.
1. Clone the repository onto your disk: `git clone https://github.com/ashishmainali/usefulfunctions.git` 
2. Compile: `g++ test.cpp HAASH.cpp`
3. Run: `./a.out > my_output.dat`
4. Run: `diff my_output.dat test_output.dat`
The two outputs should be identical . 
If there is no output after running the diff command, the test cases generates same output. 


## Compile and run
1. Clone the repository onto your disk: `git clone https://github.com/ashishmainali/haash.git` 
2. Include the header file in your .cpp file: `#include "HAASH.h"`
3. Compile: `g++ yourFileName.cpp HAASH.cpp` 
4. Run: `./a.out`

## Example
hashval.cpp provides an example usage of this hashing algorithm repository. It hashes the first argument given when running the object file.

1. Clone the repository onto your disk: `https://github.com/ashishmainali/haash.git`
2. Compile: `make main`
3. Run: `./main test`
4. Output: `74b4bc52b89c473b76cf5d0b09954e769f80903618da64248dda1f4ef3fb81d348ab2595bd0e6e1fb579f576d7ae5b2b2b49adb86a42857ec9344405b00e90`
