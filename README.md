# Useful Functions
A set of useful functions in assembly language for x86 architecture

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
