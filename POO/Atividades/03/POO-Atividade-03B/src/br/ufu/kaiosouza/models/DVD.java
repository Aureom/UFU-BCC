package br.ufu.kaiosouza.models;

import br.ufu.kaiosouza.types.MediaType;

import java.math.BigDecimal;
import java.util.List;

public class DVD extends ItemVideo{

    public DVD(String name, String genere, int year, int amount, BigDecimal price, List<String> actors, String director, int duration, int ageRating) {
        super(name, genere, year, amount, price, actors, director, duration, ageRating);
    }


}
