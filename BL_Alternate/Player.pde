boolean triggerws = false;
boolean LWallJump = false;
boolean RJump = false; //If player jumps right one position
boolean LJump = false;//If player jumps left one position
boolean RWallJump = false;
boolean grounded = false;

float easing = 0.35; //lerps spikes on noise wave
float gravity = 0.2; //for the  ball
float ground = 690;//center point of ground debug line
float left = 50;//center point of left debug line
float right = 590;//center point of right debug line
float dampen = 0.1;//not being used now

class Ball {
  PVector pos;
  PVector velo;

  int hp;
  int dir;

  float bounce;
  float radius;


  Ball (float x, float y, float r) {
    pos = new PVector(x, y); //Vec2 of x and y position
    velo = new PVector(0, 0); //Vec2 of x and y velocity
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

    if (triggerws) {
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

void onGround() {
  if (RWallJump) {//p
    println("press p");
    b.velo.y = -4.5;
    b.velo.x = 5;
  } else if (RJump) {//w
    println("press w");
    b.velo.y = -5.5;
    b.velo.x = 4;
  } else if (LJump) {//o
    b.velo.y = -5.5;
    b.velo.x = -4;
  } else if (LWallJump) {//q
    b.velo.y = -4.5;
    b.velo.x = -5;
  } else {
    b.velo.y = 0;
    b.velo.x = 0;
  }
}