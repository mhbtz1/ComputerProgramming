#include <iostream>
#include <cmath>
#include <vector>
#include <string>

using namespace std;
//Project Euler: Problem 40



int main(){

int sum = 1;
string str;

int tempSum;
string tempStr;

for(int i = 1; i < 1000000; i++){
  str += to_string(i);
}

for(int i = 0; i <= 6; i++){

  cout << str[pow(10,i) - 1] << endl;

  tempStr += str[pow(10, i) - 1];
  tempSum = atoi(tempStr.c_str());

  sum *= tempSum;

  tempSum = 0;
  tempStr = "";
  
}

cout << sum << endl;



}
