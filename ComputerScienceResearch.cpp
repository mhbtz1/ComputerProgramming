#include <iostream>
#include <cmath>
using namespace std;

//Pennsylvania Junior Academy of Science Research: Computer Science and Robotics

//RESEARCH: On the Algorithmic Investigation of ND-progression Numerical Spirals and the Recurring Patterns Amongst Them
//Done in C++17

//ALGORITHM
int NDProgressionNumericalSpirals(int matrixNum, int matrixWidth);

int main(){


for(int length = 1; length <= 50; length++){
  for(int width = 1; width <= 50; width ++){

  int matrixNum;
  matrixNum = length;


  int matrixWidth;
  matrixWidth = width;


if(matrixNum % 2 == 0){

    long long int returnVal = NDProgressionNumericalSpirals(matrixNum, matrixWidth);


    cout << "----------------------" << endl;
    cout << "Length : "<< matrixNum << endl;
    cout << "Width : " << matrixWidth << endl;
    cout << "Sum : " << returnVal << endl;
    cout << "----------------------" << endl;
    cout << "\n" << endl;

  } else if(matrixNum == 1){

    cout << "----------------------" << endl;
    cout << "Length : "<< matrixNum << endl;
    cout << "Width : " << matrixWidth << endl;
    cout << "Sum : " << (matrixWidth*(matrixWidth + 1))/2 << endl;
    cout << "----------------------" << endl;
    cout << "\n" << endl;

  } else if(matrixNum % 2 != 0){

    long long int returnVal = NDProgressionNumericalSpirals(matrixNum - 1, matrixWidth);

      for(int j = 2; j <= matrixWidth; j++){
        returnVal +=  2 + (4 *( (0.25 * (((j-2) * (j-1))/2))  +  (j * (j - 1))/2 )) + ((matrixNum - 5)/2 * ( (j * (j-1)) ));
      }


      for(int i = 2; i <= matrixWidth; i++){
        returnVal += (matrixNum - 1) * ( ((i - 1) * (i - 2))/2 );
    }

    cout << "----------------------" << endl;
    cout << "Length : "<< matrixNum << endl;
    cout << "Width : " << matrixWidth << endl;
    cout << "Sum : " << returnVal << endl;
    cout << "----------------------" << endl;
    cout << "\n" << endl;

  }


    }
  }
}






int NDProgressionNumericalSpirals(int matrixNum, int matrixWidth){
  int returnNum;

  if(matrixWidth == 1){
    returnNum = 1;
    return returnNum;

  } else {

    returnNum = (matrixNum + 3) * (matrixNum / 2);

    int recursiveVal = matrixNum + 3;
    int addVal = recursiveVal + 2*(matrixNum - 2);



    for(int i = 3; i <= matrixWidth; i++){

      recursiveVal += addVal;
      returnNum += (recursiveVal) * (matrixNum/2);
      addVal += 2*matrixNum;


      }

      returnNum += 1;

      return returnNum;
    }

  }
