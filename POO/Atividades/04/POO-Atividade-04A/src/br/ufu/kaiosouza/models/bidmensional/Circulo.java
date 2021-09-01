package br.ufu.kaiosouza.models.bidmensional;

import br.ufu.kaiosouza.models.FormaBidimensional;

public class Circulo extends FormaBidimensional {
    private Double radius;

    public Circulo(String color, Double x, Double y, Double radius) {
        super(color, x, y);
        this.radius = radius;
    }

    public Double getRadius() {
        return radius;
    }

    public boolean isIntersection(Circulo c2) {
        return Math.hypot(this.getX() - c2.getX(), this.getY() - c2.getY()) <= (this.getRadius() - c2.radius);
    }

    @Override
    public double obterArea() {
        return radius * radius * Math.PI;
    }
}
