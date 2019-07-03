
 float radius = 55;
 float E = exp(1);
 float goldenratio = (1 + sqrt(5))/2;
 
 float[] centerX = new float[10];
 float[] centerY = new float[10];
 float[] constantX = new float[10];
 float[] constantY = new float[10];
 int[] angle = new int[10];

 float X = 200, Y = 400;

void setup(){

  
  centerX[0] = 100;
  centerY[0] = 400;
  constantX[0] = 400;
  constantY[0] = 400;
  
  
  constantX[1] = 1100;
  constantY[1] = 400;
  
 for(int i = 0; i < 10; i++){
   angle[i] = 0;
 }
  
  background(255);
  size(1600,1600);
  
  //FOR LEFT SPATIAL DESIGN

  fill(255,0,255);
  ellipse(400, 400, 50, 50);
  
  fill(255,0,0);
  ellipse(400,400,15,15);
  
  
  //FOR RIGHT SPATIAL DESIGN

  fill(255,120,255);
  ellipse(1100, 400, 50, 50);
  fill(255,0,0);
  ellipse(1100,400,15,15);

  frameRate(20);
}

void draw(){
  
  fill(0);
  text("SPATIAL VISUALIZATIONS", 650, 50);
  
  spatialProgramming(0,90,0);
  
  spatialProgramming(1, 135, 1);

}

void spatialProgramming(int i, double addFactor, int index){

  
  centerX[index] = constantX[index] + (200 * cos(angle[i]));
  centerY[index] = constantY[index] + (200 * sin(angle[i]));
  
  fill(255,255,0);
  ellipse(centerX[index],centerY[index],10,10);
  
  angle[i] += addFactor;
  X = centerX[index] + (radius * cos(angle[i]));
  Y = centerY[index] + (radius *  sin(angle[i]));
  
  stroke(0,255,255);
  line(X, Y, X - (radius * cos(angle[i])), Y  + (radius * (sin(angle[i]))));
  line(X, Y, X + (radius * cos(angle[i])), Y  - (radius * (sin(angle[i]))));
  line(X, Y, X - (radius * cos(angle[i]))*(5), Y  + (radius * (sin(angle[i])))*(5));
  line(X, Y, X + (radius * cos(angle[i]))*(5), Y  - (radius * (sin(angle[i])))*(5));
  line(X, Y, (X + (radius * cos(angle[i]))), (Y  + (radius * (sin(angle[i])))) );
  
  fill(0,255,0);
  stroke(0);
  ellipse(X, Y,radius,radius);
  
  stroke(255,0,255);
  fill(random(0,255), random(0,255), random(0,255) );
  ellipse(X + (radius * cos(angle[i])), Y  + (radius * (sin(angle[i]))), 20, 20);
  
  
  line(X + (radius * cos(angle[i])), Y  + (radius * (sin(angle[i]))), X + (radius * cos(angle[i])), Y  + (radius * (sin(angle[i]))));
   

  line(centerX[index], centerY[index], constantX[index], constantY[index]);

}

void mousePressed(){
  print(mouseX + " " + mouseY);
}
