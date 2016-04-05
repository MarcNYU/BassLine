void Game() {
  println(frameRate);
  mp3.play();
  input();
  translate(-c.pos.x, c.pos.y);
  b.update();
  drawBG();
  c.drawC();
  translate(c.pos.x, -c.pos.y);
  drawFG();
  b.render();
}

void drawFG() {
  ns.drawNoteSheet();
  DrawLines();
  classicVi.drawEQ();
  classicVi.drawBeat();
  //drawGuides();
}


void drawBG() {
  drawHeights();
}