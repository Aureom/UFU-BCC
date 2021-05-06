#include <stdio.h>
#include "hashtable.h"

/*
    Integrantes:
    Kaio Augusto de Souza 11921BCC040
    Joao
*/

int main() {
    FILE* file = fopen("alunos.txt", "r");
    if (file == NULL){
        printf("alunos.txt não foi encontrado.");
        return 0;
    }

    Hash* hashTable = createHash(11, sizeof(Aluno));

    Aluno student; // Leitura dos dados, seguindo o padrao da struct
    while (fscanf(file, "%d %s %d %d %d", &student.matricula, student.name, &student.grades[0], &student.grades[1], &student.grades[2]) != EOF){
        if(!insertHash(hashTable, student.matricula, &student)){
            printf("Erro ao carregar o aluno de matricula %d // NOME: %s\n", student.matricula, student.name);
        }
    }

    fclose(file);

    int opt = -1;
    while (opt != 0){
        printf("\n=====================================\n");
        printf(" [0] Sair\n");
        printf(" [1] Buscar um aluno\n");
        printf(" [2] Adicionar um aluno");
        printf("\n=====================================\n");
        printf("Selecione uma opção: ");

        scanf("%d", &opt);
        switch (opt) {
            case 0:
                printf("Finalizando...\n");
                freeHash(hashTable);
                return 1;
            case 1:
                printf("\nInsira o numero de matricula: ");
                int matricula;
                scanf("%d", &matricula);
                if(findHash(hashTable, matricula, &student)){
                    printf("Dados do aluno:\n");
                    printf(" - Nome: %s\n", student.name);
                    printf(" - Numero de matricula: %d\n", student.matricula);
                    for (int i = 0; i < 3; ++i) {
                        printf(" - Nota da prova %d: %d\n", i, student.grades[i]);
                    }
                }else{
                    printf("Aluno não encontrado\n");
                }
                break;
            case 2:
                printf("\nInsira o numero de matricula: ");
                scanf("%d", &student.matricula);
                printf("\nInsira o nome do aluno: ");
                scanf("%[^\n]s", student.name);
                printf("\nInsira a nota da prova 1: ");
                scanf("%d", &student.grades[0]);
                printf("\nInsira a nota da prova 2: ");
                scanf("%d", &student.grades[1]);
                printf("\nInsira a nota da prova 3: ");
                scanf("%d", &student.grades[2]);
                if(insertHash(hashTable, student.matricula, &student)){
                    printf("Aluno salvo com sucesso!\n");
                }else{
                    printf("Ocorreu um erro ao salvar o aluno\n");
                }
                break;
            default:
                printf("Opção invalida.");
        }
    }


    return 0;
}
