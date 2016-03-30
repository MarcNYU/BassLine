boolean triggerSpike = false;
boolean choice1 = false;
boolean choice2 = false; //If player jumps right one position
boolean choice3 = false;//If player jumps left one position
boolean choice4 = false;
boolean grounded = false;





 
//pseduo adjacency list for player jump decisions at each platform

//Trigger[][] decisionGraph = new Trigger[8][8];
//decisionGraph[0] = {tNull,tNull,tNull,tNull,t5,t6,t7,t8};
//decisionGraph=            {{tNull,tNull,tNull,tNull,t5,t6,t7,t8},
//                           {tNull,tNull,tNull,tNull,t5,t6,t7,t8},
//                           {tNull,tNull,tNull,tNull,t5,t6,t7,t8},
//                           {tNull,tNull,tNull,tNull,t5,t6,t7,t8},
//                           {t1,t2,t3,t4,tNull,tNull,tNull,tNull},
//                           {t1,t2,t3,t4,tNull,tNull,tNull,tNull},
//                           {t1,t2,t3,t4,tNull,tNull,tNull,tNull},
//                           {t1,t2,t3,t4,tNull,tNull,tNull,tNull}};


Trigger[][]  decisionGraph = {{tNull,tNull,tNull,tNull,t5,t6,t7,t8},
                              {tNull,tNull,tNull,tNull,t5,t6,t7,t8},
                              {tNull,tNull,tNull,tNull,t5,t6,t7,t8},
                              {tNull,tNull,tNull,tNull,t5,t6,t7,t8},
                              {t1,t2,t3,t4,tNull,tNull,tNull,tNull},
                              {t1,t2,t3,t4,tNull,tNull,tNull,tNull},
                              {t1,t2,t3,t4,tNull,tNull,tNull,tNull},
                              {t1,t2,t3,t4,tNull,tNull,tNull,tNull}};


class Ball {
  PVector pos;
  PVector velo;
  int currentPlatform; 
  int hp;
  int dir;

  float bounce;
  float radius;


  Ball (float x, float y, float r) {
    pos = new PVector(x, y); //Vec2 of x and y position
    currentPlatform = 1;
    velo = new PVector(0, 0); //Vec2 of x and y velocity
    dir = 1; 
    bounce = 8; 
    radius = r;
    hp = 0;
  }
  



 
  void update() {
    //Apply Gravity
    //Apply Gravity
    pos.y += velo.y;
    pos.x += velo.x;
    //velo.y += gravity;
    
    if (triggerSpike) {
      spike = 100;
    }
    
    
    //if the ball is on the left side of the screen
    if(currentPlatform < 5){
      //print options from current platform
      //translate ball from current position to position of target platform
      
    }
    //if it's on the right side
    else{
      
    }
    
    
    
    //if the ball is on the bottom wire
    if (grounded()) {
      //println("yes");
      //if player jumps right one position
      if (choice2) {//w
        //set the y velocity to negative (upward) direction, set x velocity to positive direction
        velo.y = -5.5;
        //velo.x = 4;
        println("w: " + pos.x + ", " + pos.y);
      } else {
        velo.y = 0;
        velo.x = 0;
      }
      //if the player jumps left one position
      if (choice3) {
        //set the y velocity to negative (upward) direction, set x velocity to negative direction
        velo.y = -5.5;
        //velo.x = -4;
        println("o: " + pos.x + ", " + pos.y);
      } else {
        velo.y = 0;
        velo.x = 0;
      }
      //if the player jumps left one position to the wall
      if (choice1) {
        //set the y velocity to negative (upward) direction, set x velocity to negative direction
        velo.y = -4.5;
        //velo.x = -5;
        println("q: " + pos.x + ", " + pos.y);
      } else {
        velo.y = 0;
        velo.x = 0;
      }
      //if the player jumps right one position to the wall
      if (choice3) {
        //set the y velocity to negative (upward) direction, set x velocity to positive direction
        velo.y = -4.5;
        //velo.x = 5;
        println("p: " + pos.x + ", " + pos.y);
      } else {
        velo.y = 0;
        velo.x = 0;
      }
    }
    if ( grounded()){
       onGround(); 
    }
  }
void onGround() {
  if (choice4) {//p
    println("press p");
    //b.velo.y = -4.5;
    //b.velo.x = 5;
  } else if (choice2) {//w
    println("press w");
    //b.velo.y = -5.5;
    //b.velo.x = 4;
  } else if (choice3) {//o
    //b.velo.y = -5.5;
    //b.velo.x = -4;
  } else if (choice1) {//q
    //b.velo.y = -4.5;
    //b.velo.x = -5;
  } else {
    b.velo.y = 0;
    b.velo.x = 0;
  }
}


  Boolean grounded() {
    if (pos.y <= ground+1 && pos.y >= ground-1) return true; //If the ball is between the positions right above and below the "ground"
    return false;
  }

  Boolean leftB() {
    if (pos.x <= left+1 && pos.x >= left-1) return true;
    return false;
  }

  Boolean rightB() {
    if (pos.x <= right+1 && pos.x >= right-1) return true;
    return false;
  }

  void render() {
    noStroke();
    fill(255);
    ellipse(pos.x, pos.y, radius, radius);
  }

  void DrawHP() {
    switch (hp) {
    case 5:
      pushMatrix();
      fill(#03F6FC);//color of the inside
      stroke(#03F6FC);//color of lines strokes
      rect(220, 800, 40, 10); //parameters are x,y, width, height
      rect(270, 800, 40, 10);
      rect(320, 800, 40, 10);
      rect(370, 800, 40, 10);
      rect(420, 800, 40, 10);
      popMatrix();
      break;
    case 4:
      pushMatrix();
      fill(#03F6FC);
      stroke(#03F6FC);
      rect(220, 800, 40, 10); 
      rect(270, 800, 40, 10);
      rect(320, 800, 40, 10);
      rect(370, 800, 40, 10);
      noFill();
      rect(420, 800, 40, 10);
      popMatrix();
      break;
    case 3:
      pushMatrix();
      fill(#03F6FC);
      stroke(#03F6FC);
      rect(220, 800, 40, 10); 
      rect(270, 800, 40, 10);
      rect(320, 800, 40, 10);
      noFill();
      rect(370, 800, 40, 10);
      rect(420, 800, 40, 10);
      popMatrix();
      break;
    case 2:
      pushMatrix();
      fill(#03F6FC);
      stroke(#03F6FC);
      rect(220, 800, 40, 10); 
      rect(270, 800, 40, 10);
      noFill();
      rect(320, 800, 40, 10);
      rect(370, 800, 40, 10);
      rect(420, 800, 40, 10);
      popMatrix();
      break;
    case 1:
      pushMatrix();
      fill(#03F6FC);
      stroke(#03F6FC);
      rect(220, 800, 40, 10);
      noFill();
      rect(270, 800, 40, 10);
      rect(320, 800, 40, 10);
      rect(370, 800, 40, 10);
      rect(420, 800, 40, 10);
      popMatrix();
      break;
    case 0:
      pushMatrix();
      noFill();
      stroke(#03F6FC);
      rect(220, 800, 40, 10);
      rect(270, 800, 40, 10);
      rect(320, 800, 40, 10);
      rect(370, 800, 40, 10);
      rect(420, 800, 40, 10);
      popMatrix();
      break;
    }
  }
}