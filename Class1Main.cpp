#include <iostream>
#include <sstream>
using namespace std;

class Person {
private:
  string name;
  int age;
public:
  string toString();
  Person(): name("unnamed"), age(0) {}; //Constructor
  Person(string name, int age);

};


Person::Person(string name, int age): name(name), age(age){
}

string Person::toString(){
  stringstream ss;
  ss << "Name" << endl;
  ss << name << endl;
  ss << "Age " << endl;
  ss << age << endl;

  return ss.str();

}

int main(){

  Person person2("Jeff", 30);
  Person person3("Bob",42);


  cout << person2.toString() << endl;
  cout << person3.toString() << endl;
  return 0;
}
