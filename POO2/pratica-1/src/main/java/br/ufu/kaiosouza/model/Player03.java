package br.ufu.kaiosouza.model;

import br.ufu.kaiosouza.batata.*;

public class Player03 extends Player {
    private Jump jump;
    private Attack attack;
    private Run run;

    public Player03() {
        super(new LowJump(), new FastRun(), new StrongAttack());
    }

}
