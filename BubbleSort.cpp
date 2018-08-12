//Optimize Memory Management

#include <iostream>
#include <iostream>
using namespace std;

int BubbleSortAlgo(int ar[], int size);
int main(){
  int arraySort[] = {1,4,9,2,8,0,10,3,6};
  BubbleSortAlgo(arraySort, sizeof(arraySort)/sizeof(arraySort[0]));
  return 0;
}

int BubbleSortAlgo(int ar[], int size){
  int i, a = 0;
  while(i != size){
    while(a <= size - 2){
      if(ar[a] > ar[a+1]){
        swap(ar[a], ar[a+1]);
        a += 1;
      }
      a += 1;
    }
    i += 1;
  }
  return 0;
}
