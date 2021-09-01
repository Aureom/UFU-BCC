package br.ufu.kaiosouza.models.tridimensional;

import br.ufu.kaiosouza.models.FormaTridimensional;

public class Cubo extends FormaTridimensional {
    private Double side;

    public Cubo(String color, Double x, Double y, Double z, Double side) {
        super(color, x, y, z);
        this.side = side;
    }

    public Double getSide() {
        return side;
    }

    @Override
    public double obterVolume() {
        return side * side * side;
    }
}
