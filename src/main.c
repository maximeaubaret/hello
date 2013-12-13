#include <stdio.h>
#include <stdlib.h>
#include <hello.h>

int
main (
    int argc,
    char **argv)
{
  hello("John");
  hello("Marie");
  hello("Judith");
  helloworld();

  return EXIT_SUCCESS;
}

