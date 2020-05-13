// Dalio, Brian A.
// dalioba
// 2018-10-30

#include <stdio.h>
#include <stdlib.h>

int main() {
  int chrs;

  chrs = printf(
    "Hello, world, from printf! %c, %d, %f\n",
    'a', 123, 3.141592653589793 );

  exit( chrs );
}