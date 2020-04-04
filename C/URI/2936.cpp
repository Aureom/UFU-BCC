//
// Created by kaioa on 02/04/2020.
//

#include <iostream>

using namespace std;

int main() {
    ios::sync_with_stdio(false);

    unsigned short int curupira, boitata, boto, mapinguari, iara;
    cin >> curupira >> boitata >> boto >> mapinguari >> iara;
    cout << (curupira*300 + boitata*1500 + boto*600 + mapinguari*1000 + iara*150 + 225) << endl;
}