void setup() {
  surface.setResizable(true);
  size(550, 850);
  noiseDetail(8);
  initBeatDetector();
  initString();
}

void draw() {
  background(0);
  outt.mute();
  //drawGuides();
  drawLines();
  drawStringL();
  drawStringR();
  drawBeatDector();
  //frameRate(30);
  println(frameRate);
  //checkLines();
  checkEllipse();
  println(check);
}

void playGame() {
  
}