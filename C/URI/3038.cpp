//
// Created by kaioa on 22/03/2020.
//

#include <iostream>

using namespace std;

int main() {
    ios::sync_with_stdio(false); // O codigo roda 3x mais rapido, mas não posso utilizar a biblioteca stdio

    string line;
    while(getline(cin, line)){
        for(char& c : line){
            if(c == '@') c = 'a';
            else if(c == '&') c = 'e';
            else if(c == '!') c = 'i';
            else if(c == '*') c = 'o';
            else if(c == '#') c = 'u';
        }
        cout << line << endl;
    }
    return(0);
}