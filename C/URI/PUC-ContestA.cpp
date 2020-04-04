//
// Created by kaioa on 02/04/2020.
//

#include <iostream>
#include <iomanip>

using namespace std;

int radiansToHours(int rad){
    return rad/30;
}

int radiansToMinutes(int rad){
    return rad/6;
}

int main() {
    ios::sync_with_stdio(false); // O codigo roda 3x mais rapido, mas não posso utilizar a biblioteca stdio

    int radianHours, radianMinutes;
    while(cin >> radianHours >> radianMinutes){
        int hours = radiansToHours(radianHours), minutes = radiansToMinutes(radianMinutes);
        cout << std::setw(2) << std::setfill('0') << hours << ":" << std::setw(2) << std::setfill('0') << minutes << endl;
    }

    return(0);
}