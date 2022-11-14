package br.ufu.kaiosouza.model;

import br.ufu.kaiosouza.batata.*;

public class Player02 extends Player {
    private Jump jump;
    private Attack attack;
    private Run run;

    public Player02() {
        super(new HighJump(), new FastRun(), new MediumAttack());
    }

}
