package br.ufu.kaiosouza.managers;

import br.ufu.kaiosouza.models.NaveEspacial;

import java.util.Scanner;

public class AmbienteEspacial {
    private final NaveEspacial[] naves;

    public AmbienteEspacial() {
        naves = new NaveEspacial[5];

        try {
            start();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public void printMainMenu(){
        clearConsole();
        System.out.println(" ");
        System.out.println(" 0 - Sair");
        if(getNavesCount() < 5) {
            System.out.println(" 1 - Construir uma nova nave ");
        }
        System.out.println(" 2 - Mostrar naves ");
        System.out.println(" ");
        if(getNavesCount() > 3){
            System.out.println(" ⚠ Superpopulação de naves ⚠ ");
            System.out.println(" ");
        }
    }

    public void createNave(String s) throws InterruptedException {
        if(getNavesCount() >= 3){
            NaveEspacial nave = new NaveEspacial("Nave com defeito", 0);
            naves[getNavesCount()] = nave;
            System.out.println(" ⚠ Superpopulação de naves ⚠ ");
            System.out.println(" Nave construida com defeito");
            Thread.sleep(3000);
            nave.mostrarNave();
            Thread.sleep(3000);
        }else {
            NaveEspacial nave = new NaveEspacial(s);
            naves[getNavesCount()] = nave;
            System.out.println(" Uma nova nave foi construida...");
            nave.mostrarNave();
            Thread.sleep(3000);
        }

        printMainMenu();
    }

    public void mostrarNaves() {
        if(getNavesCount() == 0) {
            System.out.println(" ");
            System.out.println(" > Nenhuma nave foi criada");
            System.out.println(" ");
        }else {
            System.out.println(" ");
            for (int i = 0; i < 5; i++) {
                if(naves[i] != null) {
                    naves[i].mostrarNave();
                }
                System.out.println(" ");
            }
        }

        System.out.println(" 0 - Sair ");
        System.out.println(" 1 - Voltar ");

    }

    public int getNavesCount(){
        int count = 0;
        for (int i = 0; i < 5; i++) {
            if(naves[i] != null) count ++;
        }
        return count;
    }

    private void clearConsole() {
        for (int i = 0; i < 50; i++) {
            System.out.println();
        }
    }

    private void start() throws InterruptedException {
        Scanner scanner = new Scanner(System.in);
        printMainMenu();

        while (true){
            if(scanner.nextInt() == 1){
                if(getNavesCount() < 5) {
                    clearConsole();
                    System.out.println(" Porfavor insira o nome da nave: ");
                    createNave(scanner.next());
                }
            }else if(scanner.nextInt() == 2){
                clearConsole();
                mostrarNaves();
                if(scanner.nextInt() == 0) {
                    System.exit(0);
                }else if(scanner.nextInt() == 1) {
                    printMainMenu();
                }
            }else if(scanner.nextInt() == 0){
                System.exit(0);
            }
        }
    }
}
