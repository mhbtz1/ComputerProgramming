#include <iostream>
#include <vector>
using namespace std;


//Project Euler Problem 69: Euler Totient Maximum Function
//PROBLEM SOLVED
//Answer: 510510

bool factorEvaluator(int a, int b);

int main(){

  int valOfTotients = 1;

  vector<float> counterOfTotients;
  for(int val = 3; val <= 100; val++){
    for(int i = 2; i <= val; i++){
      if(factorEvaluator(i, val) == true){
        valOfTotients += 1;
      }
    }

    if()

    counterOfTotients.push_back((float)val/valOfTotients);
    cout << (float)val/valOfTotients << endl;
    valOfTotients -= valOfTotients - 1;
  }

  float it = *max_element(counterOfTotients.begin(), counterOfTotients.end());
  cout << it << endl;

  int counter = 0;
  while(counterOfTotients[counter] != it){
    counter += 1;
  }

  cout << counter + 3 << endl;


  return 0;

}



bool factorEvaluator(int a, int b){
  vector<int> integerA;
  vector<int> integerB;
  int counterVar = 0;

  for(int i = 2; i <= a; i++){
    if(a % i == 0){
      integerA.push_back(i);
    }
  }

  for(int val = 2; val <= b; val++){
    if(b % val == 0){
      integerB.push_back(val);
    }
  }

  for(int i = 0; i <= integerA.size() - 1; i++){
    for(int a = 0; a <= integerB.size() - 1; a++){
      if(integerA[i] % integerB[a] == 0){
        counterVar += 1;
    }
  }
}

  if(counterVar == 0){
    return true;
  }

  return 0;
}
