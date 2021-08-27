package br.ufu.kaiosouza;

import br.ufu.kaiosouza.managers.AdminManager;
import br.ufu.kaiosouza.managers.SellerManager;
import br.ufu.kaiosouza.models.Admin;
import br.ufu.kaiosouza.models.Seller;

import java.math.BigDecimal;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        AdminManager adminManager = new AdminManager();
        SellerManager sellerManager = new SellerManager();

        Scanner scanner = new Scanner(System.in);
        while (true){
            String name, rg;
            BigDecimal baseWage, saleAmount;
            int hours;

            System.out.println();
            System.out.println(" 0 - Sair");
            System.out.println(" 1 - Opções administadores");
            System.out.println(" 2 - Opções vendedores");

            int opt = scanner.nextInt();
            if(opt == 1){
                System.out.println();
                System.out.println(" Qualquer tecla - Voltar");
                System.out.println(" 1 - Adicionar administrador");
                System.out.println(" 2 - Remover administrador");
                System.out.println(" 3 - Visualizar um administrador");
                System.out.println(" 4 - Listar administradores");
                System.out.println(" 5 - Adicionar hora extra");
                System.out.println(" 6 - Gerar folha de pagamentos");


                opt = scanner.nextInt();
                if(opt == 1){
                    System.out.println("Inisira o nome: ");
                    name = scanner.next();
                    System.out.println("Inisira o rg: ");
                    rg = scanner.next();
                    System.out.println("Inisira o salario base: ");
                    baseWage = scanner.nextBigDecimal();

                    adminManager.addAdmin(name, rg, baseWage);
                }else if(opt == 2) {
                    System.out.println("Inisira o nome: ");
                    name = scanner.next();

                    if(adminManager.removeAdminByName(name)){
                        System.out.println(name + " removido!");
                    }else{
                        System.out.println(name + " não está registrado!");
                    }
                }else if(opt == 3) {
                    System.out.println("Inisira o nome: ");
                    name = scanner.next();

                    Admin admin = adminManager.getAdminByName(name);
                    adminManager.printAdmim(admin);
                }else if(opt == 4) {
                    adminManager.printAdmins();
                }else if(opt == 5) {
                    System.out.println("Inisira o nome: ");
                    name = scanner.next();
                    System.out.println("Inisira o numero de horas: ");
                    hours = scanner.nextInt();

                    Admin admin = adminManager.getAdminByName(name);
                    if(admin == null){
                        System.out.println("Administrador nao registrado");
                        return;
                    }
                    admin.addExtraWorkedHours(hours);
                    System.out.println("Venda adicionada");
                }else if(opt == 6) {
                    adminManager.printPayroll();
                }
            }else if(opt == 2){
                System.out.println();
                System.out.println(" Qualquer tecla - Voltar");
                System.out.println(" 1 - Adicionar vendedor");
                System.out.println(" 2 - Remover vendedor");
                System.out.println(" 3 - Visualizar um vendedor");
                System.out.println(" 4 - Listar vendedores");
                System.out.println(" 5 - Adicionar venda");
                System.out.println(" 6 - Gerar folha de pagamentos");

                opt = scanner.nextInt();
                if(opt == 1){
                    System.out.println("Inisira o nome: ");
                    name = scanner.next();
                    System.out.println("Inisira o rg: ");
                    rg = scanner.next();
                    System.out.println("Inisira o salario base: ");
                    baseWage = scanner.nextBigDecimal();

                    sellerManager.addSeller(name, rg, baseWage);
                }else if(opt == 2) {
                    System.out.println("Inisira o nome: ");
                    name = scanner.next();

                    if(sellerManager.removeSellerByName(name)){
                        System.out.println(name + " removido!");
                    }else{
                        System.out.println(name + " não está registrado!");
                    }
                }else if(opt == 3) {
                    System.out.println("Inisira o nome: ");
                    name = scanner.next();

                    Seller seller = sellerManager.getSellerByName(name);
                    sellerManager.printSeller(seller);
                }else if(opt == 4) {
                    sellerManager.printSellers();
                }else if(opt == 5) {
                    System.out.println("Inisira o nome: ");
                    name = scanner.next();
                    System.out.println("Inisira o valor da venda: ");
                    saleAmount = scanner.nextBigDecimal();

                    Seller seller = sellerManager.getSellerByName(name);
                    if(seller == null){
                        System.out.println("Administrador nao registrado");
                        return;
                    }
                    seller.addSale(saleAmount);
                    System.out.println("Venda adicionada");
                }else if(opt == 6) {
                    sellerManager.printPayroll();
                }
            }else if(opt == 0){
                System.exit(0);
            }
        }
    }
}
