#ifndef GT_START_H
#define GT_START_H

#ifndef TRUE
#define TRUE 1
#endif

typedef struct glk_startup_struct
{
  int argc;
  char *argv;
} glk_startup_t;

extern int glk_startup_code(glk_startup_t *data);

#endif
