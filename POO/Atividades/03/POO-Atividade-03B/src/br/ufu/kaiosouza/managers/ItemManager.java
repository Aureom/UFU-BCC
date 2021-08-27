package br.ufu.kaiosouza.managers;

import br.ufu.kaiosouza.models.CD;
import br.ufu.kaiosouza.models.DVD;
import br.ufu.kaiosouza.models.VHS;

public class ItemManager {

    private DVD dvds[];
    private VHS vhss[];
    private CD cds[];

    public ItemManager(){
        dvds = new DVD[5];
        vhss = new VHS[5];
        cds = new CD[5];
    }

    public DVD[] getDvds() {
        return dvds;
    }

    public VHS[] getVhss() {
        return vhss;
    }

    public CD[] getCds() {
        return cds;
    }
}
