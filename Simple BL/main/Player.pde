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


  Ball (float x, float y, float r) {
    pos = new PVector(x, y); //Vec2 of x and y position
    velo = new PVector(0, 0); //Vec2 of x and y velocity
    currentPlatform = 1;
    dir = 1; 
    bounce = 8; 
    radius = r;
    alive = true;
    for (int i = 0; i<50; i++) {
      j[i] = 0;
      k[i] = 0;
    }
  }

  void update() {
    //pos.y-=move;

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
      //if (eRadius >= 52) {
        if (jump && brightness != 0.0) {
        velo.y = -9;
      } else {
        velo.y = -7;
      }
      velo.x = 13;
    } else if (pos.x == 440 && jump) {
      //if (eRadius >= 52) {
        if (jump && brightness != 0.0) {
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
      state = 1;
      alive = false;
    }
    if (pos.y < ceilling) {
    //if (false) {
      gravity = .6;
    } else {
      //if (jump && eRadius >= 60) {
      if (jump && brightness != 0.0) {
        gravity = .3;
      } else {
        gravity = .4;
        //gravity = .3;//temp
      }
    }

    if (alive && !start) {
      score += 1;
    }
    
    //if(pos.x == 40 || pos.x == 440){
    // jump = false; 
    //}
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
  
  Boolean leftW() {
    if (pos.x <= lw+5 && pos.x >= lw-5) return true;
    return false;
  }

  Boolean rightW() {
    if (pos.x <= rw+5 && pos.x >= rw-5) return true;
    return false;
  }

  void render() {
    pushMatrix();
    noStroke();
    if(secLifeOn == true)
    {
       stroke( #03F6FC );
       strokeWeight(2);
       fill(0);
       ellipse(pos.x, pos.y, radius+7, radius+7);
    }
    noStroke();
    if(frozen == false){
      if (jump && eRadius >= 65) {
        fill(#FFF300);
      } else {
        fill(#03F6FC);
      }
    }
    else {
      fill(255);
    }
    //fill (#03FFFD);
    //if (pos.x == 40 || pos.x == 440) {
    //  for (int i=0; i<radius; i++) {
    //    j[i] = pos.x;
    //    k[i] = pos.y;
    //    ellipse (j[i], k[i], radius, radius);
    //  } 
    //} else {
    //  for (int i=0; i<radius; i++) {
    //    j[i] = j [i+1];
    //    k[i] = k [i+1];
    //    ellipse (j[i], k[i], i, i);
    //  }
    //}
    for (int i=0; i<25; i++) {
        j[i] = j [i+1];
        k[i] = k [i+1];
        ellipse (j[i], k[i], i, i);
      }
    j[25] = pos.x;
    k[25] = pos.y;
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
    //println("secLife", pos.y, ground);

    pos.y = 500;
    secLifeOn = false;
  }
}