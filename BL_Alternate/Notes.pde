float barGap = 50;

class Bar {
  PVector pos;
  PVector dim;
  
  Bar(float x, float y, float w, float h) {
    pos = new PVector(x, y);
    dim = new PVector(w, h);
  }
  
  void drawBar() {
    pushMatrix();
    stroke(255);
    fill(255);
    rect(pos.x, pos.y, dim.x, dim.y);
    popMatrix();
  }
  
  void collidesWithBar() {
    if (b.pos.x > pos.x - dim.y/2 && b.pos.x < pos.x + dim.y/2 && b.pos.y < pos.y - dim.x && b.pos.y > pos.y + dim.x)
      println("GAMEOVER");
  }
}


void makeBars() {
  for (int i = 0; i < bars.length; i++) {
    bars[i] = new Bar(width-40, barGap, 0, 25);
    barGap += 10;
  }
}

void drawBars() {
  for (int i = 0; i < bars.length; i++) {
    bars[i].drawBar();
  }
}