// Dalio, Brian A.
// dalioba
// 2018-11-14

// as -o u.o useful_libc.s
// gcc -static -o test u.o useful_test.c
// ./test

#include <stdio.h>
#include <math.h>

extern int readInteger( int *np );
extern int readReal( double *dp );
extern int writeBoolean( int n );
extern int writeInteger( int n );
extern int writeNewLine();
extern int writeReal( double d );
extern int writeString( char *str );

int main() {
  int    intVal = 0xDEADBEEF;
  double fpVal  = NAN;

  printf( "Just a test: intVal = 0x%X, fpVal = %lf\n", intVal, fpVal );

  printf( "Type an integer: " ); fflush( stdout );
  if ( readInteger( &intVal ) ) {
    printf( "Success!  Read %d\n", intVal );
  } else {
    puts( "readInteger failed" );
  }

  printf( "Type a real: " ); fflush( stdout );
  if ( readReal( &fpVal ) ) {
    printf( "Success!  Read %lf\n", fpVal );
  } else {
    puts( "readReal failed" );
  }

  printf( "Write an integer [" ); fflush( stdout );
  if ( writeInteger( intVal ) ) {
    printf( "] Success!\n" );
  } else {
    puts( "] writeInteger failed" );
  }

  printf( "<Not followed by newline ... yet>" ); fflush( stdout );
  if ( writeNewLine() ) {
    printf( "Success!  newline printed\n" );
  } else {
    puts( "writeNewLine failed" );
  }

  printf( "Write a real [" ); fflush( stdout );
  if ( writeReal( fpVal ) ) {
    printf( "] Success!\n" );
  } else {
    puts( "] writeReal failed" );
  }

  if ( writeString( "<Here's a string with no newline>" ) ) {
    printf( "Success!  string printed\n" );
  } else {
    puts( "writeString failed" );
  }

  printf( "Write a zero-length string [" ); fflush( stdout );
  if ( writeString( "" ) ) {
    printf( "] Success!  string printed\n" );
  } else {
    puts( "] writeString failed" );
  }

  printf( "Write boolean true [" ); fflush( stdout );
  if ( writeBoolean( 1 ) ) {
    printf( "] Success!  boolean printed\n" );
  } else {
    puts( "] writeBoolean failed" );
  }

  printf( "Write boolean false [" ); fflush( stdout );
  if ( writeBoolean( 0 ) ) {
    printf( "] Success!  boolean printed\n" );
  } else {
    puts( "] writeBoolean failed" );
  }

}
