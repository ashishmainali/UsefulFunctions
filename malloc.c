// Dalio, Brian A.
// dalioba
// 2018-10-11

#include <stdio.h>
#include <stdlib.h>

int main() {
  int *ptr;

  ptr = (int *) malloc( sizeof(int) );

  if (ptr == NULL) {
    puts( "malloc returned NULL" );
    return 1;
  }

  *ptr = 42;
  printf( "*ptr is %d\n", *ptr );

  free( ptr );

  return 0;
}
