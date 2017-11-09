#include <iostream>
#include <string>
using namespace std;

//Analysis of Non-complementary DNA Base Pairings for Honors Biology

void DNAMutations(string a, string b);

int main(){
  string DNA_1 = "CAGTTTGGACCTAACAGCTTC";//5
  string Model_DNA = "GTGAAACCTTCATCGTCCAAG";
  string DNA_2 = "GTTTCAGAACTTGGTGCTATC";//14
  string DNA_3 = "GATTCGGAACTTCGTGGTTAC";//12


  DNAMutations(DNA_1 , Model_DNA);
  DNAMutations(DNA_3 , Model_DNA);

}

void DNAMutations(string a, string b){
  int counterofMutations;
  for(int i = 0; i < sizeof(a)/sizeof(a[0]); i++){
    if(abs(char(a[i]) - char(b[i])) == 19 || abs(char(a[i]) - char(b[i])) == 4){
        counterofMutations += 1;
      }
    }
    cout << "The number of noncomplementary pairs are: " << a.length() - counterofMutations << endl;//noncomplementary pairs
    cout << "The sequence divergence of the given DNA is " << a.length()- counterofMutations << "/" << a.length()<< endl;

}
