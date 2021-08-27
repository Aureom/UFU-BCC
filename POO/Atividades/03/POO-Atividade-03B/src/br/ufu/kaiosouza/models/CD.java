package br.ufu.kaiosouza.models;

import br.ufu.kaiosouza.types.MediaType;

import java.math.BigDecimal;

public class CD extends ItemAudio {
    public CD(String name, String genere, int year, int amount, BigDecimal price, String singer, int tracks) {
        super(name, genere, year, amount, price, singer, tracks);
    }
}
