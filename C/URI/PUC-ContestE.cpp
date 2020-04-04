//
// Created by kaioa on 02/04/2020.
//

#include <iostream>

using namespace std;

string grammarCheck(string input){
    for (int i = 0; i < input.length(); ++i) {
        if(input[i] == ' '){
            if(input[i+1] == ',' || input[i+1] == '.'){
                input.erase(i, 1);
            }
        }
    }
    return input;
}

int main() {
    ios::sync_with_stdio(false); // O codigo roda 3x mais rapido, mas não posso utilizar a biblioteca stdio

    string line;
    while(getline(cin, line) && !line.empty()){
        cout << grammarCheck(line) << endl;
    }

    return(0);
}