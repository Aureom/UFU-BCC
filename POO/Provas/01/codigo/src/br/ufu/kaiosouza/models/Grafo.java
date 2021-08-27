package br.ufu.kaiosouza.models;

import java.util.LinkedList;

public class Grafo {
    private final int vertex;
    private final LinkedList<Integer>[] edge;


    public Grafo(int vertices) {
        this.vertex = vertices;
        this.edge = new LinkedList[vertices];
        for (int i = 0; i < vertices; i++) {
            edge[i] = new LinkedList<>();
        }
    }

    public void addEdge(int vertex, int vertex2){
        if(edge[vertex].contains(vertex2)) return;
        edge[vertex].add(vertex2);
        edge[vertex2].add(vertex);
    }

    public boolean isParent(int vertex, int vertex2) {
        return edge[vertex].contains(vertex2);
    }

    public void printGraph(){
        System.out.println("Total de vertices: " + vertex);
        for (int i = 0; i < vertex; i++) {
            System.out.print("V[" + i + "] = " + edge[i]);
            System.out.println();
        }
    }

    public int getVertex() {
        return vertex;
    }
}
