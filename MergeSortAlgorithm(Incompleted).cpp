//MergeSortAlgorithm

#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;



int main(){
  int ar[] = {87,75,61,50,99,53,64,56,54,37,83,12,72,11,36,55,19,3,59,99};
  int mid = 0 + sizeof(ar)/sizeof(ar[0]) / 2; //Finds middle of array
  int array1[mid];
  int array2[mid];
  for(int iterator1 = 0; iterator1 < mid; iterator1++){
    ar[iterator1] = array1[iterator1];// Populates array with values from index 0 to index 9
  }
  for(int iterator2 = 0; iterator2 < mid; iterator2++){
    ar[iterator2 + mid] = array2[iterator2];// Populates second array with index 0 to 9 plus mid, because it is after the mid
  }
  int i = 0;
  while(i < sizeof(array1)/sizeof(array1[0])){
    swap(ar[i], *min_element(array1 + i, array1 + sizeof(array1)/sizeof(array1[0])));//Swaps values from the array position i for the minimum element from i to the end of the array
    i += 1;
  }
  for(int a = 0; a < sizeof(array2)/sizeof(array2[0]); a++){
    swap(ar[a + mid], *min_element(array2 + a, array2 + sizeof(array2)/sizeof(array2[0])));//Same thing
  }
  for(int c = 0; c < sizeof(ar)/sizeof(ar[0]); c++){
    cout << array1[c] << endl;
  }


}
