void Game() {
  outt.mute();
  println(frameRate);
  //println(eRadius);
  //println(brightness);
  // mp3.play();

  drawStringL();
  drawStringR();

  if (!start) {
    mp3.play();
  }
  if (b.pos.x < left || b.pos.x > right) {
    input();
  }
  td.detectTempo();

  if (!start) {
    ns.drawNoteSheet();
  }  

  classicVi.drawEQ();  
  if (td.getTempo() == 1) {
    beat.reset();
  }
  beat.draw();
  //classicVi.drawBeat();

  b.update();
  b.render();



  //drawGuides();
  //b.update();
  //drawFG();
  //DrawLines();
  //translate(-c.pos.x, c.pos.y);
  //translate(-c.pos.x, height-300);

  ////drawBG();
  //c.drawC();
  //translate(c.pos.x, -b.pos.y);
  //drawGuides();
  ////b.update();
  ////drawFG();
  //DrawLines();
  //b.render();
  //if (!start) {
  // ns.drawNoteSheet();
  //}
  //drawBeat();
}

void playError() {
  //error = true;
  //if(error){
  // // add the sine generator as an input to the Gain
  //  g.addInput(sine);

  // // ramp the frequency up to 2000Hz over 1000 ms
  // frequencyEnvelope.addSegment(2000.0f, 10.0f);
  // error = false;
  //}
  g.addInput(carrier);
  ac.out.addInput(g);
}

void resetGame() {
  //println("game reset");
  g = new beads.Gain(ac, 2, 0.2);
  surface.setResizable(true);
  //ac.reset();
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
  drawHeights();
}