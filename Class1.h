#ifndef CLASS1_H_
#define CLASS1_H_

#include <iostream>
using namespace std;

class Person {
private:
  string name;
  int age;
public:
  string toString();
  Person(); //Constructor
  Person(string name, int age);

};

#endif /* CLASS1_H */
