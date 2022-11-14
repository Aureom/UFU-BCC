package br.ufu.kaiosouza.model;

import br.ufu.kaiosouza.batata.*;
import lombok.AllArgsConstructor;

public class Player01 extends Player {
    private Jump jump;
    private Attack attack;
    private Run run;

    public Player01() {
        super(new MediumJump(), new MediumRun(), new StrongAttack());
    }

}
