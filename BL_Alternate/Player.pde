boolean triggerSpike = false;
boolean choice1 = false;
boolean choice2 = false; //If player jumps right one position
boolean choice3 = false;//If player jumps left one position
boolean choice4 = false;
boolean grounded = false;

float easing = 0.35; //lerps spikes on noise wave
float gravity = 0.2; //for the  ball
float ground = 690 + UY;//center point of ground debug line
float left = 50;//center point of left debug line
float right = 590;//center point of right debug line
float dampen = 0.1;//not being used now

int hpCoord = 200;


class Ball {
  PVector pos;
  PVector velo;

  int hp;
  int dir;
  int currentPlatform;

  float bounce;
  float radius;


  Ball (float x, float y, float r) {
    pos = new PVector(x, y); //Vec2 of x and y position
    velo = new PVector(0, 0); //Vec2 of x and y velocity
    currentPlatform = 1;
    dir = 1; 
    bounce = 8; 
    radius = r;
    hp = 5;
  }

  void update() {
    //Apply Gravity
    //Apply Gravity
    pos.y += velo.y;
    pos.x += velo.x;
    velo.y += gravity;

    if (triggerSpike) {
      if (grounded()) {
        fws = 100;
      } else if (leftB()) {
        lws = 100;
      } else if (rightB()) {
        rws = 100;
      }
    }
    //if the ball is on the bottom wire
    if (grounded()) {
      onGround();
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
    pushMatrix();
    //stroke(#03F6FC);
    noStroke();
    fill(#03F6FC, 255);
    ellipse(pos.x, pos.y, radius, radius);
    popMatrix();
  }

  void DrawHP() {
    switch (hp) {
    case 5:
      pushMatrix();
      fill(#03F6FC);//color of the inside
      stroke(#03F6FC);//color of lines strokes
      //parameters are x,y, width, height
      rect(hpCoord, 820, 40, 10); 
      rect(hpCoord+50, 820, 40, 10);
      rect(hpCoord+100, 820, 40, 10);
      rect(hpCoord+150, 820, 40, 10);
      rect(hpCoord+200, 820, 40, 10);
      popMatrix();
      break;
    case 4:
      pushMatrix();
      fill(#03F6FC);
      stroke(#03F6FC);
      rect(hpCoord, 820, 40, 10); 
      rect(hpCoord+50, 820, 40, 10);
      rect(hpCoord+100, 820, 40, 10);
      rect(hpCoord+150, 820, 40, 10);
      noFill();
      rect(hpCoord+200, 820, 40, 10);
      popMatrix();
      break;
    case 3:
      pushMatrix();
      fill(#03F6FC);
      stroke(#03F6FC);
      rect(hpCoord, 820, 40, 10); 
      rect(hpCoord+50, 820, 40, 10);
      rect(hpCoord+100, 820, 40, 10);
      noFill();
      rect(hpCoord+150, 820, 40, 10);
      rect(hpCoord+200, 820, 40, 10);
      popMatrix();
      break;
    case 2:
      pushMatrix();
      fill(#03F6FC);
      stroke(#03F6FC);
      rect(hpCoord, 820, 40, 10); 
      rect(hpCoord+50, 820, 40, 10);
      noFill();
      rect(hpCoord+100, 820, 40, 10);
      rect(hpCoord+150, 820, 40, 10);
      rect(hpCoord+200, 820, 40, 10);
      popMatrix();
      break;
    case 1:
      pushMatrix();
      fill(#03F6FC);
      stroke(#03F6FC);
      rect(hpCoord, 820, 40, 10); 
      noFill();
      rect(hpCoord+50, 820, 40, 10);
      rect(hpCoord+100, 820, 40, 10);
      rect(hpCoord+150, 820, 40, 10);
      rect(hpCoord+200, 820, 40, 10);
      popMatrix();
      break;
    case 0:
      pushMatrix();
      noFill();
      stroke(#03F6FC);
      rect(hpCoord, 820, 40, 10); 
      rect(hpCoord+50, 820, 40, 10);
      rect(hpCoord+100, 820, 40, 10);
      rect(hpCoord+150, 820, 40, 10);
      rect(hpCoord+200, 820, 40, 10);
      popMatrix();
      break;
    }
  }
}

void onGround() {
  if (choice4) {//p
    println("press p");
    b.velo.y = -4.5;
    b.velo.x = 5;
  } else if (choice2) {//w
    println("press w");
    b.velo.y = -5.5;
    b.velo.x = 4;
  } else if (choice3) {//o
    b.velo.y = -5.5;
    b.velo.x = -4;
  } else if (choice1) {//q
    b.velo.y = -4.5;
    b.velo.x = -5;
  } else {
    b.velo.y = 0;
    b.velo.x = 0;
  }
}