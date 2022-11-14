package br.ufu.kaiosouza.model;

import br.ufu.kaiosouza.batata.Attack;
import br.ufu.kaiosouza.batata.Jump;
import br.ufu.kaiosouza.batata.Run;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@AllArgsConstructor
public abstract class Player {

    private Jump jump;
    private Run run;
    private Attack attack;

    public void jump() {
        jump.jump();
    }

    public void run() {
        run.run();
    }

    public void attack() {
        attack.attack();
    }
}
