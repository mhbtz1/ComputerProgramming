//TernarySearch(COMPLETED)
#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;


int main(){
  cout << "Enter in an integer for evaluation" << endl;

  int integer;
  cin >> integer;//Receives input from a.out

  int ar[] = {2,4,9,5,7,1,13,22,6,10,12,15,27,30,20,52,34,8,16,23,99,123,67,75,96};
  vector<int> vectorVal (ar, ar + sizeof(ar)/sizeof(ar[0]));
  sort(vectorVal.begin(),vectorVal.end()); //1,2,4,5,6,7,8,9//,10,12,13,15,16,20,22,23//,27,30,34,52,67,75,99,123

  int eval = vectorVal.size() / 3;
  vector<int> finalVector;
  while( eval <= vectorVal.size()){ //Runs every value of eval from the number of elements in list divided by 3, making 3 equal parts
      cout << vectorVal[eval - 1] << endl;
      finalVector.push_back(vectorVal[eval-1]);
      eval += eval; //Increments eval until while condition is met
    }
    cout << vectorVal[vectorVal.size() - 1] << endl;
    finalVector.push_back(vectorVal[vectorVal.size() - 1]); //Appends final element in vector to finalVector

  // Checks input if it is equal to first given medians, which just prints out medians if so
  if(integer == finalVector[0]){
    cout << "The index by method of ternary search is "  << vectorVal.size() / 3 - 1 << endl;
    return 0;
  } else if(integer == finalVector[1]){
    cout << "The index by method of ternary search is " << 2 * vectorVal.size() / 3 - 1 <<  endl;
    return 0;
  } else if(integer == finalVector[2]){
    cout << "The index by method of ternary search is  " << vectorVal.size() - 1 << endl;
    return 0;
  }
    //MAIN ITERATOR: iterates through equal sections finding medians until a median is equal to the inputted integer
      if(integer <= finalVector[0]){
        vectorVal.erase(vectorVal.begin() + vectorVal.size() / 3 - 1, vectorVal.end());
        int eval = vectorVal.size() / 3;
        while(eval <= vectorVal.size()){
          cout << vectorVal[eval - 1] << endl;
          eval += eval;
        }
          cout << vectorVal[vectorVal.size() - 1] << endl;
        for(int i = 0; i <= sizeof(vectorVal)/sizeof(vectorVal[0]); i++){
          if(vectorVal[i] == integer){
            cout << "The index by method of ternary search is " << i << endl;
          }
        }
      } else if(integer >= finalVector[1]){
        vectorVal.erase(vectorVal.begin(), vectorVal.begin() + 2 * vectorVal.size() / 3 );

        int eval = vectorVal.size() / 3;
        while( eval <= vectorVal.size()){ //Runs every value of eval from the number of elements in list divided by 3, making 3 equal parts
            cout << vectorVal[eval - 1] << endl;
            eval += eval;
        }

        for(int i = 0; i <= sizeof(vectorVal)/sizeof(vectorVal[0]); i++){
            if(vectorVal[i] == integer){
              cout << "The index by method of ternary search is " << i + 2 * vectorVal.size() << endl;
            }
          }

      } else if(integer >= finalVector[0] && integer < finalVector[1]){
          vectorVal.erase(vectorVal.begin(),vectorVal.begin() + vectorVal.size()/3 );
          vectorVal.erase(vectorVal.begin() + 2 * vectorVal.size() / 3 - 2, vectorVal.end());
          int eval = vectorVal.size() / 3;
          while( eval <= vectorVal.size()){ //Runs every value of eval from the number of elements in list divided by 3, making 3 equal parts
              cout << vectorVal[eval - 1] << endl;
              eval += eval;
          }
          for(int i = 0; i <= sizeof(vectorVal)/sizeof(vectorVal[0]); i++){
              if(vectorVal[i] == integer){
                cout << "The index by method of ternary search is " << i + vectorVal.size() << endl;
      }
    }
  }
  return 0;
}
