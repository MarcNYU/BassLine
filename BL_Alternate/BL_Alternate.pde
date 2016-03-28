import ddf.minim.*;
import ddf.minim.signals.*; 
import ddf.minim.analysis.*;

void setup() {
  size(640, 900);
  noiseDetail(8);
  //frameRate(60);
  started = false;
  selection = false;
  initGame();
}

void draw() {
  canPlay = true;
  background(0);
  handleInputs();
  b.update();
  b.render();
  DrawLines();
  classicVi.drawEQ();
  mp3.play();
  if (consol) {
    debug();
  }
  b.DrawHP();
}

void keyPressed()
{
  if (key == ESC)
  {
    started = false; //kills the program 
    mp3.pause();
  }
  
  if (key == DELETE || key == BACKSPACE) {
    consol = true;
  }
}