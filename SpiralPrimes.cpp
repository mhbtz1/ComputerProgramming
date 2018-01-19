#include <iostream>
#include <vector>
#include <cmath>
#include <cstdlib>
using namespace std;

//Problem 58: Spiral Primes
//IF VAL CAN BE RETURNED TO MAIN FUNCTION THE PROBLEM IS SOLVED
//Update: Problem has been SOLVED

int determinePrimality(vector<int> n);

int main(){
  int UlamSpiralLen = 8; //Length of Ulam Spiral across its sides
  int arr[] = {1, 3, 13, 31, 5, 17, 37, 7, 21, 43, 9, 25, 49};

  vector<int> UlamSpiralDiagVal(arr, arr + sizeof(arr)/sizeof(arr[0]));

  while(true){
  UlamSpiralDiagVal.push_back(pow(UlamSpiralLen, 2));
  UlamSpiralDiagVal.push_back(UlamSpiralLen*(UlamSpiralLen - 1) + 1);
  UlamSpiralDiagVal.push_back(pow(UlamSpiralLen,2) + 1);
  UlamSpiralDiagVal.push_back(UlamSpiralLen*(UlamSpiralLen + 1) + 1);
  determinePrimality(UlamSpiralDiagVal);
  UlamSpiralLen += 1;
}

}

int determinePrimality(vector<int> n){
  int counter = 0;
  vector<int> ProtoVecVal;
  int abundantArbiter = 0;
  for(int i = 0; i <= n.size(); i++){
    for(int a = 1; a < n[i]; a++){
      if(n[i] % a == 0){
        abundantArbiter += a;
        }
    }
    ProtoVecVal.push_back(abundantArbiter);
    abundantArbiter -= abundantArbiter;
  }

  for(int i = 0; i < ProtoVecVal.size(); i++){
    if(ProtoVecVal[i] == 1){
      counter += 1;
    }
  }
  cout << counter << endl;
  cout << n.size() << endl;
  cout << (float)counter/n.size() << endl;





  return 0;
}
