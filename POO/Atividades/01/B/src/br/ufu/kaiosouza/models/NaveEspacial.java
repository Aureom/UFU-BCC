package br.ufu.kaiosouza.models;

import java.util.SplittableRandom;

public class NaveEspacial {

    private final String nome;
    private final int velocidade;

    public NaveEspacial(String nome) {
        SplittableRandom splittableRandom = new SplittableRandom();

        this.nome = nome;
        this.velocidade = splittableRandom.nextInt(5, 10);
    }

    public NaveEspacial(String nome, int velocidade) {
        this.nome = nome;
        this.velocidade = velocidade;
    }

    public void mostrarNave(){
        if(velocidade == 0) {
            System.out.println(" ⚠ Nave (" + nome + ") inoperante ⚠");
        }else {
            System.out.println(" Nave " + nome);
            System.out.println("  - Velocidade: " + velocidade + " anos-luz/s");
        }
    }

    public boolean naveMaisRapida(NaveEspacial n){
        return n.velocidade > velocidade;
    }
}
