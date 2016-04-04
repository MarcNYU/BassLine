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
    pct += step; //increase the percentage of the curve that is currently done by step
    if (pct <= 1.0) {
      pos.x = beginX + (pct * distX);
      pos.y = beginY + (pow(pct, exponent) * distY);
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