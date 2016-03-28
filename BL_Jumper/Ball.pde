boolean triggerSpike = false;
boolean LWallJump = false;
boolean RJump = false;
boolean LJump = false;
boolean RWallJump = false;
float spike = 0;

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
  }

  void update() {
    //Apply Gravity
    //Apply Gravity
    //handleInputs();
    //println(pos.y);
    pos.y += velo.y;
    pos.x += velo.x;
    velo.y += gravity;

    if (grounded()) {
      onGround() ;
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
}

void keyPressed()
{
  if (b.grounded()) {
    if (key == 'q') {
      LWallJump = true;
      triggerSpike = true;
    } else if (key == 'w') {
      RJump = true;
      triggerSpike = true;
    } else if (key == 'o') {
      LJump = true;
      triggerSpike = true;
    } else if (key == 'p') {
      RWallJump = true;
      triggerSpike = true;
    }
  } else {
    float target = 0;
    float dx = target - spike;
    spike += dx * 0.55;//ease rate
    triggerSpike = false;
  }
}

void keyReleased() {
  triggerSpike = false;
  if (key == 'q' || key == 'Q') {
    LWallJump = false;
  } else if (key == 'w' || key == 'W') {
    RJump = false;
  } else if (key == 'o' || key == 'O') {
    LJump = false;
  } else if (key == 'p' || key == 'P') {
    RWallJump = false;
  }
  float target = 0;
  float dx = target - spike;
  spike += dx * 0.55;//ease rate
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

void onWall() {
}