
//final project: a twist on the original brickbreaker game, adding some aspects of minesweeper
//by me

Tile[][] tileMulti = new Tile[20][25];
color[][] tileColor = new color[20][25];
CompressedCords[][] access = new CompressedCords[tileMulti.length][tileMulti[0].length];
color[] colorsElem = { color(255,0,0), color(0,0,255), color(255,255,0), color(255,0,255), color(0,255,255), color(0,255,0), color(0,0,0), color(220,220,220) };   
static float platformLength = 55;

static float platformWidth = 6;

Ball b = new Ball(730,720);
Ball b2 = new Ball(790,720);

Platform p = new Platform(670,730);
Platform p2 = new Platform(730,730);

int returnedX = -1, returnedY = -1;

int scoreMultiplier = 1;

int FINAL_SCORE = 20000;
//change FINAL_SCORE to increase difficulty of game(20,000 is probably medium, 15,000 is easy 25,000 is hard (at least for my own standards) )


//MECHANICS FOR DIFFERENT COLORS:
//the effects also do not chain, since that would make the game shorter and less difficult if played optimally.

//RED: will delete the cells that are immediately adjacent to it in the NSWE direction
//BLUE: will delete the cells that are immedately diagonally adjacent
//YELLOW: will delete the cells that are a manhattan distance of 1 cell away
//CYAN: deletes cells that are a Manhattan distance of 2 cells away
//PINK: will delete cells that are a manhattan distance of 1 cell away if it is also pink
//BLACK: will decrease multipler by a factor of 1 if your current multiplier is greater than 2
//WHITE: generic tile, does nothing

//B, N, and M will direct the ball to the left, center, or right and left and right keys will move the paddle/platform (you can also hookshot the ball while it is moving)

//lives are lost if you move off the left, right, or top of the screen
//you will lose if your score is less than the FINAL_SCORE and all tiles are deleted, or livesNum is equal to 0
//considering each tile's function, there is an optimal style of play which involves maximizing the amount of green tiles hit while minimizing the amount of black tiles hit by utilizing long-range pieces
//such as the cyan/yellow tiles' 2 and 1 manhattan distances respectively (and the same thing with the red and blue tiles)
//although for the purpose of removing black tiles, pink tiles are not as good in that they only delete tiles which are pink and are vert/horizontally adjacent, although they
// can be beneficial if bordering a large amount of cyan/yellow tiles, so that when they are removed, the tiles are exposed.


int livesNum = 3;
int numDelete = 0;

Tile prevTile;
Tile prevTile2;
int prevX, prevY;
int prevX2, prevY2;
//prevTile saves last hit tile object
char c = ' ';
char c2 = ' ';
int scoreCounter = 0;
int scoreCounter2 = 0;

boolean gameDone = false;

boolean platformContact(Ball b, Platform p){
  if(b.getX() >= p.getX() && b.getX() <= p.getX() + 70 ){
    if(b.getY() >= p.getY()){
      return true;
    }
  }
  return false;
}



void recurse(Tile prevTile){
  //red will delete all tiles immediately adjacent
  if(prevTile.getColorIndex() == 0){
    if(prevX + 1 <= 19 && tileMulti[prevX + 1][prevY] != null && tileMulti[prevX+1][prevY].getColorIndex() != -1){
      scoreCounter += 10*scoreMultiplier;
      numDelete++;
      tileMulti[prevX + 1][prevY].setColorIndex(-1);
      tileMulti[prevX+1][prevY] = null;
      access[prevX + 1][prevY] = null;
    } 
    if(prevY + 1 <= 24 && tileMulti[prevX][prevY + 1] != null && tileMulti[prevX][prevY + 1].getColorIndex() != -1){
      numDelete++;
      scoreCounter += 10*scoreMultiplier;
      tileMulti[prevX][prevY + 1].setColorIndex(-1);
      tileMulti[prevX][prevY + 1] = null;
      access[prevX][prevY + 1] = null;
    } 
    if(prevX - 1 >= 0 && tileMulti[prevX - 1][prevY] != null && tileMulti[prevX - 1][prevY].getColorIndex() != -1){
      numDelete++;
      scoreCounter += 10*scoreMultiplier;
      tileMulti[prevX - 1][prevY].setColorIndex(-1);
      tileMulti[prevX-1][prevY] = null;
      access[prevX - 1][prevY] = null;
    }
    if(prevY - 1 >= 0 && tileMulti[prevX][prevY - 1] != null && tileMulti[prevX][prevY - 1].getColorIndex() != -1){
      numDelete++;
      scoreCounter += 10*scoreMultiplier;
      tileMulti[prevX][prevY - 1].setColorIndex(-1);
      tileMulti[prevX][prevY - 1] = null;
      access[prevX][prevY - 1] = null;
    }
   //blue will delete tiles that are immediately diagonally adjacent
  } else if(prevTile.getColorIndex() == 1){
    if(prevX + 1 <= 19 && prevY + 1 <= 24 && tileMulti[prevX + 1][prevY+1] != null && tileMulti[prevX+1][prevY+1].getColorIndex() != -1){
      numDelete++;
      scoreCounter += 10*scoreMultiplier;
      tileMulti[prevX + 1][prevY+1].setColorIndex(-1);
      tileMulti[prevX+1][prevY+1] = null;
      access[prevX + 1][prevY+1] = null;
    } 
    if(prevY + 1 <= 24 && prevX - 1 >= 0 && tileMulti[prevX-1][prevY + 1] != null && tileMulti[prevX-1][prevY + 1].getColorIndex() != -1){
      numDelete++;
      scoreCounter += 10*scoreMultiplier;
      tileMulti[prevX-1][prevY + 1].setColorIndex(-1);
      tileMulti[prevX-1][prevY + 1] = null;
      access[prevX-1][prevY + 1] = null;
    } 
    if(prevX - 1 >= 0 && prevY - 1 >= 0 && tileMulti[prevX - 1][prevY-1] != null && tileMulti[prevX - 1][prevY-1].getColorIndex() != -1){
      numDelete++;
      scoreCounter += 10*scoreMultiplier;
      tileMulti[prevX - 1][prevY-1].setColorIndex(-1);
      tileMulti[prevX-1][prevY-1] = null;
      access[prevX - 1][prevY-1] = null;
    }
    if(prevY - 1 >= 0 && prevX + 1 <= 19 && tileMulti[prevX+1][prevY - 1] != null && tileMulti[prevX+1][prevY - 1].getColorIndex() != -1){
      numDelete++;
      scoreCounter += 10*scoreMultiplier;
      tileMulti[prevX + 1][prevY - 1].setColorIndex(-1);
      tileMulti[prevX + 1][prevY - 1] = null;
      access[prevX + 1][prevY - 1] = null;
    }
   //yellow will combine the operations of red and blue and do all tiles in the NSWE + NW + NE + SW + SE directions
  }else if(prevTile.getColorIndex() == 2){
      if(prevX + 1 <= 19 && tileMulti[prevX + 1][prevY] != null && tileMulti[prevX+1][prevY].getColorIndex() != -1){
        numDelete++;
        scoreCounter += 10*scoreMultiplier;
      tileMulti[prevX + 1][prevY].setColorIndex(-1);
      tileMulti[prevX+1][prevY] = null;
      access[prevX + 1][prevY] = null;
    } 
    if(prevY + 1 <= 24 && tileMulti[prevX][prevY + 1] != null && tileMulti[prevX][prevY + 1].getColorIndex() != -1){
      numDelete++;
      scoreCounter += 10*scoreMultiplier;
      tileMulti[prevX][prevY + 1].setColorIndex(-1);
      tileMulti[prevX][prevY + 1] = null;
      access[prevX][prevY + 1] = null;
    } 
    if(prevX - 1 >= 0 && tileMulti[prevX - 1][prevY] != null && tileMulti[prevX - 1][prevY].getColorIndex() != -1){
      numDelete++;
      scoreCounter += 10*scoreMultiplier;
      tileMulti[prevX - 1][prevY].setColorIndex(-1);
      tileMulti[prevX-1][prevY] = null;
      access[prevX - 1][prevY] = null;
    }
    if(prevY - 1 >= 0 && tileMulti[prevX][prevY - 1] != null && tileMulti[prevX][prevY - 1].getColorIndex() != -1){
      numDelete++;
      scoreCounter += 10*scoreMultiplier;
      tileMulti[prevX][prevY - 1].setColorIndex(-1);
      tileMulti[prevX][prevY - 1] = null;
      access[prevX][prevY - 1] = null;
    }
     if(prevX + 1 <= 19 && prevY + 1 <= 24 && tileMulti[prevX + 1][prevY+1] != null && tileMulti[prevX+1][prevY+1].getColorIndex() != -1){
       numDelete++;
       scoreCounter += 10*scoreMultiplier;
      tileMulti[prevX + 1][prevY+1].setColorIndex(-1);
      tileMulti[prevX+1][prevY+1] = null;
      access[prevX + 1][prevY+1] = null;
    } 
    if(prevY + 1 <= 24 && prevX - 1 >= 0 && tileMulti[prevX-1][prevY + 1] != null && tileMulti[prevX-1][prevY + 1].getColorIndex() != -1){
      numDelete++;
      scoreCounter += 10*scoreMultiplier;
      tileMulti[prevX-1][prevY + 1].setColorIndex(-1);
      tileMulti[prevX-1][prevY + 1] = null;
      access[prevX-1][prevY + 1] = null;
    } 
    if(prevX - 1 >= 0 && prevY - 1 >= 0 && tileMulti[prevX - 1][prevY-1] != null && tileMulti[prevX - 1][prevY-1].getColorIndex() != -1){
      numDelete++;
      scoreCounter += 10*scoreMultiplier;
      tileMulti[prevX - 1][prevY-1].setColorIndex(-1);
      tileMulti[prevX-1][prevY-1] = null;
      access[prevX - 1][prevY-1] = null;
    }
    if(prevY - 1 >= 0 && prevX + 1 <= 19 && tileMulti[prevX+1][prevY - 1] != null && tileMulti[prevX+1][prevY - 1].getColorIndex() != -1){
      numDelete++;
      scoreCounter += 10*scoreMultiplier;
      tileMulti[prevX + 1][prevY - 1].setColorIndex(-1);
      tileMulti[prevX + 1][prevY - 1] = null;
      access[prevX + 1][prevY - 1] = null;
    }
  //pink will delete all tiles that are immediately adjacent and diagonally adjacent to it given that they are also pink tiles;
  }else if(prevTile.getColorIndex() == 3){
     if(prevX + 1 <= 19 && tileMulti[prevX + 1][prevY] != null && tileMulti[prevX+1][prevY].getColorIndex() == 3){
       numDelete++;
       scoreCounter += 10;
      tileMulti[prevX + 1][prevY].setColorIndex(-1);
      tileMulti[prevX+1][prevY] = null;
      access[prevX + 1][prevY] = null;
    } 
    if(prevY + 1 <= 24 && tileMulti[prevX][prevY + 1] != null && tileMulti[prevX][prevY + 1].getColorIndex() == 3){
      numDelete++;
      scoreCounter += 10;
      tileMulti[prevX][prevY + 1].setColorIndex(-1);
      tileMulti[prevX][prevY + 1] = null;
      access[prevX][prevY + 1] = null;
    } 
    if(prevX - 1 >= 0 && tileMulti[prevX - 1][prevY] != null && tileMulti[prevX - 1][prevY].getColorIndex() == 3){
      numDelete++;
      scoreCounter += 10;
      tileMulti[prevX - 1][prevY].setColorIndex(-1);
      tileMulti[prevX-1][prevY] = null;
      access[prevX - 1][prevY] = null;
    }
    if(prevY - 1 >= 0 && tileMulti[prevX][prevY - 1] != null && tileMulti[prevX][prevY - 1].getColorIndex() == 3){
      numDelete++;
      scoreCounter += 10;
      tileMulti[prevX][prevY - 1].setColorIndex(-1);
      tileMulti[prevX][prevY - 1] = null;
      access[prevX][prevY - 1] = null;
    }
     if(prevX + 1 <= 19 && prevY + 1 <= 24 && tileMulti[prevX + 1][prevY+1] != null && tileMulti[prevX+1][prevY+1].getColorIndex() == 3){
       numDelete++;
       scoreCounter += 10;
      tileMulti[prevX + 1][prevY+1].setColorIndex(-1);
      tileMulti[prevX+1][prevY+1] = null;
      access[prevX + 1][prevY+1] = null;
    } 
    if(prevY + 1 <= 24 && prevX - 1 >= 0 && tileMulti[prevX-1][prevY + 1] != null && tileMulti[prevX-1][prevY + 1].getColorIndex() == 3){
      numDelete++;
      scoreCounter += 10;
      tileMulti[prevX-1][prevY + 1].setColorIndex(-1);
      tileMulti[prevX-1][prevY + 1] = null;
      access[prevX-1][prevY + 1] = null;
    } 
    if(prevX - 1 >= 0 && prevY - 1 >= 0 && tileMulti[prevX - 1][prevY-1] != null && tileMulti[prevX - 1][prevY-1].getColorIndex() == 3){
      numDelete++;
      scoreCounter += 10;
      tileMulti[prevX - 1][prevY-1].setColorIndex(-1);
      tileMulti[prevX-1][prevY-1] = null;
      access[prevX - 1][prevY-1] = null;
    }
    if(prevY - 1 >= 0 && prevX + 1 <= 19 && tileMulti[prevX+1][prevY - 1] != null && tileMulti[prevX+1][prevY - 1].getColorIndex() == 3){
      numDelete++;
      scoreCounter += 10;
      tileMulti[prevX + 1][prevY - 1].setColorIndex(-1);
      tileMulti[prevX + 1][prevY - 1] = null;
      access[prevX + 1][prevY - 1] = null;
    }
   //cyan will delete pieces that are a Manhattan distance of 2 away
  } else if(prevTile.getColorIndex() == 4){
    if(prevX + 1 <= 19 && prevY + 1 <= 24 && tileMulti[prevX + 1][prevY+1] != null && tileMulti[prevX+1][prevY+1].getColorIndex() != -1){
      numDelete++;
      scoreCounter += 10;
      tileMulti[prevX + 1][prevY+1].setColorIndex(-1);
      tileMulti[prevX+1][prevY+1] = null;
      access[prevX + 1][prevY+1] = null;
    } 
    if(prevY + 1 <= 24 && prevX - 1 >= 0 && tileMulti[prevX-1][prevY + 1] != null && tileMulti[prevX-1][prevY + 1].getColorIndex() != -1){
      numDelete++;
      scoreCounter += 10;
      tileMulti[prevX-1][prevY + 1].setColorIndex(-1);
      tileMulti[prevX-1][prevY + 1] = null;
      access[prevX-1][prevY + 1] = null;
    } 
    if(prevX - 1 >= 0 && prevY - 1 >= 0 && tileMulti[prevX - 1][prevY-1] != null && tileMulti[prevX - 1][prevY-1].getColorIndex() != -1){
      numDelete++;
      scoreCounter += 10;
      tileMulti[prevX - 1][prevY-1].setColorIndex(-1);
      tileMulti[prevX-1][prevY-1] = null;
      access[prevX - 1][prevY-1] = null;
    }
    if(prevY - 1 >= 0 && prevX + 1 <= 19 && tileMulti[prevX+1][prevY - 1] != null && tileMulti[prevX+1][prevY - 1].getColorIndex() != -1){
      numDelete++;
      scoreCounter += 10;
      tileMulti[prevX + 1][prevY - 1].setColorIndex(-1);
      tileMulti[prevX + 1][prevY - 1] = null;
      access[prevX + 1][prevY - 1] = null;
    }
    if(prevX - 2 >= 0 && tileMulti[prevX - 2][prevY] != null){
      numDelete++;
      scoreCounter += 10;
      tileMulti[prevX - 2][prevY].setColorIndex(-1);
      tileMulti[prevX - 2][prevY] = null;
      access[prevX - 2][prevY] = null;
    }
    if(prevX + 2 <= 19 && tileMulti[prevX + 2][prevY] != null){
      numDelete++;
      scoreCounter += 10;
      tileMulti[prevX + 2][prevY].setColorIndex(-1);
      tileMulti[prevX + 2][prevY] = null;
      access[prevX + 2][prevY] = null;
    }
    if(prevY - 2 >= 0 && tileMulti[prevX][prevY - 2] != null){
      numDelete++;
      scoreCounter += 10;
      tileMulti[prevX][prevY-2].setColorIndex(-1);
      tileMulti[prevX][prevY-2] = null;
      access[prevX][prevY-2] = null;
    }
    if(prevY + 2 <= 24 && tileMulti[prevX][prevY + 2] != null){
      numDelete++;
      scoreCounter += 10;
      tileMulti[prevX][prevY+2].setColorIndex(-1);
      tileMulti[prevX][prevY+2] = null;
      access[prevX][prevY+2] = null;
    }
    
  //green will increase score multipler by a factor of 1, given that it is DIRECTLY hit;
  } else if(prevTile.getColorIndex() == 5){
    scoreMultiplier += 1;
    numDelete++;
 //these two are generic tiles(are just deleted when the ball goes int their hitbox)
  } else if(prevTile.getColorIndex()  == 6){
    numDelete++;
    scoreMultiplier -= (min(scoreMultiplier, 2) == 2 ? 1 : 0);
  } else if(prevTile.getColorIndex() == 7){
    numDelete++;
    
  }

  
}


void setup(){
  size(1400,800);
  frameRate(100);
  int randomIndex;
  for(int i = 0; i < 20; i++){
    for(int j = 0;j < 25; j++){
      randomIndex = (int)(random(0,8));
      tileMulti[i][j] = new Tile((float)(i*70), (float)(j*20), 70, 20, randomIndex);
      rect(tileMulti[i][j].getLX(), tileMulti[i][j].getLY(), tileMulti[i][j].getW(), tileMulti[i][j].getL());
    }
  }
  for(int i = 0; i < 20; i++){
    for(int j = 0; j < 25; j++){
      access[i][j] = new CompressedCords(tileMulti[i][j]);
    }
  }
  
}


void mousePressed(){
  text("SCORE:", mouseX, mouseY);
  println(mouseX, mouseY);
}

void draw(){
  if(!gameDone){
    
   stroke(0,0,0);
   line(0,700,1400,700);
  

   background(255);
   textSize(16);
   text("P1'S LIVES: " + livesNum, 100, 780);
  text("SCORE: " + scoreCounter, 1173, 780);
  text("SCORE MULTIPLIER: " + scoreMultiplier, 1173, 760);
  
  fill(255,255,0);
   for(int i = 0; i < 20; i++){
    for(int j = 0;j < 25; j++){
      if(access[i][j] != null && tileMulti[i][j] != null && tileMulti[i][j].getColorIndex() != -1){
        fill(colorsElem[tileMulti[i][j].getColorIndex()]);
        rect(tileMulti[i][j].getLX(), tileMulti[i][j].getLY(), tileMulti[i][j].getW(), tileMulti[i][j].getL());
      }
    }
  }
  fill(0,0,0); 
  
  
  if(b.getX() > 0 && b.getX() < 1400 && b.getY() > 0){
    ellipse(b.getX(), b.getY(), 18, 18);
  }
  noStroke();
  rect(p.getX(), p.getY(), platformLength, platformWidth);
  fill(255,255,0);
  //rect(p2.getX(), p2.getY(), platformLength, platformWidth);
  //rect(p2.getX() + (platformLength/2), p2.getY() - (platformWidth*2), 5, 15);
  fill(0,0,0);
  noStroke();
  rect(p.getX() + (platformLength/2), p.getY() - (platformWidth*2), 5,15);
  stroke(0,0,0);
  
  boolean ret = b.ifContact();

  
  if(b.getY() <= 0 && (b.getX() >= 0 && b.getY() <= 1400)){
    println("Y IS LESS THAN ZERO");
    livesNum--;
    b.setX(p.getX());
    b.setY(p.getY());
  } else if(livesNum > 0 && ( (b.getX() <= 0 || b.getX() >= 1400) ) ){
    b.setX(p.getX());
    b.setY(p.getY());
    livesNum--;
  } else if(livesNum == 0 || scoreCounter >= FINAL_SCORE){
     background(255);
     gameDone = true;
  } else if(numDelete == 500 && scoreCounter <= FINAL_SCORE){
    background(255);
    gameDone = true;
  }
 
   
  if(ret && prevTile.getColorIndex() != 5){
    scoreCounter += 10*scoreMultiplier;
  }
  if(ret){
    b.setX(p.getX() + 20);
    b.setY(p.getY() - 18);
    ret = false;
  }
  
   
   if(platformContact(b,p) || c == ' '){
    if(b.getX() <= p.getX() + (float)platformLength/3 ){
      c = 'a';
      b.setX(b.getX() + 40);
      b.setY(b.getY() - 40);
    } else if(b.getX() > p.getX() + ((float)(platformLength)/3.0) && b.getX() <= p.getX() + 2 * ((float)(platformLength)/3.0) ){
      c = 'b';
      b.setX(b.getX());
      b.setY(b.getY() - 40);
    } else {
      c = 'c';
      b.setX(b.getX() - 40);
      b.setY(b.getY() - 40);
    }
   }

   
   if(c == 'a'){
      b.setX(b.getX() + 10);
      b.setY(b.getY() - 10);
   } else if(c == 'b'){
      b.setX(b.getX());
      b.setY(b.getY() - 10);
   } else if(c == 'c'){
     b.setX(b.getX() - 10);
     b.setY(b.getY() - 10);
   }
   
   
   //println(c);
  } else if(gameDone && livesNum == 0){
    text("YOU LOSE THE GAME.", 580, 400);
    text("IF YOU WANT TO PLAY AGAIN, PRESS ENTER.", 520,420);
    
  } else if(gameDone && scoreCounter >= 20000){
    background(255);
    text("YOU WIN THE GAME.", 580, 400);
    text("IF YOU WANT TO PLAY AGAIN, PRESS ENTER.", 520,420);
  }
  
  
}

public void keyPressed(){
  
  if(keyCode == LEFT){
    p.setX(p.getX() - 20);
  } else if(keyCode == RIGHT){
    p.setX(p.getX() + 20);
  }
  if(keyCode == 66){
    c = 'c';
  } else if(keyCode == 78){
    c = 'b'; 
  } else if(keyCode == 77){
    c = 'a';
  }
  
  if(keyCode == ENTER && (livesNum == 0 || scoreCounter >= 5000) ){
    println("RUN");
    livesNum = 3;
    gameDone = false;
    scoreCounter = 0;
    scoreMultiplier = 1;
    p.setX(670);
    p.setY(730);
    b.setX(730);
    b.setY(720);
    int randomIndex;
    
   
    background(255);
   for(int i = 0; i < 20; i++){
    for(int j = 0;j < 25; j++){
      randomIndex = (int)(random(0,8));
      tileMulti[i][j] = new Tile((float)(i*70), (float)(j*20), 70, 20, randomIndex);
      fill(colorsElem[tileMulti[i][j].getColorIndex()]);
      rect(tileMulti[i][j].getLX(), tileMulti[i][j].getLY(), tileMulti[i][j].getW(), tileMulti[i][j].getL());
    }
  }
  for(int i = 0; i < 20; i++){
    for(int j = 0; j < 25; j++){
      access[i][j] = new CompressedCords(tileMulti[i][j]);
    }
  }
  delay(3000);
  
}
}

public class Ball{
  private float xCord, yCord;
  
  public Ball(float xCord, float yCord){
    this.xCord = xCord;
    this.yCord = yCord;
  }
  public float getX(){
    return xCord;
  }
  public float getY(){
    return yCord;
  }
  public void setX(float newX){
    xCord = newX;
  }
  public void setY(float newY){
    yCord = newY;
  }
  public boolean ifContact(){
    //returnedX = -1;
    //returnedY = -1;
    boolean found = false;
    for(int i = 0; i < access.length; i++){
      for(int j = 0; j < access[0].length; j++){
        if( (access[i][j] != null) && ( (xCord + 18 >= access[i][j].boundedX() && xCord - 18 <= access[i][j].unboundedX()) && (yCord - 18  >= access[i][j].boundedY() && yCord - 18  <= access[i][j].unboundedY()) )){
           returnedX = i;
           returnedY = j;
           prevX = i;
           prevY = j;
           prevTile = tileMulti[i][j];
           recurse(prevTile);
           tileMulti[i][j].setColorIndex(-1);
           access[i][j] = null;
           tileMulti[i][j] = null;
           found = true;
           break;
        }
      }
      if(found){
        break;
      }
    }
    
    return found;
    
  }
}

public class Tile{
  private float leftX, leftY, desiredWidth, desiredLength;
  private int randomIndex;
  
  public Tile(float leftX, float leftY, float desiredWidth, float desiredLength, int randomIndex){
    this.leftX = leftX;
    this.leftY = leftY;
    this.desiredWidth = desiredWidth;
    this.desiredLength = desiredLength;
    this.randomIndex = randomIndex;
  }
  public float getLX(){
    return leftX;
  }
  public float getLY(){
    return leftY;
  }
  public float getW(){
    return desiredWidth;
  }
  public float getL(){
    return desiredLength;
  }
  public int getColorIndex(){
    return randomIndex;
  }
  public void setColorIndex(int newIndex){
    randomIndex = newIndex;
  }
  
  
}

public class Platform{
   private float leftX, leftY;
   public Platform(float leftX, float leftY){
     this.leftX = leftX;
     this.leftY = leftY;
   }
   public float getX(){
    return leftX;
  }
  public float getY(){
    return leftY;
  }
  public void setX(float newX){
    leftX = newX;
  }
  public void setY(float newY){
    leftY = newY;
  }
   
}

public class CompressedCords{
  public Tile obj1;
  public CompressedCords(Tile obj1){
    this.obj1 = obj1;
  }
  public float boundedX(){
    return obj1.getLX();
  }
  public float unboundedX(){
     return obj1.getLX() + platformLength;
  }
  public float boundedY(){
    return obj1.getLY();
  }
  public float unboundedY(){
    return obj1.getLY() + platformWidth;
  }
}
