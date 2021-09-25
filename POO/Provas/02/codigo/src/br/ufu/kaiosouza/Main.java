package br.ufu.kaiosouza;

import br.ufu.kaiosouza.managers.IntSet2Manager;
import br.ufu.kaiosouza.models.IntSetImpl2;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        IntSet2Manager intSet2Manager = new IntSet2Manager();
        while (true) {
            System.out.println();
            System.out.println(" MENU - PRINCIPAL");
            System.out.println();
            System.out.println(" 0 - Sair");
            System.out.println(" 1 - Selecionar um conjunto");
            System.out.println(" 2 - Criar conjunto");


            int opt = scanner.nextInt();
            if (opt == 1) {
                System.out.println(" MENU - SELECIONAR CONJUNTO");
                System.out.println();
                System.out.println(" Qualquer tecla - Voltar");
                if(intSet2Manager.getIntSets().isEmpty()){
                    System.out.println(" Nenhum conjunto foi criado");
                }else {
                    for (int i = 0; i < intSet2Manager.getIntSets().size(); i++) {
                        System.out.println(" " + i + " - " + intSet2Manager.getIntSets().get(i).getPreview());
                    }
                }

                opt = scanner.nextInt();
                if (0 <= opt && opt < intSet2Manager.getIntSets().size()) {
                    IntSetImpl2 selectedIntSet2 = intSet2Manager.getIntSets().get(opt);

                    System.out.println(" MENU - OPÇÕES CONJUNTO");
                    System.out.println();
                    System.out.println(" Qualquer tecla - Voltar");
                    System.out.println(" 1 - Somar elementos");
                    System.out.println(" 2 - Gerar interseção com outro conjunto");
                    System.out.println(" 3 - Gerar união com outro conjunto");

                    opt = scanner.nextInt();
                    if (opt == 1) {
                        System.out.println("Soma total dos elementos = " + selectedIntSet2.sumOfAll());
                    } else if (opt == 2) {
                        for (int i = 0; i < intSet2Manager.getIntSets().size(); i++) {
                            System.out.println(" " + i + " - " + intSet2Manager.getIntSets().get(i).getPreview());
                        }

                        opt = scanner.nextInt();
                        if (0 < opt && opt < intSet2Manager.getIntSets().size()) {
                            IntSetImpl2 selectedIntSet2Intersection = intSet2Manager.getIntSets().get(opt);
                            System.out.println(selectedIntSet2Intersection.getIntersection(selectedIntSet2).getIntegers().toString());
                        }
                    }else if (opt == 3) {
                        for (int i = 0; i < intSet2Manager.getIntSets().size(); i++) {
                            System.out.println(" " + i + " - " + intSet2Manager.getIntSets().get(i).getPreview());
                        }

                        opt = scanner.nextInt();
                        if (0 < opt && opt < intSet2Manager.getIntSets().size()) {
                            IntSetImpl2 selectedIntSet2Union = intSet2Manager.getIntSets().get(opt);
                            System.out.println(selectedIntSet2Union.getUnion(selectedIntSet2).getIntegers().toString());
                        }
                    }
                }
            }else if(opt == 2){
                System.out.println("Insira os numeros, quando quiser parar escreva \"parar\"");

                IntSetImpl2 intSet = new IntSetImpl2();
                String input = scanner.next();

                while (!input.equalsIgnoreCase("parar")){
                    if(isInt(input)) {
                        intSet.insert(Integer.parseInt(input));
                        System.out.println(intSet.getIntegers());
                    }else {
                        System.out.println("Insira somente numeros, quando quiser parar escreva \"parar\"");
                    }
                    input = scanner.next();
                }

                intSet2Manager.getIntSets().add(intSet);
            } else if(opt == 0) {
                System.exit(0);
            }
        }
    }

    public static boolean isInt(String str) {
        try {
            Integer.parseInt(str);
            return true;
        } catch(NumberFormatException e){
            return false;
        }
    }
}
