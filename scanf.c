// Dalio, Brian A.
// dalioba
// 2018-10-31

#include <stdio.h>
#include <stdlib.h>

int main() {
  int    conv;
  double fpVal;

  conv = scanf( " %lf", &fpVal );

  if ( conv == 1 ) {
    printf( "Scanned %lf\n", fpVal );
  } else {
    puts( "Scan was not successful." );
  }

  return conv;
}