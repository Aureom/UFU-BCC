package br.ufu.kaiosouza.models;

import java.util.SortedSet;
import java.util.TreeSet;

public class IntSetImpl implements IntSet{

    private final SortedSet<Integer> integers;

    public IntSetImpl() {
        this.integers = new TreeSet<>();
    }

    @Override
    public void insert(int x) {
        // Como já estou utilizando Set para armazenar os ints, não teremos repetidos
        integers.add(x);
    }

    @Override
    public void insertAll(int[] v) {
        for (int i : v) {
            integers.add(i);
        }
    }

    @Override
    public void remove(int x) {
        integers.remove(x);
    }

    @Override
    public boolean isIn(int x) {
        return integers.contains(x);
    }

    @Override
    public int size() {
        return integers.size();
    }
}
