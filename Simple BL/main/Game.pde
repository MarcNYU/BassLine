void Game() {
  println(frameRate);
  if (!start) {
    
    musicQueue[currentSongIdx].play();
  }
  input();
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
    c.pos.x = 0;
    c.pos.y = 0;
    translate(c.pos.x, c.pos.y);
    score = 0;
}

void changeMusic(int newIdx){
  println("current index" + currentSongIdx); 
   musicQueue[currentSongIdx].close();
  if(newIdx < musicQueue.length -1){
    currentSongIdx = newIdx;
    musicQueue[currentSongIdx].play();
  }
  
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