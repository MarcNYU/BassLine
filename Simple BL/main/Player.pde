float [] j = new float [50];
float [] k = new float [50];
boolean startOfGame = true;
float gravity = .3;
Player b;

class Player {
  PVector pos;
  PVector velo;

  float radius = 25;
  int score;
  int bounceCounter;
  int bonusCap = 20;

  int currentTime = 0;
  int destTime = 0;

  boolean alive;
  //boolean jump;
  //boolean frozen;
  //boolean secLifeOn;

  Player (float x, float y) {
    pos = new PVector(x, y);
    velo = new PVector(0, 0);
    alive = true;
    jump = false;
    frozen = false;
    secLifeOn = false;
    score = 0;
    bounceCounter = 0;
    for (int i = 0; i<50; i++) {
      j[i] = -10;
      k[i] = -10;
    }
  }
  void update() {
    BaseLine();
    if (delay && currentTime < destTime) {
      currentTime++;
    } else {
      delay = false;
      pos.x += velo.x;
      pos.y += velo.y;

      if (frozen) {
        freeze();
      } 
      if (pos.y > ground && secLifeOn) {
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
          velo.y = -9;
        } else {
          velo.y = -7;
        }
        velo.x = 13;
      } else if (pos.x == 440 && jump) {
        if (eRadius >= 52) {
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
      if (!alive) {
        state = 2;
      }
      if (pos.y < ceilling) {
        gravity = .6;
      } else {
        if (jump && eRadius >= 52) {
          gravity = .3;
        } else {
          gravity = .4;
          //gravity = .3;//temp
        }
      }
    }
    manageBonusCounter();
    manageScore();
  }
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
    if (jump && eRadius >= 52) {
      noLoop();
      bounceCounter++;
      loop();
    } else {
      bounceCounter = 0;
    }
  }
  void freeze() {
    if (currentTime < destTime ) {
      frozen = true; 
      currentTime ++;
    } else {
      frozen = false;
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
  void BaseLine() {
    if (pos.y > ground) {
      alive = false;
    } else {
      alive = true;
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
  void render() {
    showSecLife();
    noStroke();
    showFrozen();
    showLastPosition();
    //showTrail();
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
        ellipse (j[i], k[i], radius, radius);
      }
    } else {
      for (int i=0; i<radius; i++) {
        j[i] = j [i+1];
        k[i] = k [i+1];
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
    ellipse(pos.x, pos.y, radius, radius);
  }
}