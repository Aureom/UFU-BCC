package br.ufu.kaiosouza.models;

public class Tempo {

    private int hora, minuto, segundo;

    public Tempo(int hora, int minuto, int segundo) {
        this.hora = (hora >= 0 && 24 > hora) ? hora : 0;
        this.minuto = (minuto >= 0 && 60 > minuto) ? minuto : 0;
        this.segundo = (segundo >= 0 && 60 > segundo) ? segundo : 0;
    }

    public String get24HTime() {
        return zeroFix(hora) + ":" + zeroFix(minuto) + ":" + zeroFix(segundo);
    }

    public String get12HTime() {
        if(hora > 12) return zeroFix(hora - 12) + ":" + zeroFix(minuto) + ":" + zeroFix(segundo) + " PM";
        return zeroFix(hora) + ":" + zeroFix(minuto) + ":" + zeroFix(segundo) + " AM";
    }

    private String zeroFix(int i){
        if(10 > i) return "0" + i;
        return String.valueOf(i);
    }

    public void incrementHour(){
        if(hora == 23) hora = 0;
        else hora++;
    }

    public void decrementHour(){
        if(hora == 0) hora = 23;
        else hora--;
    }

    public void incrementMinute(){
        if(minuto == 59) {
            incrementHour();
            minuto = 0;
        }else minuto++;
    }

    public void decrementMinute(){
        if(minuto == 0) {
            decrementHour();
            minuto = 59;
        }else minuto--;
    }

    public void incrementSecond(){
        if(segundo == 59) {
            incrementMinute();
            segundo = 0;
        }else segundo++;
    }

    public void decrementSecond(){
        if(segundo == 0) {
            decrementMinute();
            segundo = 59;
        }else segundo--;
    }

    public boolean isLate(Tempo time){
        if(time.hora > hora) return true;
        if(time.hora == hora && time.minuto > minuto) return true;
        if(time.hora == hora && time.minuto == minuto && time.segundo > segundo) return true;
        return false;
    }
}
