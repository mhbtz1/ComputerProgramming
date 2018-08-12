

#include <iostream>
#include <vector>
using namespace std;

//Vigenere Encryptor
//Use this to communicate with me by using this file to encrypt a message and I'll use the other file to decrypt it

//This will be the main cipher I will be using to communicate with you, as the Caesarean cipher is less reliable.

string VigenereCipherEncryptor(string decryptedCipher, string repeatedKey, int size);


int main(){
  string decryptedCipher = "CHECKU241FORWHATYOUDESIRE";
  string repeatedKey = "DAB";

  int size = decryptedCipher.size();

  VigenereCipherEncryptor(decryptedCipher, repeatedKey, size);
}


string VigenereCipherEncryptor(string decryptedCipher, string repeatedKey, int size){
  //creates key with repeated words relative to the modulus of the number of letters in the words

  for(int i = 0; i < size; i++) {
      cout << char(char(decryptedCipher[i]) + char(repeatedKey[i % repeatedKey.size()]) - 65) << flush;
  }



  return 0;
}
