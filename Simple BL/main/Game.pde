void Game() {
  outt.mute();
  println(frameRate);
  //println(eRadius);
  //println(brightness);
  mp3.play();
  mp3.mute();
  //if (!start) {
  //  mp3.play();
  //}
  if (b.pos.x < left || b.pos.x > right) {
    input();
  } 
  if (!start) {
    ns.drawNoteSheet();
  }
  classicVi.drawEQ();
  //classicVi.drawBeat();

  b.update();
  b.render();
  
  //drawGuides();

  //DrawLines();

  drawBeat();

  drawStringL();
  drawStringR();
}

void resetGame() {
  surface.setResizable(true);

  initMusic();
  initGame();
  c.pos.x = 0;
  c.pos.y = 0;
  translate(c.pos.x, c.pos.y);
  score = 0;
}

void drawFG() {
  if (!start) {
    ns.drawNoteSheet();
  }
  DrawLines();
  classicVi.drawEQ();
  //classicVi.drawBeat();
  //drawGuides();
}


void drawBG() {
}