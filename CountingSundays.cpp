#include <iostream>
using namespace std;

//Problem 19 : Counting Sundays

int main(){
  int counterOfSundays = 0;
  int weekdayAmt = 2;

int dayOfMonthArray[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

for(int yearAmt = 1900; yearAmt <= 2000; yearAmt++){
  for(int monthAmt = 0; monthAmt <= 11; monthAmt++){
    if(yearAmt % 400 == 0 && yearAmt % 100 == 0){
      dayOfMonthArray[1] += 1;
    } else if(yearAmt % 4 == 0 && yearAmt % 100 != 0){
      dayOfMonthArray[1] += 1;
    }

    if(((dayOfMonthArray[monthAmt] % 7) + weekdayAmt) % 7 == 0){
      counterOfSundays += 1;
      weekdayAmt = 7;
    } else {
      weekdayAmt =  (weekdayAmt % 7) + dayOfMonthArray[monthAmt] % 7;
    }


    dayOfMonthArray[1] = 28;
    }
  }

cout << counterOfSundays - 2 << endl;






}
