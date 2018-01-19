#include <iostream>
#include <math.h>
using namespace std;

//Project Euler Problem 28: Number Spiral Diagonals

int main(){
  int counter = 0;
  int totalSum = 1;
  int additionVal = 1;

  for(int i = 3; i <= 1001; i++){
    if(i % 2 != 0){
      while(counter <= 3){
        additionVal += sqrt(i * i) - 1;
        totalSum += additionVal;
        cout << totalSum << endl;
        counter += 1;
      }
  counter -= counter;
    }
  }
}
