float barGap = 0;

class Bar {
  PVector pos;
  PVector dim;
  
  Bar(float x, float y, float w, float h) {
    pos = new PVector(x, y);
    dim = new PVector(w, h);
  }
  
  void drawBar() {
    //pushMatrix();
    //stroke(255);
    //fill(255);
    rect(pos.x, pos.y, dim.x, dim.y);
    //popMatrix();
  }
  
  void collidesWithBar() {
    if (b.pos.x > pos.x - dim.y/2 && b.pos.x < pos.x + dim.y/2 && b.pos.y < pos.y - dim.x && b.pos.y > pos.y + dim.x)
      println("GAMEOVER");
  }
}


void makeBars() {
  for (int i = 0; i < rBars.length; i++) {
    rBars[i] = new Bar(width-40, barGap, 0, 25);
    barGap += 50;
  }
  barGap = 0;
  for (int i = 0; i < lBars.length; i++) {
    lBars[i] = new Bar(40, barGap, 0, 25);
    barGap += 50;
  }
}

void drawBars() {
  for (int i = 0; i < rBars.length; i++) {
    rBars[i].drawBar();
  }
  for (int i = 0; i < lBars.length; i++) {
    lBars[i].drawBar();
  }
}