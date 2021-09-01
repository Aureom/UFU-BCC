package br.ufu.kaiosouza.models;

public abstract class FormaBidimensional extends Forma {
    private Double x, y;

    public FormaBidimensional(String color, Double x, Double y) {
        super(color);
        this.x = x;
        this.y = y;
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

    public abstract double obterArea();
}
