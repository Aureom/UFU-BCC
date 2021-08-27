package br.ufu.kaiosouza;

import br.ufu.kaiosouza.models.Grafo;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Grafo grafo = null;

        while (true){
            if(grafo == null){
                System.out.println("Insira o tamanho do grafo (vertices): ");
                int i = scanner.nextInt();
                if(i < 1) return;
                grafo = new Grafo(i);
            }

            System.out.println();
            System.out.println(" 0 - Sair");
            System.out.println(" 1 - Adicionar aresta");
            System.out.println(" 2 - Verificar aresta parente");
            System.out.println(" 3 - Printar grafo");

            int opt = scanner.nextInt();
            if(opt == 1){
                int v1, v2;
                System.out.println("Insira o vertice 1: ");
                v1 = scanner.nextInt();
                System.out.println("Insira o vertice 2: ");
                v2 = scanner.nextInt();

                if(grafo.getVertex() < v1 || grafo.getVertex() < v2) {
                    System.out.println("Valores fora dos limites do grafo!");
                    return;
                }

                grafo.addEdge(v1, v2);
            }else if(opt == 2){
                int v1, v2;
                System.out.println("Insira o vertice 1: ");
                v1 = scanner.nextInt();
                System.out.println("Insira o vertice 2: ");
                v2 = scanner.nextInt();

                if(grafo.getVertex() < v1 || grafo.getVertex() < v2) {
                    System.out.println("Valores fora dos limites do grafo!");
                    return;
                }

                if(grafo.isParent(v1, v2)){
                    System.out.println("Os vertices " + v1 + " e " + v2 + " são parentes!");
                }else{
                    System.out.println("Os vertices " + v1 + " e " + v2 + " NÃO são parentes!");
                }
            }else if(opt == 3){
                grafo.printGraph();
            }else if(opt == 0){
                System.exit(0);
            }
        }

        /* Igual o exemplo do PDF do exercicio "https://i.imgur.com/8qHSpya.png"
        Grafo grafo = new Grafo(5);
        grafo.addEdge(0, 1);
        grafo.addEdge(0, 4);
        grafo.addEdge(1, 3);
        grafo.addEdge(1, 4);
        grafo.addEdge(2, 1);
        grafo.addEdge(2, 3);
        grafo.addEdge(3, 4);

        grafo.printGraph();
        */
    }
}
