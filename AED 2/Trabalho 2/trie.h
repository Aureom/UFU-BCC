#define ALPHABET_SIZE 26
typedef struct node* Trie;

struct node {
    Trie child[ALPHABET_SIZE];
    unsigned short end;
};

Trie* createTrie();
void freeTrie(Trie* trie);
int insertTrie(Trie* trie, char *str);
int findTrie(Trie* trie, char *str);
int removeTrie(Trie* trie, char *str);
//imprime todas as palavras armazenadas
void printTrie(Trie* trie);
//imprime todas as palavras que começam com “prefixo”
void autocompleteTrie(Trie* trie, char *prefix);
