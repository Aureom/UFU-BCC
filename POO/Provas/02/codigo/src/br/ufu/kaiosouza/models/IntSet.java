package br.ufu.kaiosouza.models;

public interface IntSet {
    void insert(int x);
    void insertAll(int[] v);
    void remove(int x);
    boolean isIn(int x);
    int size();
}
