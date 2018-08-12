#include <iostream>
#include <vector>
using namespace std;

//Non-Abundant Summations: Project Euler Number 23

int main(){

vector<int> ProtoVecVal;
vector<int> abundantVec;
vector<int> abundantVec2;
vector<int> finalAbundantVec;

int abundantArbiter = 0;
for(int i = 1; i <= 28123; i++){
  for(int a = 1; a < i; a++){
    if(i % a == 0){
      abundantArbiter += a;
      }
  }
  ProtoVecVal.push_back(abundantArbiter);
  abundantArbiter -= abundantArbiter;
}

  for(int i = 0; i < ProtoVecVal.size(); i++){
    if(i + 1 < ProtoVecVal[i]){ //tests for non-abundancy
      abundantVec.push_back(i + 1); //Contains all abundant values from 1 to 28123
      abundantVec2.push_back(i + 1);//Contains all abundant values(important for later)
    }
  }


  for(int i = 0; i < abundantVec.size(); i++){
    for(int a = 0; a < abundantVec.size(); a++){
      abundantVec[i] += abundantVec2[a];
      finalAbundantVec.push_back(abundantVec[i]);
      abundantVec[i] -= abundantVec2[a];
    }
  }
  int arbiter = 0;
  int finalSum = 0;
  for(int i = 1; i <= 28123; i++){
    for(int a = 0; a < finalAbundantVec.size(); a++){
      if(i == finalAbundantVec[a]){
        arbiter += i;
      }
    }
    if(arbiter == 0){
      finalSum += i;
      cout << i << endl;
      arbiter -= arbiter;
    }

    arbiter -= arbiter;

  }

  cout << finalSum << endl;
}
