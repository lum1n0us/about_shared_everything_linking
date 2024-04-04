#ifndef _LIBZIP_H_
#define _LIBZIP_H_

#include <stdlib.h>

// TODO: how to enable __attribute__((import_module(""), import_name("zip")))
void *zip(void *in, size_t in_size, size_t *out_size);

#endif /* _LIBZIP_H_ */
