void Game() {
  //println(frameRate);
  println(eRadius);
  if (!start) {
    mp3.play();
  }
  if (b.pos.x < left || b.pos.x > right) {
    input();
  } 
  if (!start) {
   ns.drawNoteSheet();
  }
  classicVi.drawEQ();
  //classicVi.drawBeat();
  drawBeat();
  b.update();
  b.render();
  //translate(-c.pos.x, c.pos.y);
  translate(-c.pos.x, height-300);

  drawBG();
  c.drawC();
  translate(c.pos.x, -b.pos.y);
  drawGuides();
  //b.update();
  //drawFG();
  DrawLines();
  //b.render();
   //if (!start) {
   // ns.drawNoteSheet();
  //}
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
  drawBeat();
  //drawGuides();
}


void drawBG() {
  drawHeights();
}