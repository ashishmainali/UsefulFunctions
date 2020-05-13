// Dalio, Brian A.
// dalioba
// 2018-11-14

// To get the assembly language version:
//   gcc -S -fno-asynchronous-unwind-tables -fno-stack-protector useful.c

#include <stdio.h>

//--------------------------------------

int readInteger( int *np ) {
  int result = scanf( " %d", np );
  return 1 == result;
}

int readReal( double *dp ) {
  int result = scanf( " %lf", dp );
  return 1 == result;
}

//--------------------------------------

int writeBoolean( int n ) {
  int result = printf( "%s", n ? "true" : "false" );
  fflush( stdout );
  return 0 <= result;
}

int writeInteger( int n ) {
  int result = printf( "%d", n );
  fflush( stdout );
  return 0 <= result;
}

int writeNewLine() {
  int result = putchar( '\n' );
  fflush( stdout );
  return EOF != result;
}

int writeReal( double d ) {
  int result = printf( "%lf", d );
  fflush( stdout );
  return 0 <= result;
}

int writeString( char *str ) {
  int result = printf( "%s", str );
  fflush( stdout );
  return 0 <= result;
}

//--------------------------------------
