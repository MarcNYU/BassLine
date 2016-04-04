void GameMode () {
  background(0); //set background to black
  platforms();
  handleInputs();
  checkCollision();
  //ns.drawNoteSheet();
  //classicVi.drawBEQ(); 
  classicVi.drawWEQ();
  DrawLines();
  mp3.play();
  if (turnoffm) {
    mp3.close();
  }
  b.DrawHP();
  fill(0);
  drawplatforms();
  b.update();
  b.render();
  //highlight platforms that can 
  fill(20, 20, 255);
  for (int i =0; i < 8; i++) {
    if (!(decisionGraph[b.currentPlatform-1][i].isNull)) {
      decisionGraph[b.currentPlatform-1][i].drawP();
    }
  }
}

void checkCollision() {
  for (int i = 0; i < rBars.length; i++) {
    rBars[i].collidesWithBall(0);
    lBars[i].collidesWithBall(1);
  }
  for (int j = 0; j < lBars.length; j++) {
    lBars[j].collidesWithBall(1);
  }
  
}