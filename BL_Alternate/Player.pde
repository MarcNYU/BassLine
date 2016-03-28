boolean triggerSpike = false;
boolean LWallJump = false;
boolean RJump = false;
boolean LJump = false;
boolean RWallJump = false;
boolean grounded = false;

class Ball {
  PVector pos;
  PVector velo;

  int hp;
  int dir;

  float bounce;
  float radius;


  Ball (float x, float y, float r) {
    pos = new PVector(x, y);
    velo = new PVector(0, 0);
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
    velo.y += gravity;
    
    if (triggerSpike) {
      spike = 100;
    }
    
    if (grounded()) {
      //println("yes");
      if (RJump) {//w
        velo.y = -5.5;
        //velo.x = 4;
        println("w: " + pos.x + ", " + pos.y);
      } else {
        velo.y = 0;
        velo.x = 0;
      }
      if (LJump) {//o
        velo.y = -5.5;
        //velo.x = -4;
        println("o: " + pos.x + ", " + pos.y);
      } else {
        velo.y = 0;
        velo.x = 0;
      }
      if (LWallJump) {//q
        velo.y = -4.5;
        //velo.x = -5;
        println("q: " + pos.x + ", " + pos.y);
      } else {
        velo.y = 0;
        velo.x = 0;
      }
      if (RWallJump) {//p
        velo.y = -4.5;
        //velo.x = 5;
        println("p: " + pos.x + ", " + pos.y);
      } else {
        velo.y = 0;
        velo.x = 0;
      }
    }
  }

  Boolean grounded() {
    if (pos.y <= ground+1 && pos.y >= ground-1) return true;
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
      fill(#03F6FC);
      stroke(#03F6FC);
      rect(220, 800, 40, 10); 
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