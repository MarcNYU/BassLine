float barGap = UY;




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

  void collidesWithBall(int wall)
  {
    //println( pos.x, pos.y, " b.pos.x: ", b.pos.x, ", b.pos.y: ", b.pos.y );
    // wall = 0: left; wall = 1: right

    switch(wall)
    {
    case 0:
      if (pos.x < b.pos.x && pos.y < b.pos.y && pos.y + dim.y > b.pos.y)
      {
        //println("Game Over: hit right");
        b.hp -= 1;
      }
      break;
    case 1:
      if (pos.x + dim.x > b.pos.x && pos.y < b.pos.y && pos.y + dim.y > b.pos.y)
      {
        //println("Game Over: hit left");
        b.hp -= 1;
      }
      break;
    /*case 2:
      if (height - dim.x < t1.pos.y && width/2 + dim.y > t1.pos.x && width/2 + dim.y < t1.pos.x + 50 &&  b.pos.x > t1.pos.x && b.pos.x < t1.pos.x + 50 && b.pos.y > 680)
      {
        println("Game Over: hit bottom");
      }
      break;
    case 3:

      if ( height - dim.x < t2.pos.y && width/2 + dim.y > t2.pos.x && width/2 + dim.y < t2.pos.x + 50 &&  b.pos.x > t2.pos.x && b.pos.x < t2.pos.x + 50 && b.pos.y > 680)
      {
        println("Game Over: hit bottom2");
      }
      break;*/
    }
  }
  
}


void makeBars() {
  for (int i = 0; i < rBars.length; i++) {
    rBars[i] = new Bar(width-40, barGap, 0, 25);
    barGap += 50;
  }
  barGap = UY;
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

void checkPlatformAvailability(Bar arr[]) {
  for (int i = 0; i < arr.length; i++) {
    
  }
}