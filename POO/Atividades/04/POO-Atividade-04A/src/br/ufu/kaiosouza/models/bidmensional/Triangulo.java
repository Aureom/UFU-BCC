package br.ufu.kaiosouza.models.bidmensional;

import br.ufu.kaiosouza.models.FormaBidimensional;

public class Triangulo extends FormaBidimensional {
    private Double base;
    private Double height;

    public Triangulo(String color, Double x, Double y, Double base, Double height) {
        super(color, x, y);
        this.base = base;
        this.height = height;
    }

    public Double getBase() {
        return base;
    }

    public Double getHeight() {
        return height;
    }

    @Override
    public double obterArea() {
        return (base * height) / 2;
    }
}
