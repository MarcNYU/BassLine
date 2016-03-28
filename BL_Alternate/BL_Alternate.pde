import ddf.minim.*;
import ddf.minim.signals.*; 
import ddf.minim.analysis.*;

void setup() {
  size(640, 900); //size of the screen
  noiseDetail(8); //
  //frameRate(60);
  started = false; //whether the music has started
  selection = false;
  initGame();
}

void draw() {
  canPlay = true; //if game is in a state where the music can play
  background(0); //set background to black
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