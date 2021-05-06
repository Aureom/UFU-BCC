#define LOAD_FACTOR 0.75
typedef struct pair {
    int key;
    void *value;
} Pair;

// A Struct abaixo pode ser modificada para qualquer outra
typedef struct aluno {
    int matricula;
    char name[50];
    int grades[3];
} Aluno;

typedef struct hash Hash;
Hash* createHash(int TABLE_SIZE, int TYPE_SIZE);
void freeHash(Hash* hash);
int insertHash(Hash* hash, int key, void *value);
int findHash(Hash* hash, int key, void *value);