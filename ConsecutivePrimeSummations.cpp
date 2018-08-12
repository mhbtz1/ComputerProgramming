#include <iostream>
#include <vector>
using namespace std;

//Project Euler Problem 50: Consecutive Prime Summations(consecutive primes don't have to start at 2)

int totient(int int1);
int primeIterator(int counter, vector<int> vector, int param);
int main(){

int param = 25000;

//Iterator-counting variables
int determiningVal = 2;
int counter = 0;
vector<int> primeContainer;

  //Creates vector of all prime values from a given index specified in the loop
  while(determiningVal <= param){
    if(totient(determiningVal) ){
      primeContainer.push_back(determiningVal);
      determiningVal += 1;
    } else {
      determiningVal += 1;
    }
  }

int a;
for(int i = 0; i <= (primeContainer.size() - 1)/2; i++){
  a = primeIterator(i, primeContainer, param);
}



}

int totient(int int1){

  int int2 = 1;
  for(int i = 1; i <= int1; i++){
    if(int1 % i != 0){
      int2 += 1;
    }
  }

  if(int2 == int1 - 1){
    return true;
  } else {
    return false;
  }
}

int primeIterator(int counter, vector<int> primeContainer, int param){

  int tentativeVal = 0;
  int finalVal = 0;
  int decrement = 0;



  while(decrement <= primeContainer.size() - (counter + 1) ){

    tentativeVal += primeContainer[counter];

    for(int i = counter + 1; i < primeContainer.size() - decrement; i++){
      tentativeVal += primeContainer[i];
    }

    if(totient(tentativeVal) && tentativeVal <= 4*param){
      finalVal = tentativeVal;
      cout << finalVal  << ":" << (primeContainer.size() - decrement) - (counter) << endl;

    }



    tentativeVal = 0;
    decrement += 1;

  }




  return 0;
}
