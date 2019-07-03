Point p1 = new Point(500,300);
Point p2 = new Point(250, 500 + ((150)*(sqrt(3))) );
Point p3 = new Point(750, 500 + ((150)*(sqrt(3))) );

Point q1 = new Point(1000, 300);
Point q2 = new Point(750, 500 + (150 * sqrt(3)));
Point q3 = new Point(1250, 500 + (150 * sqrt(3)) );

Point r1 = new Point(750, 500 + (150 * sqrt(3)) );
Point r2 = new Point(500,300);
Point r3 = new Point(1000, 300);

int counter = 0;

float goldenratio = (1 + sqrt(5))/2;
float multip = 0;

float leftD = 10;
float rightD = 10 * sqrt(3);

int curAngle = 0;


void setup(){
  size(1800,1800);
  background(255);
  frameRate(20);
  
  fill(255,0,0);
  
  line(p1.pX, p1.pY, p2.pX, p2.pY);
  line(p2.pX, p2.pY, p3.pX, p3.pY);
  line(p1.pX, p1.pY, p3.pX, p3.pY);
  
   line(q1.pX, q1.pY, q2.pX, q2.pY);
   line(q1.pX, q1.pY, q3.pX, q3.pY);
   line(q2.pX, q2.pY, q3.pX, q3.pY);
   
   line(r1.pX, r1.pY, r2.pX, r2.pY);
   line(r1.pX, r1.pY, r3.pX, r3.pY);
   line(r2.pX, r2.pY, r3.pX, r3.pY);

}

void draw(){
 
 text("Triangular spiral formed when leftD -= 1e-7 and rightD -= 1e-6", 500, 20);
 line(p1.pX, p1.pY, p2.pX, p2.pY);
 line(p2.pX, p2.pY, p3.pX, p3.pY);
 line(p1.pX, p1.pY, p3.pX, p3.pY);
 line(q1.pX, q1.pY, q2.pX, q2.pY);
 line(q1.pX, q1.pY, q3.pX, q3.pY);
 line(q2.pX, q2.pY, q3.pX, q3.pY);
 line(r1.pX, r1.pY, r2.pX, r2.pY);
 line(r1.pX, r1.pY, r3.pX, r3.pY);
 line(r2.pX, r2.pY, r3.pX, r3.pY);
 
 stroke(255,0,255);
 line(p1.pX, p1.pY, q3.pX, q3.pY);
 
  p1.pX -= leftD;
  p1.pY += rightD;
  q1.pX -= leftD;
  q1.pY += rightD;
  
  p2.pX += sqrt(pow(leftD, 2) + pow(rightD, 2));
  p2.pY += multip * 0.02;
  p3.pX -= leftD;
  p3.pY -= rightD;
  
  q2.pX += sqrt(pow(leftD, 2) + pow(rightD, 2));
  q2.pY += multip * 0.02;
  q3.pX -= leftD;
  q3.pY -= rightD;
 
  leftD -= 0.0000001;
  rightD += 0.000001;
  multip += 1;
  
  println("not run");
  counter++;
  if(counter == 28){
    p1.pX = 500;
    p1.pY = 300;
    p2.pX = 250;
    p2.pY = 500 + (150 * sqrt(3) );
    p3.pX = 750;
    p3.pY = 500 + (150 * sqrt(3) );
    
    q1.pX = 1000;
    q1.pY = 300;
    q2.pX = 750;
    q2.pY = 500 + (150 * sqrt(3));
    q3.pX = 1250;
    q3.pY = 500 + (150 * sqrt(3));
    
    r1.pX = 750;
    r1.pY = 500 + (150 * sqrt(3));
    r2.pX = 500;
    r2.pY = 300;
    r3.pX = 1000;
    r3.pY = 300;
    
    counter = 0;
    multip = 0;
    leftD = 10;
    rightD = (10 * sqrt(3));
   background(255);
  }
  
  stroke(0);
  
  
}
class Point{
  public float pX, pY;
  public Point(float x, float y){
    pX = x;
    pY = y;
  }
}
