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
  textSize(40);
  fill(100, 255, 100);
  text("Score: ", 20, 35);
  fill(255);
  noStroke();
  ellipse(width/2, height-45, eRadius, eRadius);
  popMatrix();
}


void drawBG() {
}