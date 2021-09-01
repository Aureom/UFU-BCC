package br.ufu.kaiosouza.managers;

import br.ufu.kaiosouza.models.Forma;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class FormaManager {
    private ArrayList<Forma> formas;

    public FormaManager() {
        this.formas = new ArrayList<>();
    }

    public ArrayList<Forma> getFormas() {
        return formas;
    }

    public List<Forma> getForma(String forma){
        return formas.stream().filter(f -> f.getClass().getSimpleName().equalsIgnoreCase(forma)).collect(Collectors.toList());
    }
}

