#include <iostream>
#include "Class1.h"

using namespace std;

int main(){

  Person person2("Jeff", 30);
  Person person3("Bob",42);


  cout << person2.toString() << endl;
  cout << person3.toString() << endl;
  return 0;
}
