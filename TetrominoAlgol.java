
//imported Java libraries
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.WindowConstants;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Point;
import java.awt.Color;
import java.util.Scanner;
import javafx.scene.shape.Shape;
import java.awt.event.ActionListener;
import javax.swing.Timer;
import java.util.concurrent.TimeUnit;
import java.util.ArrayList;
import java.awt.event.MouseListener;
import java.awt.event.MouseEvent;
import java.awt.Font;
import java.awt.FontMetrics;

/**
* Determines the enumeration of tilings of tetrominoes on a (n,a)-hollow square laminae for application to polypeptides and laminopathies in nuclear laminae
* PJAS CompSci/Engineering
* @Matthew Habtezgi
*
* The program will select a number of pieces to use for tiling and will tile based on the tiles chosen
* (i.e. a slight variation on the backtracking/constraint satisfaction problem algorithm paradigm with recursion)
* Since ther are different states for the pieces, there will be varying positions of the pieces dependent on the program's state in the recursive call

//
*/



public class TetrominoAlgol
{

  static int startX = 500;
  static int startY = 500;
  static int startSide = 400;

  //Contains configurations for each piece in the lamina
  static ArrayList<Integer> lTetrConfigurations = new ArrayList<Integer>();
  static ArrayList<Integer> tTetrConfigurations = new ArrayList<Integer>();
  static ArrayList<Integer> lineTetrConfigurations = new ArrayList<Integer>();
  static ArrayList<Integer> squareTetrConfigurations = new ArrayList<Integer>();
  static ArrayList<Integer> sTetrConfigurations = new ArrayList<Integer>();







  private JFrame frame;

  public static int[] squareTetr(Graphics g2, int x, int y, int startSide, int sideLength){
           //is perfectly symmetrical so no different amount of states
           int[] returnArr = new int[8] ;
           //g2.fillRect(x, y, startSide/sideLength, startSide/sideLength);
           returnArr[0] = x;
           squareTetrConfigurations.add(returnArr[0]);
           returnArr[1] = y;
           squareTetrConfigurations.add(returnArr[1]);
           //g2.fillRect(x + (startSide/sideLength), y, startSide/sideLength, startSide/sideLength);
           returnArr[2] = x + startSide/sideLength;
           squareTetrConfigurations.add(returnArr[2]);
           returnArr[3] = y;
           squareTetrConfigurations.add(returnArr[3]);
           //g2.fillRect(x + (startSide/sideLength), y- startSide/sideLength, startSide/sideLength, startSide/sideLength);
           returnArr[4] = x + startSide/sideLength;
           squareTetrConfigurations.add(returnArr[4]);
           returnArr[5] = y - startSide/sideLength;
           squareTetrConfigurations.add(returnArr[5]);
           //g2.fillRect(x, y - ((startSide/sideLength) ), startSide/sideLength, startSide/sideLength);
           returnArr[6] = x;
           squareTetrConfigurations.add(returnArr[6]);
           returnArr[7] = y - startSide/sideLength;
           squareTetrConfigurations.add(returnArr[7]);


           return returnArr;

   }

   public static int[] tTetr(Graphics g2, int x, int y, int startSide, int sideLength, int turningFactor){
           //needs more cases
           int[] returnArr = new int[8];
           int[] emptyArr = new int[0];

           if(turningFactor == 0){
               //g2.fillRect(x , y, startSide/sideLength, startSide/sideLength );
               returnArr[0] = x;
               tTetrConfigurations.add(returnArr[0]);
               returnArr[1] = y;
               tTetrConfigurations.add(returnArr[1]);
               //g2.fillRect( x + ((startSide/sideLength)), y - ((startSide/sideLength)), startSide/sideLength, startSide/sideLength );
               returnArr[2] = x + startSide/sideLength;
               tTetrConfigurations.add(returnArr[2]);
               returnArr[3] = y - startSide/sideLength;
               tTetrConfigurations.add(returnArr[3]);
               //g2.fillRect(x , y - ((startSide/sideLength)), startSide/sideLength, startSide/sideLength);
               returnArr[4] = x;
               tTetrConfigurations.add(returnArr[4]);
               returnArr[5] = y - startSide/sideLength;
               tTetrConfigurations.add(returnArr[5]);
               //g2.fillRect( x, y -(2 * (startSide/sideLength)), startSide/sideLength, startSide/sideLength);
               returnArr[6] = x;
               tTetrConfigurations.add(returnArr[6]);
               returnArr[7] = y - (2 * startSide/sideLength);
               tTetrConfigurations.add(returnArr[7]);

               return returnArr;
           }
           if(turningFactor == 1){
               //g2.fillRect(x , y, startSide/sideLength, startSide/sideLength );
               returnArr[0] = x;
               tTetrConfigurations.add(returnArr[0]);
               returnArr[1] = y;
               tTetrConfigurations.add(returnArr[1]);
               //g2.fillRect( x + ((startSide/sideLength)), y, startSide/sideLength, startSide/sideLength );
               returnArr[2] = x + startSide/sideLength;
               tTetrConfigurations.add(returnArr[2]);
               returnArr[3] = y;
               tTetrConfigurations.add(returnArr[3]);
               //g2.fillRect(x + startSide/sideLength , y - startSide/sideLength, startSide/sideLength, startSide/sideLength);
               returnArr[4] = x + startSide/sideLength;
               tTetrConfigurations.add(returnArr[4]);
               returnArr[5] = y - startSide/sideLength;
               tTetrConfigurations.add(returnArr[5]);
               //g2.fillRect( x + 2*(startSide/sideLength), y, startSide/sideLength, startSide/sideLength);
               returnArr[6] = x + (2 * startSide/sideLength);
               tTetrConfigurations.add(returnArr[6]);
               returnArr[7] = y;
               tTetrConfigurations.add(returnArr[7]);

               return returnArr;
           }

           if(turningFactor == 2){
              // g2.fillRect(x , y, startSide/sideLength, startSide/sideLength );
               returnArr[0] = x;
               tTetrConfigurations.add(returnArr[0]);
               returnArr[1] = y;
               tTetrConfigurations.add(returnArr[1]);
              // g2.fillRect( x - ((startSide/sideLength)), y - ((startSide/sideLength)), startSide/sideLength, startSide/sideLength );
               returnArr[2] = x - startSide/sideLength;
               tTetrConfigurations.add(returnArr[2]);
               returnArr[3] = y - startSide/sideLength;
               tTetrConfigurations.add(returnArr[3]);
               //g2.fillRect(x , y - ((startSide/sideLength)), startSide/sideLength, startSide/sideLength);
               returnArr[4] = x;
               tTetrConfigurations.add(returnArr[4]);
               returnArr[5] = y - startSide/sideLength;
               tTetrConfigurations.add(returnArr[5]);
               //g2.fillRect( x, y -(2 * (startSide/sideLength)), startSide/sideLength, startSide/sideLength);
               returnArr[6] = x;
               tTetrConfigurations.add(returnArr[6]);
               returnArr[7] = y - (2 * startSide/sideLength);
               tTetrConfigurations.add(returnArr[7]);


               return returnArr;
           }

           if(turningFactor == 3){
              //g2.fillRect(x , y - startSide/sideLength, startSide/sideLength, startSide/sideLength );
               returnArr[0] = x;
               tTetrConfigurations.add(returnArr[0]);
               returnArr[1] = y - startSide/sideLength;
               tTetrConfigurations.add(returnArr[1]);
               //g2.fillRect( x + ((startSide/sideLength)), y - ((startSide/sideLength)), startSide/sideLength, startSide/sideLength );
               returnArr[2] = x + startSide/sideLength;
               tTetrConfigurations.add(returnArr[2]);
               returnArr[3] = y - startSide/sideLength;
               tTetrConfigurations.add(returnArr[3]);
              //g2.fillRect(x + 2*(startSide/sideLength), y - startSide/sideLength, startSide/sideLength, startSide/sideLength);
               returnArr[4] = x + (2 * startSide/sideLength);
               tTetrConfigurations.add(returnArr[4]);
               returnArr[5] = y - startSide/sideLength;
               tTetrConfigurations.add(returnArr[5]);
               //g2.fillRect( x + (startSide/sideLength) , y, startSide/sideLength, startSide/sideLength);
               returnArr[6] = x + startSide/sideLength;
               tTetrConfigurations.add(returnArr[6]);
               returnArr[7] = y;
               tTetrConfigurations.add(returnArr[7]);

               System.out.println("Tetromino run.");

               return returnArr;
           }

           return emptyArr;


   }

   public static int[] lineTetr(Graphics g2, int x, int y, int startSide, int sideLength, int turningFactor){
       //needs more cases
       int[] returnArr = new int[8];
       int[] emptyArr = new int[0];

       if(turningFactor == 0){
            //g2.fillRect(x, y, startSide/sideLength, startSide/sideLength );
            returnArr[0] = x;
            lineTetrConfigurations.add(returnArr[0]);
            returnArr[1] = y;
            lineTetrConfigurations.add(returnArr[1]);
            //g2.fillRect( x + startSide/sideLength, y, startSide/sideLength, startSide/sideLength);
            returnArr[2] = x + startSide/sideLength;
            lineTetrConfigurations.add(returnArr[2]);
            returnArr[3] = y;
            lineTetrConfigurations.add(returnArr[3]);
            //g2.fillRect( (x + (2 * startSide/sideLength)), y, startSide/sideLength, startSide/sideLength );
            returnArr[4] = x + (2 * startSide/sideLength);
            lineTetrConfigurations.add(returnArr[4]);
            returnArr[5] = y;
            lineTetrConfigurations.add(returnArr[5]);
            //g2.fillRect( (x + (3 * startSide/sideLength)), y, startSide/sideLength, startSide/sideLength );
            returnArr[6] = x + (3 * startSide/sideLength);
            lineTetrConfigurations.add(returnArr[6]);
            returnArr[7] = y;
            lineTetrConfigurations.add(returnArr[7]);

            return returnArr;
       }
       if(turningFactor == 1){
            //g2.fillRect(x, y, startSide/sideLength, startSide/sideLength );
            returnArr[0] = x;
            lineTetrConfigurations.add(returnArr[0]);
            returnArr[1] = y;
            lineTetrConfigurations.add(returnArr[1]);
            //g2.fillRect( x, y - startSide/sideLength, startSide/sideLength, startSide/sideLength);
            returnArr[2] = x;
            lineTetrConfigurations.add(returnArr[2]);
            returnArr[3] = y - startSide/sideLength;
            lineTetrConfigurations.add(returnArr[3]);
            //g2.fillRect( (x), y - (2 * startSide/sideLength), startSide/sideLength, startSide/sideLength );
            returnArr[4] = x;
            lineTetrConfigurations.add(returnArr[4]);
            returnArr[5] = y - (2 * startSide/sideLength);
            lineTetrConfigurations.add(returnArr[5]);
            //g2.fillRect( (x), y - (3 * startSide/sideLength), startSide/sideLength, startSide/sideLength );
            returnArr[6] = x;
            lineTetrConfigurations.add(returnArr[6]);
            returnArr[7] = y - (3 * startSide/sideLength);
            lineTetrConfigurations.add(returnArr[7]);

            return returnArr;
       }
       return emptyArr;

   }

   public static int[] LTetr(Graphics g2, int x, int y, int startSide, int sideLength, int turningFactor){
         //needs more cases
         int[] returnArr = new int[8];
         int[] emptyArr = new int[0];
         if(turningFactor == 0){
           //g2.fillRect(x, y, startSide/sideLength, startSide/sideLength);
           returnArr[0] = x;
           lTetrConfigurations.add(returnArr[0]);
           returnArr[1] = y;
           lTetrConfigurations.add(returnArr[1]);
           //g2.fillRect(x, y - startSide/sideLength, startSide/sideLength, startSide/sideLength);
           returnArr[2] = x;
           lTetrConfigurations.add(returnArr[2]);
           returnArr[3] = y - startSide/sideLength;
           lTetrConfigurations.add(returnArr[3]);
           //g2.fillRect(x, y - (2 * (startSide/sideLength) ), startSide/sideLength, startSide/sideLength );
           returnArr[4] = x;
           lTetrConfigurations.add(returnArr[4]);
           returnArr[5] = y - (2 * startSide/sideLength);
           lTetrConfigurations.add(returnArr[5]);
           //g2.fillRect(x + startSide/sideLength, y - (2 * (startSide/sideLength)), startSide/sideLength, startSide/sideLength);
           returnArr[6] = x + startSide/sideLength;
           lTetrConfigurations.add(returnArr[6]);
           returnArr[7] = y - (2 * startSide/sideLength);
           lTetrConfigurations.add(returnArr[7]);

          return returnArr;

         }
         if(turningFactor == 1){
           //g2.fillRect(x, y, startSide/sideLength, startSide/sideLength);
           returnArr[0] = x;
           lTetrConfigurations.add(returnArr[0]);
           returnArr[1] = y;
           lTetrConfigurations.add(returnArr[1]);
           //g2.fillRect(x, y - startSide/sideLength, startSide/sideLength, startSide/sideLength);
           returnArr[2] = x;
           lTetrConfigurations.add(returnArr[2]);
           returnArr[3] = y - startSide/sideLength;
           lTetrConfigurations.add(returnArr[3]);
           //g2.fillRect(x, y - (2 * (startSide/sideLength) ), startSide/sideLength, startSide/sideLength );
           returnArr[4] = x;
           lTetrConfigurations.add(returnArr[4]);
           returnArr[5] = y - (2 * startSide/sideLength);
           lTetrConfigurations.add(returnArr[5]);
           //g2.fillRect(x - startSide/sideLength, y - (2 * (startSide/sideLength)), startSide/sideLength, startSide/sideLength);
           returnArr[6] = x - startSide/sideLength;
           lTetrConfigurations.add(returnArr[6]);
           returnArr[7] = y - (2 * startSide/sideLength);
           lTetrConfigurations.add(returnArr[7]);

           return returnArr;

         }
         if(turningFactor == 2){
           //g2.fillRect(x, y, startSide/sideLength, startSide/sideLength);
           returnArr[0] = x;
           lTetrConfigurations.add(returnArr[0]);
           returnArr[1] = y;
           lTetrConfigurations.add(returnArr[1]);
           //g2.fillRect(x, y - startSide/sideLength, startSide/sideLength, startSide/sideLength);
           returnArr[2] = x;
           lTetrConfigurations.add(returnArr[2]);
           returnArr[3] = y - startSide/sideLength;
           lTetrConfigurations.add(returnArr[3]);
           //g2.fillRect(x, y - (2 * (startSide/sideLength) ), startSide/sideLength, startSide/sideLength );
           returnArr[4] = x;
           lTetrConfigurations.add(returnArr[4]);
           returnArr[5] = y - (2 * startSide/sideLength);
           lTetrConfigurations.add(returnArr[5]);
           //g2.fillRect(x + startSide/sideLength, y, startSide/sideLength, startSide/sideLength);
           returnArr[6] = x + startSide/sideLength;
           lTetrConfigurations.add(returnArr[6]);
           returnArr[7] = y;
           lTetrConfigurations.add(returnArr[7]);

           return returnArr;
         }
         if(turningFactor == 3){
           //g2.fillRect(x, y, startSide/sideLength, startSide/sideLength);
           returnArr[0] = x;
           lTetrConfigurations.add(returnArr[0]);
           returnArr[1] = y;
           lTetrConfigurations.add(returnArr[1]);
           //g2.fillRect(x, y - startSide/sideLength, startSide/sideLength, startSide/sideLength);
           returnArr[2] = x;
           lTetrConfigurations.add(returnArr[2]);
           returnArr[3] = y - startSide/sideLength;
           lTetrConfigurations.add(returnArr[3]);
           //g2.fillRect(x, y - (2 * (startSide/sideLength) ), startSide/sideLength, startSide/sideLength );
           returnArr[4] = x;
           lTetrConfigurations.add(returnArr[4]);
           returnArr[5] = y - (2 * startSide/sideLength);
           lTetrConfigurations.add(returnArr[5]);
           //g2.fillRect(x - startSide/sideLength, y, startSide/sideLength, startSide/sideLength);
           returnArr[6] = x - startSide/sideLength;
           lTetrConfigurations.add(returnArr[6]);
           returnArr[7] = y;
           lTetrConfigurations.add(returnArr[7]);

           return returnArr;
         }
         if(turningFactor == 4){
             //g2.fillRect(x, y, startSide/sideLength, startSide/sideLength);
             returnArr[0] = x;
             lTetrConfigurations.add(returnArr[0]);
             returnArr[1] = y;
             lTetrConfigurations.add(returnArr[1]);
             //g2.fillRect( x, y - startSide/sideLength, startSide/sideLength, startSide/sideLength);
             returnArr[2] = x;
             lTetrConfigurations.add(returnArr[2]);
             returnArr[3] = y - startSide/sideLength;
             lTetrConfigurations.add(returnArr[3]);
             //g2.fillRect(x + startSide/sideLength, y - startSide/sideLength, startSide/sideLength, startSide/sideLength);
             returnArr[4] = x + startSide/sideLength;
             lTetrConfigurations.add(returnArr[4]);
             returnArr[5] = y - startSide/sideLength;
             lTetrConfigurations.add(returnArr[5]);
             //g2.fillRect(x + (2 * (startSide/sideLength) ), y - startSide/sideLength, startSide/sideLength, startSide/sideLength);
             returnArr[6] = x + (2 * startSide/sideLength);
             lTetrConfigurations.add(returnArr[6]);
             returnArr[7] = y - startSide/sideLength;
             lTetrConfigurations.add(returnArr[7]);

             return returnArr;
         }
         if(turningFactor == 5){
             //g2.fillRect(x, y, startSide/sideLength, startSide/sideLength);
             returnArr[0] = x;
             lTetrConfigurations.add(returnArr[0]);
             returnArr[1] = y;
             lTetrConfigurations.add(returnArr[1]);
             //g2.fillRect(x, y - startSide/sideLength, startSide/sideLength, startSide/sideLength);
             returnArr[2] = x;
             lTetrConfigurations.add(returnArr[2]);
             returnArr[3] = y - startSide/sideLength;
             lTetrConfigurations.add(returnArr[3]);
             //g2.fillRect(x - startSide/sideLength, y - startSide/sideLength, startSide/sideLength, startSide/sideLength);
             returnArr[4] = x - startSide/sideLength;
             lTetrConfigurations.add(returnArr[4]);
             returnArr[5] = y - startSide/sideLength;
             lTetrConfigurations.add(returnArr[5]);
            // g2.fillRect(x  - (2 * startSide/sideLength), y - startSide/sideLength, startSide/sideLength, startSide/sideLength);
             returnArr[6] = x - (2 * startSide/sideLength);
             lTetrConfigurations.add(returnArr[6]);
             returnArr[7] = y - startSide/sideLength;
             lTetrConfigurations.add(returnArr[7]);

             return returnArr;

         }
         if(turningFactor == 6){
           //g2.fillRect(x, y - startSide/sideLength, startSide/sideLength, startSide/sideLength);
           returnArr[0] = x;
           lTetrConfigurations.add(returnArr[0]);
           returnArr[1] = y - startSide/sideLength;
           lTetrConfigurations.add(returnArr[1]);
           //g2.fillRect(x, y, startSide/sideLength, startSide/sideLength);
           returnArr[2] = x;
           lTetrConfigurations.add(returnArr[2]);
           returnArr[3] = y;
           lTetrConfigurations.add(returnArr[3]);
           //g2.fillRect(x + startSide/sideLength, y, startSide/sideLength, startSide/sideLength);
           returnArr[4] = x + startSide/sideLength;
           lTetrConfigurations.add(returnArr[4]);
           returnArr[5] = y;
           lTetrConfigurations.add(returnArr[5]);
           //g2.fillRect(x + (2 * startSide/sideLength), y, startSide/sideLength, startSide/sideLength);
           returnArr[6] = x + (2 * startSide/sideLength);
           lTetrConfigurations.add(returnArr[6]);
           returnArr[7] = y;
           lTetrConfigurations.add(returnArr[7]);

           return returnArr;
         }
         if(turningFactor == 7){
           //g2.fillRect(x, y, startSide/sideLength, startSide/sideLength);
           returnArr[0] = x;
           lTetrConfigurations.add(returnArr[0]);
           returnArr[1] = y;
           lTetrConfigurations.add(returnArr[1]);
           //g2.fillRect(x, y - startSide/sideLength, startSide/sideLength, startSide/sideLength);
           returnArr[2] = x;
           lTetrConfigurations.add(returnArr[2]);
           returnArr[3] = y - startSide/sideLength;
           lTetrConfigurations.add(returnArr[3]);
           //g2.fillRect(x - startSide/sideLength, y, startSide/sideLength, startSide/sideLength);
           returnArr[4] = x - startSide/sideLength;
           lTetrConfigurations.add(returnArr[4]);
           returnArr[5] = y;
           lTetrConfigurations.add(returnArr[5]);
           //g2.fillRect(x - (2 * (startSide/sideLength) ), y, startSide/sideLength, startSide/sideLength);
           returnArr[6] = x - (2 * startSide/sideLength);
           lTetrConfigurations.add(returnArr[6]);
           returnArr[7] = y;
           lTetrConfigurations.add(returnArr[7]);

           return returnArr;
         }
         return emptyArr;
   }

   public static int[] sTetr(Graphics g2, int x, int y, int startSide, int sideLength, int turningFactor){
     //needs more cases
     int[] returnArr = new int[8];
     int[] emptyArr = new int[0];
     if(turningFactor == 0){
       //g2.fillRect(x, y, startSide/sideLength, startSide/sideLength);
       returnArr[0] = x;
       sTetrConfigurations.add(returnArr[0]);
       returnArr[1] = y;
       sTetrConfigurations.add(returnArr[1]);
       //g2.fillRect(x, y - startSide/sideLength, startSide/sideLength, startSide/sideLength);
       returnArr[2] = x;
       sTetrConfigurations.add(returnArr[2]);
       returnArr[3] = y - startSide/sideLength;
       sTetrConfigurations.add(returnArr[3]);
       //g2.fillRect(x + startSide/sideLength, y - startSide/sideLength, startSide/sideLength, startSide/sideLength);
       returnArr[4] = x + startSide/sideLength;
       sTetrConfigurations.add(returnArr[4]);
       returnArr[5] = y - startSide/sideLength;
       sTetrConfigurations.add(returnArr[5]);
       //g2.fillRect(x + startSide/sideLength, y - (2 * startSide/sideLength), startSide/sideLength, startSide/sideLength );
       returnArr[6] = x + startSide/sideLength;
       sTetrConfigurations.add(returnArr[6]);
       returnArr[7] = y - (2 * startSide/sideLength );
       sTetrConfigurations.add(returnArr[7]);

       return returnArr;

     }

     if(turningFactor == 1){
       //g2.fillRect(x, y, startSide/sideLength, startSide/sideLength);
       returnArr[0] = x;
       sTetrConfigurations.add(returnArr[0]);
       returnArr[1] = y;
       sTetrConfigurations.add(returnArr[1]);
       //g2.fillRect(x, y - startSide/sideLength, startSide/sideLength, startSide/sideLength);
       returnArr[2] = x;
       sTetrConfigurations.add(returnArr[2]);
       returnArr[3] = y - startSide/sideLength;
       sTetrConfigurations.add(returnArr[3]);
       //g2.fillRect(x - startSide/sideLength, y - startSide/sideLength, startSide/sideLength, startSide/sideLength);
       returnArr[4] = x - startSide/sideLength;
       sTetrConfigurations.add(returnArr[4]);
       returnArr[5] = y - startSide/sideLength;
       sTetrConfigurations.add(returnArr[5]);
       //g2.fillRect(x - startSide/sideLength, y - (2 * startSide/sideLength), startSide/sideLength, startSide/sideLength );
       returnArr[6] = x - startSide/sideLength;
       sTetrConfigurations.add(returnArr[6]);
       returnArr[7] = y - (2 * startSide/sideLength);
       sTetrConfigurations.add(returnArr[7]);

       return returnArr;

     }

     if(turningFactor == 2){
         //g2.fillRect(x, y, startSide/sideLength, startSide/sideLength);
         returnArr[0] = x;
         sTetrConfigurations.add(returnArr[0]);
         returnArr[1] = y;
         sTetrConfigurations.add(returnArr[1]);
         //g2.fillRect(x + startSide/sideLength, y, startSide/sideLength, startSide/sideLength);
         returnArr[2] = x + startSide/sideLength;
         sTetrConfigurations.add(returnArr[2]);
         returnArr[3] = y;
         sTetrConfigurations.add(returnArr[3]);
         //g2.fillRect(x + startSide/sideLength, y - startSide/sideLength, startSide/sideLength, startSide/sideLength);
         returnArr[4] = x + startSide/sideLength;
         sTetrConfigurations.add(returnArr[4]);
         returnArr[5] = y - startSide/sideLength;
         sTetrConfigurations.add(returnArr[5]);
         //g2.fillRect(x + (2 * (startSide/sideLength) ), y - startSide/sideLength, startSide/sideLength, startSide/sideLength);
         returnArr[6] = x + (2 * startSide/sideLength);
         sTetrConfigurations.add(returnArr[6]);
         returnArr[7] = y - startSide/sideLength;
         sTetrConfigurations.add(returnArr[7]);

         return returnArr;
     }

      if(turningFactor == 3){
          //g2.fillRect(x, y - startSide/sideLength, startSide/sideLength, startSide/sideLength);
          returnArr[0] = x;
          sTetrConfigurations.add(returnArr[0]);
          returnArr[1] = y - startSide/sideLength;
          sTetrConfigurations.add(returnArr[1]);
          //g2.fillRect( x + startSide/sideLength, y - startSide/sideLength, startSide/sideLength, startSide/sideLength);
          returnArr[2] = x + startSide/sideLength;
          sTetrConfigurations.add(returnArr[2]);
          returnArr[3] = y - startSide/sideLength;
          sTetrConfigurations.add(returnArr[3]);
          //g2.fillRect(x + startSide/sideLength, y, startSide/sideLength, startSide/sideLength );
          returnArr[4] = x + startSide/sideLength;
          sTetrConfigurations.add(returnArr[4]);
          returnArr[5] = y;
          sTetrConfigurations.add(returnArr[5]);
          //g2.fillRect( x + (2 * startSide/sideLength), y, startSide/sideLength, startSide/sideLength);
          returnArr[6] = x + (2 * startSide/sideLength);
          sTetrConfigurations.add(returnArr[6]);
          returnArr[7] = y;
          sTetrConfigurations.add(returnArr[7]);

          return returnArr;
     }
     return emptyArr;
   }


   public TetrominoAlgol(){
           frame = new JFrame("Polypeptide and Nuclear Lamina Tilings");
           frame.setSize(1440, 900);
           frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
           frame.setPreferredSize(frame.getSize());
           frame.add(new DrawLamina(frame.getSize()));
           frame.pack();
           frame.setVisible(true);
   }

   public static void main(String[] args){

       //System.out.println("Enter a side length for the lamina for tiling and a sidelength for the lamina hole: ");
       new TetrominoAlgol();

   }

   public static class DrawLamina extends JPanel{




       Scanner scan = new Scanner(System.in);
       int lengthInt = scan.nextInt();
       Scanner scan2 = new Scanner(System.in);
       int holeInt = scan.nextInt();

       Color[][] laminaColorings = new Color[startSide/lengthInt][startSide/lengthInt];



       public DrawLamina(Dimension dimensionSize){
           setSize(dimensionSize);
           setPreferredSize(dimensionSize);
       }


       public void paintComponent(Graphics g) {
          Graphics2D g2 = (Graphics2D)g;
          Dimension d = getSize();


          int[] removalArr = LTetr(g2, startX, startY, startSide, lengthInt, 5);

          drawGrid(g2, startX, startY, startSide, lengthInt, holeInt, removalArr);

       }
   }


      public static void drawGrid(Graphics g2, int x, int y, int startSide, int sideLength, int holeInt, int[] removalArr){

       for(int xCord = 0; xCord < sideLength; xCord += 1){
               for(int yCord = 0; yCord < sideLength; yCord += 1){



                /*
                if( ((xCord >= (startSide/sideLength) - (2 * holeInt) - 1) && (xCord <= (startSide/sideLength) - (2 * holeInt) - 1) + (holeInt - 1))
                  && ( (yCord >= (startSide/sideLength) - (2 * holeInt) - 1 ) && yCord <= ((startSide/sideLength) - (2 * holeInt) - 1) + (holeInt - 1) ){

                    laminaColorings[xCord * (startSide/sideLength)][yCord * (startSide/sideLength)] = Color.black;

                }
                */



               g2.drawRect( (x + (xCord * (startSide/sideLength) )), (y - (yCord * (startSide/sideLength ) ) ), (startSide/sideLength), (startSide/sideLength) );
               g2.setColor(new Color(255, 255, 255) );
               g2.fillRect( (x +  (((sideLength - holeInt)/2) * (startSide/sideLength)) ), ( (y - ((sideLength - ((sideLength - holeInt)/2) ) - 1 ) * (startSide/sideLength)) ) , (holeInt * (startSide/sideLength) ), (holeInt * (startSide/sideLength) ) );
               g2.setColor(new Color(0,0,0) );


              //g2.setColor(new Color(255, 0, 0) );
              //tTetr(g2, startX, startY, startSide, sideLength, 3);
              //g2.setColor(new Color(0,0,0) );
          }


       }



       //sets already considered tiles to a white color in order to fulfill the condition that if all is white that it is tiled
       for(int i = 0; i < removalArr.length; i += 2){
          g2.setColor(new Color(255, 255, 255) );
          g2.fillRect(removalArr[i], removalArr[i + 1], startSide/sideLength, startSide/sideLength);
          g2.setColor(new Color(0, 0, 0) );

        }
        //------------------------------------------------------
        //NOTE: CONFIGURATIONS NEED REDUCTIONS

        //CONFIGURATIONS FOR SQUARE(NO REDUCTIONS REQUIRED)
        for(int xCord = 0; xCord < sideLength; xCord++){
          for(int yCord = 0; yCord < sideLength; yCord++){
            squareTetr(g2, xCord, yCord, startSide, sideLength);
          }
        }

        //CONFIGURATIONS FOR L TETROMINO

        for(int turnFactor = 0; turnFactor <= 7; turnFactor++){
          for(int xCord = 0; xCord < sideLength; xCord++){
            for(int yCord = 0; yCord < sideLength; yCord++){
              LTetr(g2, xCord, yCord, startSide, sideLength, turnFactor);
            }
          }
        }

        //CONFIGURATIONS FOR T-TETROMINO and S TETROMINO
        for(int turnFactor = 0; turnFactor <= 3; turnFactor++ ){
          for(int xCord = 0; xCord < sideLength; xCord++){
            for(int yCord = 0; yCord < sideLength; yCord++){
              tTetr(g2, xCord, yCord, startSide, sideLength, turnFactor);
              sTetr(g2, xCord, yCord, startSide, sideLength, turnFactor);
            }
          }
        }

        //CONFIGURATIONS FOR LINE Tetromino
        for(int turnFactor = 0; turnFactor <= 1; turnFactor++){
          for(int xCord = 0; xCord < sideLength; xCord++){
            for(int yCord = 0; yCord < sideLength; yCord++){
              lineTetr(g2, xCord, yCord, startSide, sideLength, turnFactor);
            }
          }
        }
        //-------------------------------------------------------------------










   }


   public void mousePressed(MouseEvent e){

    }



}
