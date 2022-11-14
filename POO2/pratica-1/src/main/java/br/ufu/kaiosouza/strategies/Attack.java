package br.ufu.kaiosouza.batata;

public sealed interface Attack permits MediumAttack, StrongAttack, WeakAttack {
    void attack();
}
