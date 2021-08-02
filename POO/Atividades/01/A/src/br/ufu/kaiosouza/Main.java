package br.ufu.kaiosouza;

import br.ufu.kaiosouza.models.Tempo;

import java.util.SplittableRandom;

public class Main {

    public static void main(String[] args) {
        SplittableRandom splittableRandom = new SplittableRandom();

        for (int i = 0; i < 10; i++) {
            Tempo tempo = new Tempo(splittableRandom.nextInt(0, 23), splittableRandom.nextInt(0, 59), splittableRandom.nextInt(0, 59));

            System.out.println(tempo.get12HTime());
            System.out.println(tempo.get24HTime());
        }

        Tempo tempoS = new Tempo(splittableRandom.nextInt(0, 23), splittableRandom.nextInt(0, 59), 10);
        for (int i = 0; i < 60; i++) {
            tempoS.incrementSecond();
            System.out.print(tempoS.get24HTime() + " | ");
        }

        System.out.println();

        Tempo tempoM = new Tempo(splittableRandom.nextInt(0, 23), 10, splittableRandom.nextInt(0, 59));
        for (int i = 0; i < 60; i++) {
            tempoM.incrementMinute();
            System.out.print(tempoM.get24HTime() + " | ");
        }

        System.out.println();

        Tempo tempoH = new Tempo(10, splittableRandom.nextInt(0, 59), splittableRandom.nextInt(0, 59));
        for (int i = 0; i < 60; i++) {
            tempoH.incrementHour();
            System.out.print(tempoH.get24HTime() + " | ");
        }
    }
}
