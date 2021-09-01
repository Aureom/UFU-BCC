package br.ufu.kaiosouza.models.tridimensional;

import br.ufu.kaiosouza.models.FormaTridimensional;

public class Tetraedro extends FormaTridimensional {
    private Double height;
    private Double baseHeight;

    public Tetraedro(String color, Double x, Double y, Double z, Double height, Double baseHeight) {
        super(color, x, y, z);
        this.height = height;
        this.baseHeight = baseHeight;
    }


    public Double getHeight() {
        return height;
    }

    @Override
    public double obterVolume() {
        return (1.0/3.0) * baseHeight * height;
    }
}
