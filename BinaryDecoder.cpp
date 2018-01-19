#include <iostream>
#include <vector>

//Project Euler Problem 36
using namespace std;

int PalindromicArbiter(int decimalVal);

int main(){
    long long int i = 129;
    PalindromicArbiter(i);
  }

int PalindromicArbiter(int decimalVal){
  vector<int> myvector;
  int totalSum = 0;
  int counter = 1;
  while(decimalVal != 1){
    myvector.push_back(decimalVal % 2);
    decimalVal = decimalVal / 2;
  }

  myvector[0] = decimalVal % 2;

//Usage of vector.insert()
  vector<int>::iterator it;
  it = myvector.end();
  it = myvector.insert(it, 1);

  if(myvector[0] == 0){
    myvector.erase(myvector.begin());
    while(myvector[counter] == 0){
      myvector.erase(myvector.begin() + counter);
      counter += 1;
    }
  }

  for(int i = myvector.size() - 1; i >= 0; i--){
    cout << myvector[i] << endl;
    if(myvector[i] == myvector[(myvector.size() - 1) - i]){
      totalSum += 1;
    }
  }

if(totalSum == myvector.size()){
  cout << "This binary number is palindromic." << endl;
} else {
  cout << "This binary number is not palindromic" << endl;
}





return 0;
}
