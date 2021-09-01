package br.ufu.kaiosouza.models;

import java.util.UUID;

public abstract class Forma {
    private final UUID uuid;
    private String color;

    public Forma(String color) {
        this.uuid = UUID.randomUUID();
        this.color = color;
    }

    public UUID getUuid() {
        return uuid;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

}
