package br.ufu.kaiosouza.managers;

import br.ufu.kaiosouza.models.Admin;
import br.ufu.kaiosouza.models.Seller;

import java.math.BigDecimal;

public class AdminManager {
    private final Admin[] admins;

    public AdminManager() {
        this.admins = new Admin[5];
    }

    public boolean addAdmin(String name, String rg, BigDecimal baseWage) {
        for (int i = 0; i < admins.length; i++) {
            if(admins[i] == null) {
                admins[i] = new Admin(name, rg, baseWage);
                return true;
            }
        }

        return false;
    }

    public Admin getAdminByName(String name){
        for (Admin admin : admins) {
            if(admin == null) continue;

            if(admin.getName().equalsIgnoreCase(name)) return admin;
        }

        return null;
    }

    public Admin getAdminByRG(String rg){
        for (Admin admin : admins) {
            if(admin == null) continue;

            if(admin.getRg().equalsIgnoreCase(rg)) return admin;
        }

        return null;
    }

    public boolean removeAdminByName(String name){
        for (int i = 0; i < admins.length; i++) {
            if(admins[i] == null) continue;

            if(admins[i].getName().equalsIgnoreCase(name)) {
                admins[i] = null;
                return true;
            }
        }

        return false;
    }

    public boolean removeAdminByRG(String name){
        for (int i = 0; i < admins.length; i++) {
            if(admins[i] == null) continue;

            if(admins[i].getName().equalsIgnoreCase(name)) {
                admins[i] = null;
                return true;
            }
        }

        return false;
    }

    public void printAdmins(){
        for (Admin admin : admins) {
            if(admin == null) continue;
            printAdmim(admin);
        }
    }

    public void printAdmim(Admin admin){
        System.out.println(admin.getName() + " (Administrador)");
        System.out.println(" - RG: " + admin.getRg());
        System.out.println(" - Salario base: " + admin.getBaseWage());
        System.out.println(" - Horas extras: " + admin.getExtraWorkedHours());
        System.out.println(" ===================================================== ");
    }

    public void printPayroll(){
        for (Admin admin : admins) {
            if(admin == null) continue;
            System.out.println(admin.getName() + " - RG (" + admin.getRg() + ")");
            System.out.println(" - Salario: +" + admin.getWage());
            System.out.println();
        }
    }
}
