#include "glk.h"
#include "glkstart.h"

int glk_startup_code(glk_startup_t *data)
{
  // Add my own startup code here.

  return TRUE;
}

glk_argumentlist_t glk_arguments[] = {
    {NULL, glk_arg_End, NULL}};
