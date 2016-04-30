Glide gainGlide;
BeatDetector bd;    
BeatQueue bq;
int forward = 2000;  // how many milliseconds to look forward

void initGame() {
  b = new Ball(40, height-200, 26);
  //b = new Player(40, height-200);
  score = (int) b.pos.y;
  ll = new Line(-200);
  rl = new Line(200);
}

void initMusic() {
  stroke(255);
  time = millis();
  bd = new BeatDetector(forward);
  bd.loadSong(songList[currentSongIdx]);
  bq = new BeatQueue(bd);
  bd.start();
}

void Game() {
  println(frameRate);

  //gainGlide.setValue(mouseX / (float)width);

  if (b.pos.x == left || b.pos.x == right) {
    input();
  } 
  input();
  check();
  b.update();
  drawGuides();
  drawStringL();
  drawStringR();
  b.render();
  //seconds = (int)(ac.getTime()/(1000))%60;
  //minutes = (int)(ac.getTime()/1000)/60;
  //score = min(fixDec((float)(ac.getTime()/songRuntimes[currentSongIdx]),2),100);
  drawFG();
}

void resetGame() {
  println("game reset");
  //g = new beads.Gain(ac, 2, 0.2);
  surface.setResizable(true);
  ac.reset();
  ac2.reset();
  initMusic();
  initGame();
  score = 0;
}

void drawFG() {
  //if player is not failing, draw FG normally, otherwise, draw with fade value
  if (!failing) {
    pushMatrix();
    rectMode(CORNER);

    fill(0);
    stroke(255);
    rect(0, 0, width-1, 40);
    rect(-10, height-42, width+10, 40);
    fill(0);
    ellipse(width/2, height-45, 85, 85);
    stroke(0);
    rect(0, height-41, width-1, 38);
    textSize(22);
    fill(100, 255, 100);
    text("Percent Completion: " + round(score * 100) + "%", 20, 35);
    //text("Minutes: " + round(minutes) + " Seconds: " + seconds + " Score: " + score, 20, 35);
    //fill(255);
    //noStroke();
    //ellipse(width/2, height-45, eRadius, eRadius);
    popMatrix();
  } else {
    pushMatrix();
    rectMode(CORNER);

    fill(fadeValue);
    stroke(fadeValue);
    rect(0, 0, width-1, 40);
    rect(-10, height-42, width+10, 40);
    fill(fadeValue);
    ellipse(width/2, height-45, 85, 85);
    stroke(fadeValue);
    rect(0, height-41, width-1, 38);
    textSize(22);
    fill(100, 255, 100, fadeValue);
    text("Percent Completion: " + round(score * 100) + "%", 20, 35);
    //fill(fadeValue);
    //noStroke();
    //ellipse(width/2, height-45, eRadius, eRadius);
    popMatrix();
  }
  
  stroke(255);
  noFill();
  ellipse(width/2, height, width, width);
  int beats[] = bq.nexts(); // returns an array of time of beats
  for (int i = 0; i < beats.length; ++i) {
    int y = width - beats[i] * 110 / forward;
    println(y);
    //int y = beats[i] * height / forward;
    //line (0, y, width, y);
    ellipse(width/2, height, y, y);
  }
  
  int next = bq.next(); // return next beat
  if (next <= 20) {
    eRadius = 85;
  }
  //fill(brightness*255);
  //ellipse(width/2,height/2,100,100); 

  stroke(100, 255, 100);

  ellipse(b.pos.x, b.pos.y, eRadius, eRadius);
  ellipse(b.pos.x, b.pos.y, eRadius-1, eRadius-1);

  int dt = millis() - time;
  eRadius -= (dt * 0.2);
  //eRadius += (dt * 0.1);
  if (eRadius < 20) eRadius = 20;
  //if (eRadius > 85) eRadius = 85;
  time += dt;
}



void drawScore(int minutes, int seconds) {
  //textSize(15);
  //fill(255);
  //float high = highLevCount * score;
  //float mid = midLevCount * score;
  //float bottom = bmLevCount * score;
  //text("High Level Points: " , 80, 300);
  ////text(" x 50 = ", 250, 300);
  //text( high, 350, 300);

  //text("Mid Level Points: " , 80, 350);
  ////text(" x 30 = ", 250, 350);
  //text( mid  , 350, 350);

  //text("Bottom Level Points: " , 80, 450);
  ////text(" x 30 = ", 250, 450);
  //text( bottom , 350, 450);
  //score = bottom  + mid + high;
  //text("Time in Song: ", 80, 240);
  //text( minutes  + ":" + seconds , 350, 240);
  //stroke(255);
  //line(40, 470, width-40, 470);

  //text("Final Score: ", 80, 550);
  //text(score, 350, 550);
  ////text(" x 10 = ", 250, 400);
  ////text( score, 350, 400);


  text("Time in Song: " + minutes  + ":" + seconds, 80, 300);
  //text(" x 10 = ", 250, 400);
  //text( score, 350, 400);

  //stroke(255);
  //line(40, 450, width-40, 450);
  text("Percent Completion: ", 80, 400);
  text(round(score * 100) + "%", 270, 400);
}

void drawBG() {
}

void input() {
  if (keyPressed) {
    //if(key == 'b' && eRadius > 60) {
    if ((key == ' ' || key == 'b')) {
      jump = true;
      startOfGame = false;
    }
  } else {
    jump = false;
  }
}

void keyPressed() {
  if (key == ESC) {
    //sp.close();
  }
}

void keyReleased() {
  jump = false;
  releasedKey = true;
  upPressed = false;
  downPressed = false;
}

void check() {
  if (!b.leftB() && !b.rightB() && jump) {
    gravity = .6;
  } else {
    if (b.pos.y < ceilling) {
      gravity = .65;
    } else {
      gravity = .4;
    }
  }
}