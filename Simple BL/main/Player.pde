float ground = 785;
float left = 50;
float right = 430;
boolean jump;
float gravity = .3;

class Ball {
  PVector pos;
  PVector velo;

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
  }

  void update() {
    //pos.y-=move;

    pos.x += velo.x;
    pos.y += velo.y;

    if (pos.y <= height-200) {
      velo.y += gravity;
    } else {
      velo.y = 0;
    }

    if (leftB()) {
      lws = 100;
    } else if (rightB()) {
      rws = 100;
    } else {
      float target = 0;
      float dt = target - lws;
      float dl = target - rws;
      lws += dt * 0.35;//ease rate
      rws += dl * 0.35;//ease rate
    }

    if (pos.x == 40 && jump) {
      velo.x = 8;
      velo.y = -10;
    } else if (pos.x == 440 && jump) {
      velo.x = -8;
      velo.y = -10;
    }

    if (pos.x < 40) {
      velo.x = 0;
      velo.y = 0;
      pos.x = 40;
    } else if (pos.x > 440) {
      velo.x = 0;
      velo.y = 0;
      pos.x = 440;
    } 

    if (pos.x == 40) {
      gravity = .05;
    } else if (pos.x == 440) {
      gravity = .05;
    } else {
      gravity = .3;
    }
  }

  Boolean grounded() {
    if (pos.y <= ground+1 && pos.y >= ground-1) return true; //If the ball is between the positions right above and below the "ground"
    return false;
  }

  Boolean leftB() {
    if (pos.x <= left+2 && pos.x >= left-2) return true;
    return false;
  }

  Boolean rightB() {
    if (pos.x <= right+2 && pos.x >= right-2) return true;
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
}