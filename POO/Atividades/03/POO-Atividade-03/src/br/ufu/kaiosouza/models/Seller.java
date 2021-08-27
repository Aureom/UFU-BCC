package br.ufu.kaiosouza.models;

import java.math.BigDecimal;

public class Seller extends Employee {
    private int sales;
    private BigDecimal salesAmount;

    public Seller(String name, String rg, BigDecimal baseWage) {
        super(name, rg, baseWage);

        this.sales = 0;
        this.salesAmount = new BigDecimal(0);
    }

    public BigDecimal getWage(){
        BigDecimal wage = salesAmount.multiply(new BigDecimal("0.05")).add(getBaseWage());

        this.sales = 0;
        this.salesAmount = new BigDecimal(0);

        return wage;
    }

    public void addSale(BigDecimal saleAmount) {
        this.sales++;
        this.salesAmount = this.salesAmount.add(saleAmount);
    }

    public int getSales() {
        return sales;
    }

    public void setSales(int sales) {
        this.sales = sales;
    }

    public BigDecimal getSalesAmount() {
        return salesAmount;
    }

    public void setSalesAmount(BigDecimal salesAmount) {
        this.salesAmount = salesAmount;
    }
}
