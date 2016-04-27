float [] j = new float [50];
float [] k = new float [50];


class Ball {
  PVector pos;
  PVector velo;

  int dir;
  int currentPlatform;

  float bounce;
  float radius;

  boolean alive;
  int bColor;


  Ball (float x, float y, float r) {
    pos = new PVector(x, y); //Vec2 of x and y position
    velo = new PVector(0, 0); //Vec2 of x and y velocity
    currentPlatform = 1;
    dir = 1; 
    bounce = 8; 
    radius = r;
    alive = true;
    //bColor = (int)(random(1, 3));
    bColor = 1;
    for (int i = 0; i<50; i++) {
      j[i] = -10;
      k[i] = -10;
    }
  }

  void update() {
    //pos.y-=move;
    if (delay == true && currentTime < destTime)
    {
      currentTime++;
    } else {
      delay = false;
      pos.x += velo.x;
      pos.y += velo.y;

      if (frozen == true)
        freeze();
      if (increase == true)
        increaseSize();
      if ( pos.y > ground && secLifeOn == true) {
        //println("secLife", pos.y, ground);
        secLifeOn();
      }


      if (start) {
        velo.y = 0;
      } else {
        velo.y += gravity;
      }

      if (pos.x == 40 && jump) {
        if (eRadius >= 52) {
          //if (jump && brightness != 0.0) {
          velo.y = -9;
        } else {
          velo.y = -7;
        }
        velo.x = 13;
      } else if (pos.x == 440 && jump) {
        if (eRadius >= 52) {
          //if (jump && brightness != 0.0) {
          velo.y = -9;
        } else {
          velo.y = -7;
        }
        velo.x = -13;
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
      if (grounded()) {
        //playError();
        //ac.reset();
        state = 2;
        alive = false;
      }
      if (pos.y < ceilling) {
        //if (false) {
        gravity = .6;
      } else {
        if (jump && eRadius >= 52) {
          //if (jump && brightness != 0.0) {
          gravity = .3;
        } else {
          gravity = .4;
          //gravity = .3;//temp
        }
      }

      if (alive && !start) {
        //score += 1;
      }

      //if(pos.x == 40 || pos.x == 440){
      // jump = false; 
      //}
    }
  }

  Boolean grounded() {
    if (pos.y >= ground) return true; //If the ball is below the "ground"
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
    noStroke();
    if (secLifeOn == true)
    {
      stroke( #03F6FC );
      //strokeWeight(2);
      fill(0);
      ellipse(pos.x, pos.y, radius+7, radius+7);
    }
    noStroke();
    if (frozen == false) {
      fill(100, 255, 100);
    } else {
      fill(255);
    }
    //fill (#03FFFD);
    if (pos.x == 40 || pos.x == 440) {
     for (int i=0; i<radius; i++) {
       j[i] = pos.x;
       k[i] = pos.y;
       ellipse (j[i], k[i], radius, radius);
     }
    } else {
     for (int i=0; i<radius; i++) {
       j[i] = j [i+1];
       k[i] = k [i+1];
       ellipse (j[i], k[i], i, i);
     }
    }
    ellipse (pos.x, pos.y, radius, radius);
    //for (int i=0; i<25; i++) {
    // j[i] = j [i+1];
    // k[i] = k [i+1];
    // ellipse (j[i], k[i], i, i);
    //}


    ////Causing the array index error

    //j[25] = pos.x;
    //k[25] = pos.y;
    ellipse (j[25], k[25], radius, radius);
    popMatrix();
  }
  void freeze()
  {
    //println("freeze", currentTime, destTime);

    if (currentTime < destTime )
    {
      frozen = true; 
      currentTime ++;
    } else
    {
      frozen = false;
      hasPowerUp = false;
    }
  }
  void increaseSize()
  {
    //println("increase", currentTime, destTime);

    if (currentTime < destTime )
    {
      radius = increaseRadius; 
      currentTime ++;
    } else
    {
      radius = 25;
      increase = false;
      hasPowerUp = false;
    }
  }
  void secLifeOn()
  {
    currentTime = timer;
    destTime = timer + 50;
    pos.y = 300;
    delay = true;
    secLifeOn = false;
  }
}