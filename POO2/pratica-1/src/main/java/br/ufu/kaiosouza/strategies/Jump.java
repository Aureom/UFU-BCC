package br.ufu.kaiosouza.batata;

public sealed interface Jump permits HighJump, LowJump, MediumJump {
    void jump();
}
