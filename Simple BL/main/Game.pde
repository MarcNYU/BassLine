void Game() {
  //println(frameRate);
  if (!start) {
    //mp3.play();
  }
  if (b.pos.x < left || b.pos.x > right) {
    input();
  }
  translate(-c.pos.x, c.pos.y);
  b.update();
  drawBG();
  c.drawC();
  translate(c.pos.x, -c.pos.y);
  drawFG();
  b.render();
}
void resetGame(){
    surface.setResizable(true);
    
    initMusic();
    initGame();
    //c.pos.x = 0;
    //c.pos.y = 0;
    //translate(c.pos.x, c.pos.y);
    score = 0;
}

void drawFG() {
  if (!start) {
    ns.drawNoteSheet();
  }
  DrawLines();
  classicVi.drawEQ();
  classicVi.drawBeat();
  //drawGuides();
}


void drawBG() {
  drawHeights();
}