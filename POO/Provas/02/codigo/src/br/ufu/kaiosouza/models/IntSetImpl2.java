package br.ufu.kaiosouza.models;

import java.util.SortedSet;
import java.util.TreeSet;
import java.util.stream.Collectors;

public class IntSetImpl2 implements IntSet{

    private final SortedSet<Integer> integers;

    public IntSetImpl2() {
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

    public int sumOfAll() {
        return integers.stream().mapToInt(Integer::intValue).sum();
    }

    public IntSetImpl2 getIntersection(IntSetImpl2 intSet) {
        IntSetImpl2 intSetIntersection = new IntSetImpl2();

        this.integers.forEach(i -> {
            if(intSet.isIn(i)){
                intSetIntersection.insert(i);
            }
        });

        return intSetIntersection;
    }

    public IntSetImpl2 getUnion(IntSetImpl2 intSet) {
        IntSetImpl2 intSetUnion = new IntSetImpl2();

        // Como já estou utilizando Set para armazenar os ints, não teremos repetidos
        intSetUnion.integers.addAll(intSet.integers);
        intSetUnion.integers.addAll(this.integers);

        return intSetUnion;
    }

    public String getPreview() {
        if(integers.size() > 20) {
            String preview = integers.stream().limit(20).collect(Collectors.toList()).toString();
            return preview.substring(0, preview.length() - 1) + "...";
        }else {
            return integers.toString();
        }
    }

    public SortedSet<Integer> getIntegers() {
        return integers;
    }
}
