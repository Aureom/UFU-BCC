package br.ufu.kaiosouza.models;

import br.ufu.kaiosouza.types.MediaType;

import java.math.BigDecimal;
import java.util.List;

public class ItemVideo extends Item{
    private List<String> actors;
    private String director;
    private int duration, ageRating;

    public ItemVideo(String name, String genere, int year, int amount, BigDecimal price, List<String> actors, String director, int duration, int ageRating) {
        super(name, genere, MediaType.VIDEO, year, amount, price);
        this.actors = actors;
        this.director = director;
        this.duration = duration;
        this.ageRating = ageRating;
    }

    public List<String> getActors() {
        return actors;
    }

    public void setActors(List<String> actors) {
        this.actors = actors;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public int getAgeRating() {
        return ageRating;
    }

    public void setAgeRating(int ageRating) {
        this.ageRating = ageRating;
    }
}
