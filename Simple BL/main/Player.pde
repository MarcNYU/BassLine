float [] j = new float [50];
float [] k = new float [50];
boolean startOfGame = true;
float gravity = .3;
Ball b;

class Ball {
  PVector pos;
  PVector velo;

  int dir;
  int currentPlatform;

  float bounce;
  float radius;
  //int score;
  int bounceCounter;
  int bonusCap = 20;

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
    bounceCounter = 0;
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


      if (startOfGame) {
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

      if (alive && !startOfGame) {
        score += 1;
      }

      //if(pos.x == 40 || pos.x == 440){
      // jump = false; 
      //}
    }
  }

  boolean TopLine() {
    if (pos.y < ceilling) return true;
    return false;
  }
  boolean BelowMidLine() {
    if (pos.y > middle && pos.y < ground) return true;
    return false;
  }
  boolean AboveMidLine() {
    if (pos.y < middle && pos.y > ceilling) return true;
    return false;
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
    showSecLife();
    noStroke();
    
    noStroke();
    showLastPosition();
    //showTrail();
    noStroke();
    //showFrozen();
    drawPlayer();
  }
  void showSecLife() {
    noStroke();
    if (secLifeOn) {
      stroke( #03F6FC );
      //strokeWeight(2);
      fill(0);
      ellipse(pos.x, pos.y, radius+7, radius+7);
    }
  }
  void showFrozen() {
    if (frozen == false) {
      fill(100, 255, 100);
    } else {
      fill(255);
    }
  }
  void showLastPosition() {
    if (pos.x == 40 || pos.x == 440) {
      for (int i=0; i<radius; i++) {
        j[i] = pos.x;
        k[i] = pos.y;
        if (!(jump && eRadius >= 52)) {
          fill(255, 1, 1);
        } else {
          fill(100, 255, 100);
        }
        ellipse (j[i], k[i], radius, radius);
      }
    } else {
      for (int i=0; i<radius; i++) {
        j[i] = j [i+1];
        k[i] = k [i+1];
        if (!(jump && eRadius >= 52)) {
          fill(255, 1, 1);
        } else {
          fill(100, 255, 100);
        }
        ellipse (j[i], k[i], i, i);
      }
    }
  }
  void showTrail() {
    for (int i=0; i<radius; i++) {
      j[i] = j [i+1];
      k[i] = k [i+1];
      ellipse (j[i], k[i], i, i);
    }
    j[25] = pos.x;
    k[25] = pos.y;
  }
  void drawPlayer() {
    if (frozen == false) {
      fill(100, 255, 100);
    } else {
      fill(255);
    }
    ellipse(pos.x, pos.y, radius+1, radius+1);
  }

  //void render() {
  //  pushMatrix();
  //  noStroke();
  //  if (secLifeOn == true)
  //  {
  //    stroke( #03F6FC );
  //    //strokeWeight(2);
  //    fill(0);
  //    ellipse(pos.x, pos.y, radius+7, radius+7);
  //  }
  //  noStroke();
  //  if (frozen == false) {
  //    fill(100, 255, 100);
  //  } else {
  //    fill(255);
  //  }
  //  //fill (#03FFFD);
  //  if (pos.x == 40 || pos.x == 440) {
  //   for (int i=0; i<radius; i++) {
  //     j[i] = pos.x;
  //     k[i] = pos.y;
  //     ellipse (j[i], k[i], radius, radius);
  //   }
  //  } else {
  //   for (int i=0; i<radius; i++) {
  //     j[i] = j [i+1];
  //     k[i] = k [i+1];
  //     ellipse (j[i], k[i], i, i);
  //   }
  //  }
  //  ellipse (pos.x, pos.y, radius, radius);
  //  //for (int i=0; i<25; i++) {
  //  // j[i] = j [i+1];
  //  // k[i] = k [i+1];
  //  // ellipse (j[i], k[i], i, i);
  //  //}


  //  ////Causing the array index error

  //  //j[25] = pos.x;
  //  //k[25] = pos.y;
  //  ellipse (j[25], k[25], radius, radius);
  //  popMatrix();
  //}
  void manageScore() {
    if (BelowMidLine()) {
      score += 10;
    } else if (AboveMidLine()) {
      score += 30 * bounceCounter;
    } else if (TopLine()) {
      score += 50 * bounceCounter;
    }
  }
  void manageBonusCounter() {
    if (jump && eRadius >= 52 && (pos.x == 40 || pos.x == 440)) {
      noLoop();
      bounceCounter++;
      loop();
    } else {
      bounceCounter = 0;
    }
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
    pos.y = 600;
    delay = true;
    secLifeOn = false;
  }
}