#include <iostream>
#include <vector>
#include <cmath>
#include <iterator>
using namespace std;

//Project Euler Problem 27: Quadratic Primes
//ANSWER: -59231
//Longest Prime Length( 71 primes)

bool PrimalityDetector(int n);

int main(){

  vector<int> PrimeVec;
  vector<int> QuadraticVal;
  vector<int> primeLength;
  vector<int> productVec;

  int abundantArbiter = 0;
  for(int i = 1; i <= 100; i++){
    for(int a = 1; a < i; a++){
      if(i % a == 0){
        abundantArbiter += a;
        }
    }
    PrimeVec.push_back(abundantArbiter);
    abundantArbiter -= abundantArbiter;
  }

    for(int i = 0; i < PrimeVec.size(); i++){
      if(PrimeVec[i] == 1){
        QuadraticVal.push_back(i + 1);
        QuadraticVal.push_back(-1 * (i + 1)); //Ensures that the absolute value condition is kept
      }
    }





//MAIN ITERATOR: n^2 + an + b
int quadCoefficient = 0;
int secondCoefficient = -999;
int counter = 0;

int parameterVal = pow(0, 2) + 0 + QuadraticVal[0];


  while(counter < QuadraticVal.size()){
    parameterVal = pow(quadCoefficient, 2) + secondCoefficient*quadCoefficient + QuadraticVal[counter];
  if(PrimalityDetector(abs(parameterVal)) == false){
    productVec.push_back(secondCoefficient * QuadraticVal[counter]);
    primeLength.push_back(quadCoefficient);
    quadCoefficient -= quadCoefficient;
    secondCoefficient += 1;
  } else {
    quadCoefficient += 1;
  }
  if(secondCoefficient == 999){
    counter += 1;
    secondCoefficient -= 1998;
  }

}

int val = 0;
for(int i = 0; i < primeLength.size(); i++){
  if(primeLength[i] == *max_element(primeLength.begin(), primeLength.end())){
    val = i;
  }
}

cout << productVec[val] << endl;
cout << val << endl;




}



bool PrimalityDetector(int n){
  int primeCount = 0;
  for(int i = 2; i <= sqrt(n); i++){
    if(n % i == 0){
      primeCount += 1;
    }
  }

  if(primeCount == 0){
    return true;
  }

  return 0;
}
