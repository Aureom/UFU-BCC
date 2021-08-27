package br.ufu.kaiosouza.models;

import java.math.BigDecimal;

public class Employee {
    private String name, rg;
    private BigDecimal baseWage;
    public Employee(String name, String rg, BigDecimal baseWage) {
        this.name = name;
        this.rg = rg;
        this.baseWage = baseWage;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public BigDecimal getBaseWage() {
        return baseWage;
    }

    public void setBaseWage(BigDecimal baseWage) {
        this.baseWage = baseWage;
    }
}
