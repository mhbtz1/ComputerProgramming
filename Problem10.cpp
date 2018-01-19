#include <iostream>
#include <vector>
using namespace std;

int main(){

long long int finalVal = 0;
vector<int> ProtoVecVal;

int abundantArbiter = 0;
for(int i = 1; i <= 2000000; i++){
  for(int a = 1; a < i; a++){
    if(i % a == 0){
      abundantArbiter += a;
      }
  }
  ProtoVecVal.push_back(abundantArbiter);
  abundantArbiter -= abundantArbiter;
}

  for(int i = 0; i < ProtoVecVal.size(); i++){
    if(ProtoVecVal[i] == 1){
      cout << i + 1 << endl;
      finalVal += i + 1;
    }
  }
  cout << "-----------------" << endl;
  cout << finalVal << endl;
}
