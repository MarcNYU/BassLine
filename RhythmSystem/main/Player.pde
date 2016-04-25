float [] j = new float [50];
float [] k = new float [50];
boolean startOfGame = true;

class Player {
  PVector pos;
  PVector velo;

  float gravity = .3;

  float radius = 25;
  int score;
  int bounceCounter;
  int bonusCap = 20;

  int currentTime = 0;
  int destTime = 0;

  boolean alive;
  boolean jump;
  boolean frozen;

  Player (float x, float y) {
    pos = new PVector(x, y);
    velo = new PVector(0, 0);
    alive = true;
    jump = false;
    frozen = false;
    score = 0;
    bounceCounter = 0;
    for (int i = 0; i<50; i++) {
      j[i] = 0;
      k[i] = 0;
    }
  }
  void update() {
    BaseLine();
    pos.x += velo.x;
    pos.y += velo.y;

    if (startOfGame) {
      velo.y = 0;
    } else {
      velo.y += gravity;
    }
    if (frozen) {
      freeze();
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
    if (jump && check) {
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
    }
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
    showMultiplier();
    noStroke();
    showFrozen();
    showTrail();
    drawPlayer();
  }
  void showMultiplier() {
    noStroke();
    if (bounceCounter > 1) {
      stroke( #03F6FC );
      strokeWeight(2);
      fill(0);
      ellipse(pos.x, pos.y, radius+7, radius+7);
    }
  }
  void showFrozen() {
    if (frozen == false) {
      fill(#03F6FC);
    } else {
      fill(255);
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