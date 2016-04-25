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
  //b.setTime(13);
  if (b.pos.x < left || b.pos.x > right) {
    input();
  } 
  if (!start) {
    //ns.drawNoteSheet();
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