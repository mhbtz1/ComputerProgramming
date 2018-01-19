#include <iostream>
#include <cmath>
#include <set>
#include <string>
using namespace std;




int main(){
  set<int> mySet;
  long long int counter = 0;

  for(int a = 0; a <= 9; a++){
    for(int b = 0; b <= 9; b++){
      for(int c = 0; c <= 9; c++){
        for(int d = 0; d <= 9; d++){
          for(int e = 0; e <= 9; e++){
          if(pow(a,4)+pow(b,4)+pow(c,4)+pow(d,4) == val && to_string(val).length() > 1){
            mySet.insert(pow(a,4) + pow(b,4) + pow(c,4) + pow(d,4));
              }
            }
          }
        }
      }
    }

      for(set<int>::iterator it = mySet.begin(); it != mySet.end(); it++){
        cout << *it << endl;;
        counter += *it;
      }

      cout << counter << endl; //the result
  }
