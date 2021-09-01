package br.ufu.kaiosouza;

import br.ufu.kaiosouza.managers.FormaManager;
import br.ufu.kaiosouza.models.bidmensional.Circulo;
import br.ufu.kaiosouza.models.bidmensional.Quadrado;
import br.ufu.kaiosouza.models.bidmensional.Triangulo;
import br.ufu.kaiosouza.models.tridimensional.Cubo;
import br.ufu.kaiosouza.models.tridimensional.Esfera;
import br.ufu.kaiosouza.models.tridimensional.Tetraedro;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        FormaManager formaManager = new FormaManager();

        Scanner scanner = new Scanner(System.in);
        while (true) {
            String color;
            double x, y, z, aux, aux2;

            System.out.println();
            System.out.println(" 0 - Sair");
            System.out.println(" 1 - Criar formas");
            System.out.println(" 2 - Mostrar formas criadas");


            int opt = scanner.nextInt();
            if (opt == 1) {
                System.out.println();
                System.out.println(" 0 - Sair");
                System.out.println(" 1 - Criar circulo");
                System.out.println(" 2 - Criar quadrado");
                System.out.println(" 3 - Criar triangulo");
                System.out.println(" 4 - Criar cubo");
                System.out.println(" 5 - Criar esfera");
                System.out.println(" 6 - Criar tetraedro");

                opt = scanner.nextInt();
                if (opt == 1) {
                    System.out.println("Inisira a cor: ");
                    color = scanner.next();
                    System.out.println("Inisira o ponto central X: ");
                    x = scanner.nextDouble();
                    System.out.println("Inisira o ponto central Y: ");
                    y = scanner.nextDouble();
                    System.out.println("Inisira o raio do circulo: ");
                    aux = scanner.nextDouble();

                    formaManager.getFormas().add(new Circulo(color, x, y, aux));
                } else if (opt == 2) {
                    System.out.println("Inisira a cor: ");
                    color = scanner.next();
                    System.out.println("Inisira o ponto central X: ");
                    x = scanner.nextDouble();
                    System.out.println("Inisira o ponto central Y: ");
                    y = scanner.nextDouble();
                    System.out.println("Inisira o tamanho do lado do quadrado: ");
                    aux = scanner.nextDouble();

                    formaManager.getFormas().add(new Quadrado(color, x, y, aux));
                } else if (opt == 3) {
                    System.out.println("Inisira a cor: ");
                    color = scanner.next();
                    System.out.println("Inisira o ponto central X: ");
                    x = scanner.nextDouble();
                    System.out.println("Inisira o ponto central Y: ");
                    y = scanner.nextDouble();
                    System.out.println("Inisira o tamanho da base: ");
                    aux = scanner.nextDouble();
                    System.out.println("Inisira a altura do triangulo: ");
                    aux2 = scanner.nextDouble();

                    formaManager.getFormas().add(new Triangulo(color, x, y, aux, aux2));
                } else if (opt == 4) {
                    System.out.println("Inisira a cor: ");
                    color = scanner.next();
                    System.out.println("Inisira o ponto central X: ");
                    x = scanner.nextDouble();
                    System.out.println("Inisira o ponto central Y: ");
                    y = scanner.nextDouble();
                    System.out.println("Inisira o ponto central Z: ");
                    z = scanner.nextDouble();
                    System.out.println("Inisira o tamanho da aresta do cubo: ");
                    aux = scanner.nextDouble();

                    formaManager.getFormas().add(new Cubo(color, x, y, z, aux));
                } else if (opt == 5) {
                    System.out.println("Inisira a cor: ");
                    color = scanner.next();
                    System.out.println("Inisira o ponto central X: ");
                    x = scanner.nextDouble();
                    System.out.println("Inisira o ponto central Y: ");
                    y = scanner.nextDouble();
                    System.out.println("Inisira o ponto central Z: ");
                    z = scanner.nextDouble();
                    System.out.println("Inisira o raio da esfera: ");
                    aux = scanner.nextDouble();

                    formaManager.getFormas().add(new Esfera(color, x, y, z, aux));
                } else if (opt == 6) {
                    System.out.println("Inisira a cor: ");
                    color = scanner.next();
                    System.out.println("Inisira o ponto central X: ");
                    x = scanner.nextDouble();
                    System.out.println("Inisira o ponto central Y: ");
                    y = scanner.nextDouble();
                    System.out.println("Inisira o ponto central Z: ");
                    z = scanner.nextDouble();
                    System.out.println("Inisira a altura do tetraedro: ");
                    aux = scanner.nextDouble();
                    System.out.println("Inisira a base do tetraedro: ");
                    aux2 = scanner.nextDouble();

                    formaManager.getFormas().add(new Tetraedro(color, x, y, z, aux, aux2));
                }
            }else if(opt == 2){

            }
        }

    }
}