//
// Created by kaioa on 20/03/2020.
//

#include <iostream>
#include <bits/stdc++.h>

using namespace std;

string encrypt(string input){
    if(input.empty()) return NULL;

    for (char & i : input) {
        if(i >= 65 && i <= 90 ||  i >= 97 && i <= 122) i += 3;
    }

    for (int j = 0; j < input.length()/2.0; ++j) {
        input[j] = input[j] - 1;
    }

    reverse(input.begin(), input.end());
    return input;
}

int main() {
    int cases;
    cin >> cases; cin.ignore();

    string helper;
    for (int i = 0; i < cases; ++i) {
        getline(cin, helper);
        cout << encrypt(helper) << endl;
    }

    return(0);
}