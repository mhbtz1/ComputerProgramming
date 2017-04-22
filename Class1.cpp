#include <iostream>
#include "Class1.h"

using namespace std;
Cat::Cat(){
  cout << "Cat object instantiated" << endl;

  happy = true;
}

Cat::~Cat(){
  cout << "Cat object eliminated" << endl;
}
void Cat::speak(){
  if(happy){
    cout << "Meow" << endl;
  } else {
    cout << "Ssss" << endl;
  }
}
