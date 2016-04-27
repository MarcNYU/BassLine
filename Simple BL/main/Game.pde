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
    //ns.drawNoteSheet();
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
  if (!startOfGame) {
    ns.drawNoteSheet();
  }
  //DrawLines();
  classicVi.drawEQ();
  //classicVi.drawBeat();
  //drawGuides();
}


void drawBG() {
}