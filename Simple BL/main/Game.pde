Glide gainGlide;

void Game() {
  //outt.mute();
  println(frameRate);
  //println(eRadius);
  //println(brightness);
  gainGlide.setValue(mouseX / (float)width);
  mp3.play();
  mp3.mute();
  //if (!start) {
  //  mp3.play();
  //}
  if (b.pos.x == left || b.pos.x == right) {
    input();
  } 
  if (!startOfGame) {
    ns.drawNoteSheet();
  }
  classicVi.drawEQ();
  //classicVi.drawBeat();
  input();
  check();
  b.update();
  drawGuides();
  drawStringL();
  drawStringR();
  drawBeat();
  b.render();
  drawFG();
}

void resetGame() {
  println("game reset");
  //g = new beads.Gain(ac, 2, 0.2);
  surface.setResizable(true);
  ac.reset();
  initMusic();
  initGame();
  c.pos.x = 0;
  c.pos.y = 0;
  translate(c.pos.x, c.pos.y);
  score = 0;
}

void drawFG() {
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
  textSize(30);
  fill(100, 255, 100);
  text("Percent of Song Completed: " + round(score * 100) + "%", 20, 35);
  if (secLifeOn) {
   text("Extra Life", width-150, 35);
  }
  fill(255);
  noStroke();
  ellipse(width/2, height-45, eRadius, eRadius);
  popMatrix();
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
  text("Percent of Song Completed: ", 80, 400);
  text(round(score * 100) + "%", 270, 400);
  
}

void drawBG() {
}