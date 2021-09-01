package br.ufu.kaiosouza.models;

public abstract class FormaTridimensional extends Forma {
    private Double x, y, z;

    public FormaTridimensional(String color, Double x, Double y, Double z) {
        super(color);
        this.x = x;
        this.y = y;
        this.z = z;
    }

    public Double getX() {
        return x;
    }

    public void setX(Double x) {
        this.x = x;
    }

    public Double getY() {
        return y;
    }

    public void setY(Double y) {
        this.y = y;
    }

    public Double getZ() {
        return z;
    }

    public void setZ(Double z) {
        this.z = z;
    }

    public abstract double obterVolume();
}
