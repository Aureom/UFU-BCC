//
// Created by kaioa on 02/04/2020.
//

#include <iostream>
#include <cmath>

using namespace std;

struct map{
    int x = 0, y = 0, instructions, rangeLimit, objectiveX, objectiveY;
};

int main() {
    ios::sync_with_stdio(false); // O codigo roda 3x mais rapido, mas não posso utilizar a biblioteca stdio

    struct map map;
    cin >> map.instructions >> map.rangeLimit >> map.objectiveX >> map.objectiveY;
    for (int i = 0; i < map.instructions; ++i) {
        if(i == 0){
            if(sqrt(((map.objectiveX - map.x) * (map.objectiveX - map.x)) + ((map.objectiveY - map.y) * (map.objectiveY - map.y))) > map.rangeLimit){
                cout << "Trap 1" << endl;
                break;
            }
        }

        char instruction;
        cin >> instruction;

        if(instruction == 'C') map.y++;
        else if(instruction == 'B') map.y--;
        else if(instruction == 'D') map.x++;
        else if(instruction == 'E') map.x--;
        double result = sqrt(((map.objectiveX - map.x) * (map.objectiveX - map.x)) + ((map.objectiveY - map.y) * (map.objectiveY - map.y)));

        if(result > map.rangeLimit){
            cout << "Trap " << i + 1 << endl;
            break;
        }else if(i == map.instructions-1){
            if(map.x == map.objectiveX && map.y == map.objectiveY){
                cout << "Sucesso" << endl;
            }else {
                cout << "Trap " << i + 1 << endl;
            }
        }
    }

    return(0);
}