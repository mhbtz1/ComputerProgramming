Vertices[][] connections = new Vertices[10][10];
Vertices[][] constantConnections = new Vertices[10][10];
boolean[][] presses = new boolean[10][10];
boolean restart = false;

//computational physics project with modeling the behavior of a two dimensional(and maybe three dimensional) discrete fabric
//probably should impl SLAM simulation

int startX = 450;
int startY = 200;

int tempX = -1;
int tempY = -1;


float store1 = -1;
float store2 = -1;

color specificVertex;
float period = 60;
float amplitude = 20;
boolean oscillatoryHasRun = false;

//does oscillation of point using sinusoids


//this function has issues
void oscillatoryMotion(int tempX, int tempY, float dividingFactor, Vertices constantX){
    
    
    text("COMPUTATIONAL PHYSICS: EXPERIMENTING WITH A TWO DIMENSIONAL DISCRETE MESH CONFIGURATION", 450, 30);
    float x = amplitude * cos(TWO_PI * frameCount / period);
    stroke(0);
    fill(175);
   
    float xDiff = constantX.xCord + connections[tempX][tempY].xCord;
    float yDiff = constantX.yCord - connections[tempX][tempY].yCord;
    
    connections[tempX][tempY].xCord += x*2.5; //setting this value to += xDiff will simulate the removal of connections
    connections[tempX][tempY].yCord += x*2.5; //same thing with += yDiff
    println("X VALUE" + x);
    
  
    period /= 1.05;
    amplitude /= 1.05;
}


public boolean vertexSearch(int X, int Y){
  for(int i = 0; i < 10; i++){
    for(int j = 0; j < 10; j++){
      if( (X >= connections[i][j].xCord - 10 && X <= connections[i][j].xCord + 10) && (Y >= connections[i][j].yCord - 10 && Y <= connections[i][j].yCord + 10) ){
        tempX = i;
        tempY = j;
        store1 = (connections[tempX][tempY].xCord);
        store2 = (connections[tempX][tempY].yCord);
        return true;
      }
    }
  }
  return false;
}



void mousePressed(){
  restart = true;
  if(vertexSearch(mouseX, mouseY)){
    presses[tempX][tempY] = true;
  } else {
    presses[tempX][tempY] = false;
  }
}

void mouseReleased(){
  presses[tempX][tempY] = false;
}




void setup(){
  size(1400, 1400);
  colorMode(HSB, 100);
  
  for(int i = 0; i < 10; i++){
    for(int j = 0; j < 10; j++){
      startX += 50;
      connections[i][j] = new Vertices(10, 0, startX, startY);
      constantConnections[i][j] = new Vertices(10, 0, startX, startY);
    }
    startY += 50;
    startX = 450;
  }
}

void draw(){
  background(100);
  text("COMPUTATIONAL PHYSICS: EXPERIMENTING WITH A TWO DIMENSIONAL DISCRETE MESH CONFIGURATION", 450, 30);
  for(int i = 0; i < 10; i++){
    for(int j = 0; j < 10; j++){
      if(i == tempX && j == tempY && presses[tempX][tempY]){
         fill( (int)((connections[tempX][tempY].distanceCalc(store1, store2, mouseX, mouseY))), (int)((connections[tempX][tempY].distanceCalc(store1, store2, mouseX, mouseY))), (int)((connections[tempX][tempY].distanceCalc(store1, store2, mouseX, mouseY))) );
         ellipse(connections[i][j].xCord, connections[i][j].yCord, 10, 10);
      } else {
        fill(0);
        ellipse(connections[i][j].xCord, connections[i][j].yCord, 10, 10);
      }
      for(int k = 0; k < 10; k++){
        for(int l = 0; l < 10; l++){
          if( (k == i + 1 && l == j) || (k == i - 1 && l == j)  || (k == i && l == j + 1) || (k == i && l == j - 1) ){
            line(connections[i][j].xCord, connections[i][j].yCord, connections[k][l].xCord, connections[k][l].yCord);
          }
        }
      }
    }
  }
  
  if(tempX != -1 && tempY != -1 ){
      if(presses[tempX][tempY]){
        connections[tempX][tempY].xCord = mouseX;
        connections[tempX][tempY].yCord = mouseY;
      } else if(!presses[tempX][tempY]){
        if(period >= 20 && !presses[tempX][tempY]){
          oscillatoryHasRun = true;
          Vertices constantX = connections[tempX][tempY];
          if(connections[tempX][tempY].xCord != tempX && connections[tempX][tempY].yCord != tempY){
             oscillatoryMotion(tempX, tempY, 1.05, constantX);     
          }
        } else {
          oscillatoryHasRun = false;
          period = 60;
          amplitude = 20;
          presses[tempX][tempY] = false;
          noLoop();
        }
      }
    }
    
    if(restart){
      loop();
    }
    
    
    
    
  
    
    
  
  
  if(tempX != -1 && tempY != -1 && presses[tempX][tempY]){
    specificVertex = color( (int)((connections[tempX][tempY].distanceCalc(store1, store2, mouseX, mouseY))) );
    connections[tempX][tempY].xCord = mouseX;
    connections[tempX][tempY].yCord = mouseY;
    println(connections[tempX][tempY].distanceCalc(store1, store2, mouseX, mouseY));
  } 

    
 }
  






class Vertices{
  float elasticity, distance, xCord, yCord;
  public Vertices(float elastic1, float distance1, float x1, float y1){
    elasticity = elastic1;
    distance = distance1;
    xCord = x1;
    yCord = y1;
  }
  
  float distanceCalc(float originalX, float originalY, float newX, float newY){
    return pow( (pow(abs(originalX - newX),2) + pow(abs(originalY - newY), 2)), 0.5);
  }
  public float calculateForce(float elasticity, float distance){
    float resultantForce = elasticity * distance;
    return resultantForce;
  }

}
