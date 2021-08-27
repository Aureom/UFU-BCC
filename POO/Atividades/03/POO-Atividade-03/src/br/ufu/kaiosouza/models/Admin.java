package br.ufu.kaiosouza.models;

import br.ufu.kaiosouza.models.Employee;

import java.math.BigDecimal;

public class Admin extends Employee {
    private int extraWorkedHours;

    public Admin(String name, String rg, BigDecimal baseWage) {
        super(name, rg, baseWage);

        this.extraWorkedHours = 0;
    }

    public BigDecimal getWage(){
        BigDecimal wage = getBaseWage()
                .add(getBaseWage()
                        .multiply(new BigDecimal("0.01"))
                        .multiply(new BigDecimal(this.extraWorkedHours))
                );

        this.extraWorkedHours = 0;

        return wage;
    }

    public void addExtraWorkedHours(int hours) {
        extraWorkedHours += hours;
    }

    public int getExtraWorkedHours() {
        return extraWorkedHours;
    }

    public void setExtraWorkedHours(int extraWorkedHours) {
        this.extraWorkedHours = extraWorkedHours;
    }
}
