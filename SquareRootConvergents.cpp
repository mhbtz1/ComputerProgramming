#include <iostream>
#include <cmath>
#include <string>
using namespace std;

//Project Euler Problem 54: Square Root Convergents
int numFunc(int num, int dec);
int decFunc(int num, int dec);

int main(){

  long long int numerator = 3;
  long long int numeratorTwo;


  long long int denominator = 2;
  long long int denominatorTwo;

  int counter = 0;

for(int iterator = 1; iterator <= 1000; iterator++){

  numeratorTwo = numerator;
  denominatorTwo = denominator;

  cout << numFunc(numerator, denominator) << "/" << decFunc(numerator, denominator) << endl;

  numerator = numFunc(numerator, denominator); //good
  denominator = decFunc(numeratorTwo, denominatorTwo); //good

  string numeratorStr = to_string((numerator));
  string denominatorStr = to_string((denominator));
  if(numeratorStr.size() > denominatorStr.size() ){
      counter += 1;
      cout << "-------------------------------" << endl;
  }
}

cout << counter << endl;

}

int numFunc(int num, int dec){
  num +=  2 * dec;
  return num;
}

int decFunc(int num, int dec){
  dec += num;
  return dec;
}
