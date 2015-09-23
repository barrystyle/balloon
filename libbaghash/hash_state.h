#ifndef __HASH_STATE_H__
#define __HASH_STATE_H__

#include <stddef.h>

struct hash_state {
  size_t n_blocks;
  size_t block_size;
  unsigned char *buffer;
};

int hash_state_init (struct hash_state *s, size_t n_blocks, size_t block_size);
void hash_state_free (struct hash_state *s);

int hash_state_fill (struct hash_state *s, 
    const void *in, size_t inlen,
    const void *salt, size_t saltlen);

#endif