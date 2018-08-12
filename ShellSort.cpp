#include <iostream>
#include <algorithm>
using namespace std;

//SHELL SORT ALGORITHM

int main(){
  int ar[] = {35, 33, 42, 10, 14, 19, 27, 44, 62, 36, 9, 99, 86, 12, 82, 25, 62, 120, 52, 78, 22, 48, 92, 86, 22, 38, 54, 8, 10};
  int temp = (sizeof(ar)/sizeof(ar[0]))/2;
  int counter = 0;
  while(counter != temp){
    if(ar[counter] > ar[counter + temp]){
      swap(ar[counter], ar[counter + temp]);
    }
    counter += 1;
  }
  int i = 1;
  while(i < 2 * temp){
    while((ar[i] > ar[i+1]) && i >= 0){
      swap(ar[i], ar[i+1]);
      i -= 1;
    }
  i += 1;
  }
  for(int i = 0; i < 2 * temp; i++){
    cout << ar[i] << endl;
  }
}
