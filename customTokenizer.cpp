
#include <iostream>
#include <cmath>
#include <algorithm>
#include <string>
#include <cstring>
#include <utility>
#include <vector>
#include <map>
#include <queue>
using namespace std;

//for Silvia Shuvechccha: thanks for the A2A, also.

bool cmp(pair<int,int> one, pair<int,int> two){
    return one.first < two.first;
}

void customTokenizer(string given, char tokens[], int sizeTokens){
    //uses a two pointers
    int p1 = 0;
    int p2 = 0;


    while(p1 <= given.size() && p2 <= given.size()){
        bool found = false;
        //cout << p1 << " " << p2 << endl;
        for(int i = 0; i < sizeTokens; i++){
            if(tokens[i] == given[p2]){
                found = true;
                break;
            }
        }
        if(found && p1 == p2){
            p2++;
        } else if(found && p1 != p2){
            cout << given.substr(p1 + 1, p2 - p1 - 1) << endl;;
            p1 = p2;
        } else {
            p2++;
        }

    }
    
}


int main(int arga, char** argv){
    //the function takes a parameter of the string, the tokens, and the size of the tokens array
    //I assumed that the tokens could consist of any alphanumeric character, for which case this should work.
    
    string given = "- This, a sample - string.";
    char tokens[] = {',', '.','-'};
    customTokenizer(given, tokens, 3);
    return 0;
}
