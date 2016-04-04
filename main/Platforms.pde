class Platform { //platforms to jump between
  PVector pos;
  PVector dim;
  Boolean isNull;
  int platformIdx;

  Platform(float x, float y, float w, float h) {
    pos = new PVector(x, y);
    dim = new PVector(w, h);
    isNull = false;
    platformIdx = 0;
  }

  void drawP() {
    pushMatrix();
    rectMode(CENTER);
    stroke(255);
    //fill(0);
    rect(pos.x, pos.y, dim.x, dim.y);
    popMatrix();
  }
}

void platforms() {//hard coded platfomrs
  t1.platformIdx = 1;
  t2.platformIdx = 2;
  t3.platformIdx = 3;
  t4.platformIdx = 4;
  t5.platformIdx = 5;
  t6.platformIdx = 6;
  t7.platformIdx = 7;
  t8.platformIdx = 8;
  tNull.isNull = true;

  t[0] = t1;
  t[1] = t2;
  t[2] = t3;
  t[3] = t4;
  t[4] = t5;
  t[5] = t6;
  t[6] = t7;
  t[7] = t8;

  
}

void drawplatforms() {
  for (int i = 0; i < t.length; i++) {
    t[i].drawP(); // draw each platform
  }
}