Spike s[];

class Spike {
  PVector pt1;
  PVector pt2;
  PVector pt3;
  
  Spike(float x1, float y1, float x2, float y2, float x3, float y3) {
    pt1 = new PVector(x1, y1);
    pt2 = new PVector(x2, y2);
    pt3 = new PVector(x3, y3);
  }
  
  void drawSpike() {
    pushMatrix();
    stroke(255);
    fill(255);
    triangle(pt1.x, pt1.y, pt2.x, pt2.y, pt3.x, pt3.y);
    popMatrix();
  }
  
}

class Bar {
  PVector pos;
  PVector dem;
  
  Bar(float x, float y, float w, float h) {
    pos = new PVector(x, y);
    dem = new PVector(w, h);
  }
  
  void drawBar() {
    pushMatrix();
    stroke(255);
    fill(255);
    rect(pos.x, pos.y, dem.x, dem.y);
    popMatrix();
  }
  
  void collidesWithBar() {
    if (b.pos.x > pos.x - dem.y/2 && b.pos.x < pos.x + dem.y/2 && b.pos.y < pos.y - dem.x && b.pos.y > pos.y + dem.x)
      println("GAMEOVER");
  }
}


void makeSpikes() {
  for (int i = 0; i < spikes.length; i++) {
    spikes[i] = new Spike(0, 0, 0, 0, 0, 0);
  }
}