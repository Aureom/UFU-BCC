package br.ufu.kaiosouza.models;

import br.ufu.kaiosouza.types.MediaType;

import java.math.BigDecimal;
import java.util.List;

public class VHS extends ItemVideo{
    private boolean isRewound;

    public VHS(String name, String genere, int year, int amount, BigDecimal price, List<String> actors, String director, int duration, int ageRating) {
        super(name, genere, year, amount, price, actors, director, duration, ageRating);
    }

    public boolean isRewound() {
        return isRewound;
    }

    public void setRewound(boolean rewound) {
        isRewound = rewound;
    }
}
