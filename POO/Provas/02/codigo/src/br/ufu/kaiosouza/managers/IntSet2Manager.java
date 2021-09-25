package br.ufu.kaiosouza.managers;

import br.ufu.kaiosouza.models.IntSetImpl2;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class IntSet2Manager {
    private List<IntSetImpl2> intSets;

    public IntSet2Manager() {
        this.intSets = new ArrayList<>();
    }

    public List<IntSetImpl2> getIntSets() {
        return intSets;
    }
}
