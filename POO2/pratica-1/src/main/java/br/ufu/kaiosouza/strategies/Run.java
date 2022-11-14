package br.ufu.kaiosouza.batata;

public sealed interface Run permits FastRun, MediumRun, SlowRun {
    void run();
}
