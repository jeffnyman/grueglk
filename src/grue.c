#include <stdio.h>
#include "glk.h"

void glk_main()
{
  printf("Grue - connected to MinGlk\n");

  event_t ev;

  while (1)
  {
    glk_select(&ev);
    switch (ev.type)
    {
    default:
      /* do nothing */
      break;
    }
  }
}
