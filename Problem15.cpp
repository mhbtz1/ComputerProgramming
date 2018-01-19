#include <iostream>
using namespace std;

//Project Euler Problem 12: Highly Divisible Triangular Integers Solution


int main(){

  int counter = 1;
  int factorVal = 0;

  while(factorVal < 500){
    int compareVar = counter * (counter + 1) * 0.5;
    factorVal -= factorVal;
    for(int i = 1; i <= counter * (counter + 1) * 0.5; i++){
      if(compareVar % i == 0){
        factorVal += 1;
      }
    }


    cout << factorVal << endl;
    counter += 1;


  }

  cout << (counter * (counter + 1) * 0.5) - counter << endl;


//ANSWER: 7.65765e + 07

}
