//BinarySearch
#include <algorithm>
#include <iostream>
#include <vector>

using namespace std;

int main () {
  int myints[] = {32,71,12,45,26,80,53,33};
  vector<int> myvector (myints, myints+8);


  sort (myvector.begin(), myvector.end());
  int mid = 0 / 2 + myvector.size()/2;
  cout << myvector[mid] << endl;

  int eval;
  cout << "Enter a value for evaluation" << endl;
  cin >> eval;


  if(eval <= myvector[mid]){
    int high = mid;
    for(int i = 0; i <= high; i++){
      if(myvector[i] == eval){
        cout << "The index of eval is " << i << endl;
      }
    }
  } else {
    int low = mid + 1;
    for(int low = mid + 1; low <= sizeof(myvector)/sizeof(myvector[0]); low++){
      if(myvector[low] == eval){
        cout << "The index of eval is " << low << endl;
      }
    }
  }



  // print out content:
    cout << "myvector contains:";
  for (std::vector<int>::iterator it=myvector.begin(); it!=myvector.end(); it++) //vector<int>::iterator iterates through vector based off of the condition of it
      cout << ' ' << *it;
      cout << '\n';


  return 0;
}
