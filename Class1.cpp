#include <sstream>
#include "Class1.h"

using namespace std;
Person::Person(): name(" "), age(0){

}

Person::Person(string name, int age): name(name), age(age){
}

string Person::toString(){
  stringstream ss;
  ss << "Name";
  ss << name;
  ss << "Age";
  ss < age;

  return ss.str();

}
