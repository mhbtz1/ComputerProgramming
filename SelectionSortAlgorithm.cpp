//SelectionSortAlgorithm
#include <iostream>
#include <algorithm>
using namespace std;

void SelectionSort(int array[], int size);

int main(){
  int ar[] = {87,75,61,50,99,53,64,56,54,37,83,12,72,11,36,55,19,3,59,99,91,38,19,52,43,5,10,82,36,23,92,92,96,79,4,45,94,23,10,63,86,91,57,58,56,91,77};
  SelectionSort(ar, 47);
}

void SelectionSort(int array[], int size){
  int i = 0;
  while(i <= size){
    swap(array[i], *min_element(array + i, array + size));
    i += 1;
  }
  for(int a = 0; a < size; a++){
    cout << array[a] << endl;
  }
}
