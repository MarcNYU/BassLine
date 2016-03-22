boolean shortHop = false;
boolean hop = false;
boolean jump = false;
boolean superjump = false;

class Ball {
  PVector pos;
  float dir;
  PVector velo;
  float roll;
  float bounce;
  float radius;

  void update() {
    b.pos.x += 2;
    if (b.pos.y < ground) {
      b.pos.y += b.velo.y;
      b.velo.y += gravity;
      if (b.pos.y >= ground-100/2) {
        b.velo.y *= -dampen;
      }
    } else {
      b.velo.y = 0;
    }

    if (b.pos.y >= (ground-50) && shortHop) {
      b.velo.y = -b.bounce + 3;
    }
    if (b.pos.y >= (ground-50) && hop) {
      b.velo.y = -b.bounce + 2;
    }
    if (b.pos.y >= (ground-50) && jump) {
      b.velo.y = -b.bounce + 1.4;
    }
    if (b.pos.y >= (ground-50) && superjump) {
      b.velo.y = -b.bounce + .5;
    }
  }
  
  void render() {
    noStroke();
    fill(255);
    ellipse(b.pos.x, b.pos.y, b.radius, b.radius);
  }
}

void handelInputs() {
  if (keyPressed) {
    //LEFT
    if (key == 'q') {
      shortHop = true;
      if (b.pos.y >= ground-50 && b.pos.y <= ground) {
        spike = 100;
      } else {
        float targetA = 0;
        float dx = targetA - spike;
        spike += dx * 0.35;//ease rate
      }
    }
    if (key == 'w') {
      hop = true;
      if (b.pos.y >= ground-50 && b.pos.y <= ground) {
        spike = 300;
      } else {
        float targetA = 0;
        float dx = targetA - spike;
        spike += dx * 0.3;//ease rate
      }
    }
    //RIGHT
    if (key == 'o') {
      jump = true;
      if (b.pos.y >= ground-50 && b.pos.y <= ground) {
        spike = 600;
      } else {
        float targetA = 0;
        float dx = targetA - spike;
        spike += dx * 0.25;//ease rate
      }
    }
    if (key == 'p') {
      superjump = true;
      if (b.pos.y >= ground-50 && b.pos.y <= ground) {
        spike = 900;
      } else {
        float targetA = 0;
        float dx = targetA - spike;
        spike += dx * 0.2;//ease rate
      }
    }
  }
  if (!keyPressed) {
    //LEFT
    if (key == 'q') {
      //spike = 0;
      shortHop = false;
      float targetA = 0;
      float dx = targetA - spike;
      spike += dx * 0.35;//ease rate
    }
    if (key == 'w') {
      //spike = 0;
      hop = false;
      float targetA = 0;
      float dx = targetA - spike;
      spike += dx * 0.3;//ease rate
    }
    //RIGHT
    if (key == 'o') {
      //spike = 0;
      jump = false;
      float targetA = 0;
      float dx = targetA - spike;
      spike += dx * 0.25;//ease rate
    }
    if (key == 'p') {
      //spike = 0;
      superjump = false;
      float targetA = 0;
      float dx = targetA - spike;
      spike += dx * 0.2;//ease rate
    }
  }
}