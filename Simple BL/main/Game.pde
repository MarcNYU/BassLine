void Game() {
  //outt.mute();
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
  input();
  b.update();
  drawGuides();
  drawStringL();
  drawStringR();
  drawBeat();
  b.render();
}

void resetGame() {
  println("game reset");
  //gameInit = true;
  //g = new beads.Gain(ac, 2, 0.2);
  surface.setResizable(true);
  ac.reset();
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
  //DrawLines();
  classicVi.drawEQ();
  //classicVi.drawBeat();
  //drawGuides();
}

void drawScore()
{
  textSize(15);
  fill(255);
  text("High Level Time: ", 80, 300);
  text(" x 50 = ", 250, 300);
  text("PlaceholderScore", 250, 300);
  
  text("Mid Level Time: " , 80, 350);
  text(" x 30 = ", 250, 350);
  text("PlaceholderScore", 250, 350);
  
  text("Low Level Time: " , 80, 400);
  text(" x 10 = ", 250, 400);
  text("PlaceholderScore", 250, 400);
  
  stroke(255);
  line(40, 450, width-40, 450);
  text("Final Score: ", 80, 500);
  text("PlaceholderScore", 250, 500);
}


void drawBG() {
}