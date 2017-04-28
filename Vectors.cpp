#include <iostream>
using namespace std;

//HammingDistance
int main() {
  string arr[] = {"G","A","G","C","C","T","A","C","T","A","A","C","G","G","G","A","T"};
  string arr2[] = {"C","A","T","C","G","T","A","A","T","G","A","C","G","G","C","C","T"};

  int a = 0;
  int i = 0;
  while(i < sizeof(arr)/sizeof(arr[0])){
    if(arr[i] == arr2[i]){
      a += 1;
      i += 1;
    } else {
      i += 1;
    }
  }
  cout << sizeof(arr)/sizeof(arr[0]) - a << endl;
  return 0;
}
