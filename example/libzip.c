#include "libzip.h"
#include <stdio.h>
#include <string.h>

__attribute__((export_name("zip"))) void *zip(void *in, size_t in_size,
                                              size_t *out_size) {
  printf("--> in zip()\n");

  if (in_size < 256)
    return NULL;

  void *p = calloc(1, 256);
  memcpy(p, in, 256);
  *out_size = 256;
  return p;
}
