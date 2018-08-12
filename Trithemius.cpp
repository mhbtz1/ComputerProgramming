#include <iostream>
#include <cmath>
using namespace std;

//Vigenere Decryptor:
//This is an optimized version of the version you had prior, except it utilizes the modulus operator so that you do not have to
//type in the keyword multiple times, rather only once.

string VigenereCipher(string cipherText, string decipherText);

int main(){

  string decipherText = "DAB";  //Key is equal to the amount of distinct letters in the decrypted text
  //DABDABDABDABDABDABDABDABD
  string cipherText = "FHFFKV542IOSZHBWYPXDFVISH";
  cout << cipherText.size() << endl;
  VigenereCipher(cipherText, decipherText);
  return 0;
}


string VigenereCipher(string cipherText, string decipherText){

  //Uses ASCII inputs in the language of C++ and the cases based upon the ASCII values of certain alphanumeric characters
  for(int i = 0; i < cipherText.size(); i++){
    if((char(decipherText[i]) - 64) < (char(cipherText[i]) - 64)){
      cout << char(abs(char(cipherText[i]) - char(decipherText[i % decipherText.size()]) + 65)) << endl;
    } else if((char(decipherText[i % decipherText.size()]) - 64) > (char(cipherText[i]) - 64)){
      cout << char((91 - char(decipherText[i % decipherText.size()]) + char(cipherText[i]))) << endl;
    } else if((char(decipherText[i]) - 64) == (char(cipherText[i]) - 64)){
      cout << char(65) << endl;
    }
  }

  //Outputs decrypted text

  return 0;
}
