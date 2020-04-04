//
// Created by kaioa on 02/04/2020.
//

#include <iostream>

using namespace std;

static void PrintLine(int n, int i)
{
    // Number of integers in current matrix
    int n2 = n*n;
    // Number of itegers in previous matrix of size n - 1
    int m2 = (n - 1)*(n - 1);

    if (n % 2 == 0)
    {
        if (i == n - 1)
        {
            // n is even and we are at the last row so just
            // print it
            for(int k = n2; k > n2 - n; k--)
            {
                cout << k << endl;
            }
        }
        else
        {
            // Print row from previous matrix of size n - 1
            // first and then print value that belongs to current
            // matrix. Previous matrix is at the top left corner
            // so no need to adjust row index
            PrintLine(n - 1, i);
            // Skip all integers from previous matrix and upper
            // ones in this columnas integers must form clockwise
            // spiral
            cout << m2 + 1 + i << endl;
        }
    }
    else
    {
        if (i == 0)
        {
            // n is odd and we are at the first row so just
            // print it
            for(int k = m2 + n; k <= n2; k++)
            {
                cout << k << endl;
            }
        }
        else
        {
            // Print value that belongs to current matrix and
            // then print row from previous matrix of size n - 1
            // Skip all integers from previous matric and bottom
            // ones in this column as integers must form clockwise
            // spiral
            cout << m2 + n - i << endl;
            // Previous matrix is at the bottom right corner so
            // row index must be reduced by 1
            PrintLine(n - 1, i - 1);
        }
    }
}



int main() {
    ios::sync_with_stdio(false); // O codigo roda 3x mais rapido, mas não posso utilizar a biblioteca stdio
    for(int i = 0; i < 5; i++)
    {
        PrintLine(5, i);
    }

    return(0);
}