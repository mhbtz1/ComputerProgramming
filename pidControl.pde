
//implementing PID control for simulating some robotics stuff
//as it is now, it will randomly choose a position on the circle
//the arm will then attempt to move to that position in the most efficient manner

float tempAngleOne, tempAngleTwo;
float rand1 = random(0,2*PI);
float rand2 = random(0, 2*PI);

float randOne = random(0,2*PI);
float randTwo = random(0,2*PI);
 
float v1 =cos(rand1);
float v2 = cos(rand2);
float v3 = sin(rand1);
float v4 = sin(rand2);

float v5 = cos(randOne);
float v6 = cos(randTwo);
float v7 = sin(randOne);
float v8 = sin(randTwo);

float error1 = 0;
float prevError1 = 0;

float error2 = 0;
float prevError2 = 0;

void mousePressed(){
  println(mouseX + " " + mouseY);
}

void setup(){
  size(1400,1400);
  frameRate(10);
  tempAngleOne = rand1;
  tempAngleTwo = randOne;
  
  //PID controller on a simulated robotic arm(i.e. the rotating line)
}


void draw(){
  background(255);
  fill(255,0,0);
  noFill();
  text("SIMULATING A FEEDBACK CONTROL LOOP SYSTEM WITH PROCESSING ", 500, 20);
  point(400,400);
  point(1000,400);
  ellipse(400, 400, 600, 600);
  ellipse(1000,400,600,600);
  
  line(400,400, (300 * v2) + 400, 400 - (300 * v4));
  line(1000,400, (300 *v6) + 1000, 400 - (300 *v8) ); 
  
  float diff = rand2 - tempAngleOne;
  float diff2 = randTwo - tempAngleTwo;
  
  prevError1 = error1;
  prevError2 = error2;
  error1 += diff;
  error2 += diff2;
  
  println("ERROR ONE: " + error1 + " ERROR TWO: " + error2);
  //PID(F) Control (for a proof of concept I implemented the entire PID control loop but only P is necessary)
  //i have commented out the integral and derivative control
  
  tempAngleOne += (0.5 * diff); 
  //+ (0.025 * error1) + (0.0025 * (prevError1 - error1));
  tempAngleTwo += (0.5 * diff2); 
  //+ (0.025 * error2) + (0.0025 * (prevError2 - error2));
  
  line(400, 400, (300 * (cos(tempAngleOne)) + 400), (400 - (300 * sin(tempAngleOne))) );
  line(1000,400, (300 * (cos(tempAngleTwo)) + 1000), (400 - (300 * sin(tempAngleTwo))) );
  
  if(abs(prevError1 - error1) <= 0.0002){
    rand1 = random(0,2*PI);
    rand2 = random(0,2*PI);
    v1 = cos(rand1);
    v2 = cos(rand2);
    v3 = sin(rand1);
    v4 = sin(rand2);
    prevError1 = 0;
    error1 = 0;
    tempAngleOne = 0;
  }
  if(abs(prevError2 - error2) <= 0.0002){
    randOne = random(0,2*PI);
    randTwo = random(0,2*PI);
    v5 = cos(randOne);
    v6 = cos(randTwo);
    v7 = sin(randOne);
    v8 = sin(randTwo);
    prevError2 = 0;
    error2 = 0;
    tempAngleTwo = 0;
  }
}
