#include <stdlib.h>
#include <string.h>
#include "hashtable.h"

#include <stdio.h>

struct hash {
    int count, TABLE_SIZE, TYPE_SIZE;
    int threshold;

    Pair **items;
};

int generateLinearHashKey(int key, int pos, int TABLE_SIZE){
    return ((key + pos) & 0x7FFFFFFF) % TABLE_SIZE;
}

int generateHashKey(int key, int TABLE_SIZE){
    return (key & 0x7FFFFFFF) % TABLE_SIZE;
}

Hash* createHash(int TABLE_SIZE, int TYPE_SIZE){
    if(TABLE_SIZE <= 0) TABLE_SIZE = 1;

    Hash* hash = (Hash*) malloc(sizeof(Hash));
    if(hash != NULL){
        hash->TYPE_SIZE = TYPE_SIZE;
        hash->TABLE_SIZE = TABLE_SIZE;
        hash->threshold = (int) (TABLE_SIZE * LOAD_FACTOR);
        hash->items = (Pair **) calloc(TABLE_SIZE, sizeof(Pair *));

        if(hash->items == NULL) {
            free(hash);
            return NULL;
        }

        for (int i = 0; i < hash->TABLE_SIZE; i++) {
            hash->items[i] = NULL;
        }

        hash->count = 0;
    }

    return hash;
}

void freeHash(Hash* hash){
    if(hash != NULL){
        for (int i = 0; i < hash->TABLE_SIZE; ++i) { // liberar memoria dos items da hash
            if(hash->items[i] != NULL) {
                free(hash->items[i]->value);
                free(hash->items[i]);
            }
        }

        free(hash->items);
    }
}

int insertHash(Hash* hash, int key, void *value) {
    if(hash == NULL || hash->count == hash->TABLE_SIZE) return 0;

    if(hash->threshold < hash->count){ // chegamos no limite (threshold)
        Hash* newHash = createHash(hash->TABLE_SIZE * 2, hash->TYPE_SIZE);

        for (int i = 0; i < hash->TABLE_SIZE; ++i) { // rehash apos bater o limite do threshold
            if(hash->items[i] != NULL){
                insertHash(newHash, hash->items[i]->key, hash->items[i]->value);
            }
        }

        freeHash(hash); // liberando a memoria da hash antiga

        *hash = *newHash;
    }

    int hashKey = generateHashKey(key, hash->TABLE_SIZE);
    for (int i = 0; i < hash->TABLE_SIZE ; i++) {
        int index = generateLinearHashKey(hashKey, i, hash->TABLE_SIZE);
        if(hash->items[index] == NULL){
            Pair *pair = (Pair*) malloc(sizeof(Pair));
            if(pair == NULL) return 0;

            pair->key = key;
            pair->value = malloc(hash->TYPE_SIZE);
            memcpy(pair->value, value, hash->TYPE_SIZE);

            hash->items[index] = pair;
            hash->count++;

            return 1;
        }
    }

    return 0;
}

int findHash(Hash* hash, int key, void *value){
    if(hash == NULL) return 0;

    int hashKey = generateHashKey(key, hash->TABLE_SIZE);

    for (int i = 0; i < hash->TABLE_SIZE; i++) {
        int index = generateLinearHashKey(hashKey, i, hash->TABLE_SIZE);

        if(hash->items[index] == NULL){
            return 0;
        }

        if(hash->items[index]->key == key){
            memcpy(value, hash->items[index]->value, hash->TYPE_SIZE);
            return 1;
        }
    }

    return 0;
}