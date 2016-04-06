class Ball {
  PVector pos;
  PVector velo;

  int dir;
  int currentPlatform;

  float bounce;
  float radius;

  boolean alive;


  Ball (float x, float y, float r) {
    pos = new PVector(x, y); //Vec2 of x and y position
    velo = new PVector(0, 0); //Vec2 of x and y velocity
    currentPlatform = 1;
    dir = 1; 
    bounce = 8; 
    radius = r;
    alive = true;
  }

  void update() {
    //pos.y-=move;

    pos.x += velo.x;
    pos.y += velo.y;

    if(frozen == true)
      freeze();
    if(increase == true)
      increaseSize();
    if( pos.y > ground && secLifeOn == true){
      println("secLife", pos.y, ground);
      secLifeOn();  
    }

    if (start) {
      velo.y = 0;
    } else {
      velo.y += gravity;
    }



    if (leftB()) {
      lws = 150;
    } else if (rightB()) {
      rws = 150;
    } else {
      float target = 0;
      float dt = target - lws;
      float dl = target - rws;
      lws += dt * 0.3;//ease rate
      rws += dl * 0.3;//ease rate
    }

    if (pos.x == 40 && jump) {
      if (eRadius >= 65) {
        velo.y = -9;
      } else {
        velo.y = -7;
      }
      velo.x = 11;
    } else if (pos.x == 440 && jump) {
      if (eRadius >= 65) {
        velo.y = -9;
      } else {
        velo.y = -7;
      }
      velo.x = -11;
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
      gravity = .1;
    } else if (pos.x == 440) {
      gravity = .1;
    } else {
      gravity = .3;
    }
    if (grounded()) {
      state = 1;
      alive = false;
    }
    if (pos.y < ceilling) {
      gravity = .5;
    } else {
      if (jump && eRadius >= 60) {
        gravity = .3;
      } else {
        gravity = .4;
      }
    }

    if (alive && !start) {
      score += 1;
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
    //stroke(#03F6FC);
    noStroke();
    if (jump && eRadius >= 65) {
      fill(#FFF300);
    } else {
      fill(#03F6FC);
    }
    ellipse(pos.x, pos.y, radius, radius);
    popMatrix();
  }
  
  void freeze()
  {
    //println("freeze", currentTime, destTime);

    if(currentTime < destTime )
    {
      frozen = true; 
      currentTime ++; 
    }
    else
    {
      frozen = false;
      hasPowerUp = false;
    }
  }
  void increaseSize()
  {
    //println("increase", currentTime, destTime);
   
    if(currentTime < destTime )
    {
      radius = increaseRadius; 
      currentTime ++; 
    } 
    else
    {
      radius = 25;
      increase = false;
      hasPowerUp = false;
    }
  }
  void secLifeOn()
  {
    println("secLife", pos.y, ground);

      pos.y = 500;
      secLifeOn = false;
  }
}