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
  
  
  void collidesWithBall(int wall)
  {
    //println( pos.x, pos.y, " b.pos.x: ", b.pos.x, ", b.pos.y: ", b.pos.y );
    // wall = 0: left; wall = 1: right
    
    switch(wall)
    {
      case 0:
        if(pos.x < b.pos.x && pos.y < b.pos.y && pos.y + dem.y > b.pos.y)
        {
          println("Game Over: hit right");
        }
        break;
      case 1:
        if(pos.x + dem.x > b.pos.x && pos.y < b.pos.y && pos.y + dem.y > b.pos.y)
        {
          println("Game Over: hit left");
        }
        break;
      case 2:
        if(height - dem.x < t1.pos.y && width/2 + dem.y > t1.pos.x && width/2 + dem.y < t1.pos.x + 50 &&  b.pos.x > t1.pos.x && b.pos.x < t1.pos.x + 50 && b.pos.y > 680)
        {
          println("Game Over: hit bottom");
        }
        break;
      case 3:
        
        if( height - dem.x < t2.pos.y && width/2 + dem.y > t2.pos.x && width/2 + dem.y < t2.pos.x + 50 &&  b.pos.x > t2.pos.x && b.pos.x < t2.pos.x + 50 && b.pos.y > 680)
        {
          println("Game Over: hit bottom2");
        }
        break;
    } //<>//
  }
}