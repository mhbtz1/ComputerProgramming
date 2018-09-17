
/**
 * Write a description of class MakeChange here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */

import java.util.*;
public class MakeChange
{
  static int loopingCoinage(int coinNum, double moneyNum){
      
      int countNum = 0;
      while( (100 * moneyNum) % (countNum * coinNum) != moneyNum ) {
        countNum += 1;
      }
       
      int returnNum = countNum - 1;
      return (returnNum);
       
  }

    
   public static void main(String[] args){
       

       
       double randomNum = 13.27;
       double moneyNum = ((int)(100 *(randomNum + 0.5) ))/100.0;
    
    
       int quarterVal = loopingCoinage(25, moneyNum);
       
       int dimeVal = loopingCoinage(10, (moneyNum - (25 * quarterVal)) );
       
       int nickelVal = loopingCoinage(5, (moneyNum - (25 * quarterVal) - (10 * dimeVal) ) );
       
       int pennyVal = loopingCoinage(1, (moneyNum - (25 * quarterVal) - (10 * dimeVal) - (5 * nickelVal)) );
    
       System.out.println("Number of quarters : " + quarterVal);
       System.out.println("Number of dimes : " + dimeVal);
       System.out.println("Number of nickels "  + nickelVal);
        System.out.println("Number of pennies " + pennyVal);

   
    
   } 
   
    
  }        

