package br.ufu.kaiosouza.models.tridimensional;

import br.ufu.kaiosouza.models.FormaTridimensional;
import br.ufu.kaiosouza.models.bidmensional.Circulo;

public class Esfera extends FormaTridimensional {
    private Double radius;

    public Esfera(String color, Double x, Double y, Double z, Double radius) {
        super(color, x, y, z);
        this.radius = radius;
    }

    public Double getRadius() {
        return radius;
    }

    public boolean isIntersection(Esfera e2) {
        return Math.sqrt((this.getX() * this.getX() - e2.getX() * e2.getX()) +
                        (this.getY() * this.getY() - e2.getY() * e2.getY()) +
                        (this.getZ() * this.getZ() - e2.getZ() * e2.getZ())) <= (this.getRadius() - e2.radius);
    }

    @Override
    public double obterVolume() {
        return (4.0/3.0) * Math.PI * (radius*radius*radius);
    }
}
