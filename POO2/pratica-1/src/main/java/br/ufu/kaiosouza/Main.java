package br.ufu.kaiosouza;

import br.ufu.kaiosouza.model.Player01;
import br.ufu.kaiosouza.model.Player03;

public class Main {
    public static void main(String[] args) {
        System.out.println("Player 01: ");
        var player01 = new Player01();
        player01.run();
        player01.jump();
        player01.attack();

        System.out.println("Player 02: ");
        var player02 = new Player01();
        player02.run();
        player02.jump();
        player02.attack();

        System.out.println("Player 03: ");
        var player03 = new Player03();
        player03.run();
        player03.jump();
        player03.attack();
    }
}