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
  //ll.updateString();
  //ll.drawLine();
  //rl.updateString();
  //rl.drawLine();
  //drawGuides();

  //DrawLines();

  drawBeat();
  //if (jump && b.pos.x < 45) {
  //  drawStringL();
  //} else {
  //  pushMatrix();
  //  stroke(255);
  //  line(40,0,40,height);
  //  popMatrix();
  //}
  //if (jump && b.pos.x > 435) {
  //  drawStringR();
  //} else {
  //  pushMatrix();
  //  stroke(255);
  //  line(440,0,440,height);
  //  popMatrix();
  //}
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