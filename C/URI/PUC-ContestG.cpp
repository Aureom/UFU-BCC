//
// Created by kaioa on 02/04/2020.
//

#include <iostream>
#include <cmath>

using namespace std;

struct battleField{
    int x, y, soldiers;
};

struct soldier{
    int x, y, strength;
};

double area(int x1, int y1, int x2, int y2, int x3, int y3){
    return abs((x1*(y2-y3) + x2*(y3-y1)+ x3*(y1-y2))/2.0);
}

bool isFromTeamA(soldier soldier, battleField battleField){
    double battleFieldTriangle = area(0, 0, 0, battleField.y, battleField.x, battleField.y);
    double a1 = area(soldier.x, soldier.y, 0, battleField.y, battleField.x, battleField.y);
    double a2 = area(0, 0, soldier.x, soldier.y, battleField.x, battleField.y);
    double a3 = area(0, 0, 0, battleField.y, soldier.x, soldier.y);

    return (battleFieldTriangle >= a1 + a2 + a3);
}

int main() {
    ios::sync_with_stdio(false); // O codigo roda 3x mais rapido, mas não posso utilizar a biblioteca stdio

    struct battleField battleField;
    cin >> battleField.x >> battleField.y >> battleField.soldiers;

    int teamAStrength = 0, teamBStrength = 0;
    for (int i = 0; i < battleField.soldiers; ++i) {
        struct soldier soldier;
        cin >> soldier.x >> soldier.y >> soldier.strength;
        isFromTeamA(soldier, battleField) ? teamAStrength += soldier.strength : teamBStrength += soldier.strength;
    }

    cout << teamAStrength << ' ' << teamBStrength << endl;

    return(0);
}