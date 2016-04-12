void Game() {
  //println(frameRate);
  if (!start) {
    
    musicQueue[currentSongIdx].play();
    
  }
  //input();
  //keyReleased();
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
   musicQueue[currentSongIdx].musicFile.close();
   musicQueue[newIdx].play();
   println("music queue length: " + musicQueue.length); 
  //if(newIdx < musicQueue.length -1){
    currentSongIdx = newIdx;
    //musicQueue[currentSongIdx].play(); 
    println("current Song: " + musicQueue[currentSongIdx].name + "current index: " + currentSongIdx );
    //musicQueue[newIdx].play();
  //}
  
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