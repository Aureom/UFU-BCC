package br.ufu.kaiosouza.models.bidmensional;

import br.ufu.kaiosouza.models.FormaBidimensional;

public class Quadrado extends FormaBidimensional {
    private Double side;

    public Quadrado(String color, Double x, Double y, Double side) {
        super(color, x, y);
        this.side = side;
    }

    public Double getSide() {
        return side;
    }

    @Override
    public double obterArea() {
        return side * side;
    }
}
