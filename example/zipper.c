#include "libzip.h"
#include <stdint.h>
#include <stdio.h>

static uint8_t buffer[512] = {[1] = 1,     [10] = 10,   [20] = 20,  [30] = 30,
                              [100] = 100, [200] = 200, [300] = 255};

__attribute__((export_name("run"))) int run() {
  printf("-- in zipper run()\n");

  size_t out_size = 0;
  void *out = zip(buffer, 512, &out_size);

  return out_size == 256 ? 0 : 1;
}

__attribute__((export_name("_start"))) void start() { run(); }