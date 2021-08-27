package br.ufu.kaiosouza.models;

import br.ufu.kaiosouza.types.MediaType;

import java.math.BigDecimal;
import java.util.List;

public class ItemAudio extends Item{
    private String singer;
    private int tracks;

    public ItemAudio(String name, String genere, int year, int amount, BigDecimal price, String singer, int tracks) {
        super(name, genere, MediaType.AUDIO, year, amount, price);
        this.singer = singer;
        this.tracks = tracks;
    }

    public String getSinger() {
        return singer;
    }

    public void setSinger(String singer) {
        this.singer = singer;
    }

    public int getTracks() {
        return tracks;
    }

    public void setTracks(int tracks) {
        this.tracks = tracks;
    }
}
