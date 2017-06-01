#include <iostream>
#include <algorithm>
using namespace std;

/*
IN ORDER TO COMPLETE ALGORITHM, RATHER THAN MAKING IT ITERATE
ONLY THROUGH VALUE i, MAKE IT SO i CAN BE SET TO THE STARTING
INDEX OF 2 AND ITERATE TO THE NEXT INDEX AFTER THE CONDITION OF THE
SECOND WHILE LOOP IS MET
*/

void InsertionAlgo(int ar[], int size);
int main(){
  int array1[] = {9,4,1,5,8,3,6,7}; //4,9,1,5,8,3,6,7
  InsertionAlgo(array1, sizeof(array1)/sizeof(array1[0]));
}

void InsertionAlgo(int ar[], int size){
  swap(ar[0], ar[1]);
    int i = 2;
    while(i != size){
      while(ar[i] < ar[i-1]){
          swap(ar[i], ar[i-1]);
          if(ar[i] > ar[i-1] && ar[i] < ar[i+1]){
            i += 1;
          } else {
            i = i - 1;
          }
        }
        i += 1;
      }


  }
