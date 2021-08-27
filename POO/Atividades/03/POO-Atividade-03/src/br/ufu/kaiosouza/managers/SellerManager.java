package br.ufu.kaiosouza.managers;

import br.ufu.kaiosouza.models.Admin;
import br.ufu.kaiosouza.models.Seller;

import java.math.BigDecimal;

public class SellerManager {
    private final Seller[] sellers;

    public SellerManager() {
        this.sellers = new Seller[5];
    }

    public boolean addSeller(String name, String rg, BigDecimal baseWage) {
        for (int i = 0; i < sellers.length; i++) {
            if(sellers[i] == null) {
                sellers[i] = new Seller(name, rg, baseWage);
                return true;
            }
        }

        return false;
    }

    public Seller getSellerByName(String name){
        for (Seller seller : sellers) {
            if(seller == null) continue;

            if(seller.getName().equalsIgnoreCase(name)) return seller;
        }

        return null;
    }

    public Seller getSellerByRG(String rg){
        for (Seller seller : sellers) {
            if(seller == null) continue;

            if(seller.getRg().equalsIgnoreCase(rg)) return seller;
        }

        return null;
    }

    public boolean removeSellerByName(String name){
        for (int i = 0; i < sellers.length; i++) {
            if(sellers[i] == null) continue;

            if(sellers[i].getName().equalsIgnoreCase(name)) {
                sellers[i] = null;
                return true;
            }
        }

        return false;
    }

    public boolean removeSellerByRG(String name){
        for (int i = 0; i < sellers.length; i++) {
            if(sellers[i] == null) continue;

            if(sellers[i].getName().equalsIgnoreCase(name)) {
                sellers[i] = null;
                return true;
            }
        }

        return false;
    }

    public void printSellers(){
        for (Seller seller : sellers) {
            if(seller == null) continue;
            printSeller(seller);
        }
    }

    public void printSeller(Seller seller){
        System.out.println(seller.getName() + " (Vendedor)");
        System.out.println(" - RG: " + seller.getRg());
        System.out.println(" - Salario base: " + seller.getBaseWage());
        System.out.println(" - Vendas realizadas: " + seller.getSales() + " (R$ " + seller.getSalesAmount() + ")");
        System.out.println(" ===================================================== ");
    }

    public void printPayroll(){
        for (Seller seller : sellers) {
            if(seller == null) continue;
            System.out.println(seller.getName() + " - RG (" + seller.getRg() + ")");
            System.out.println(" - Salario: +" + seller.getWage());
            System.out.println();
        }
    }

}
