import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

boolean turnoff = false;
boolean turnoffm = false;

void setup() {
  //ortho();
  
  size(640, 900); //size of the screen
  //ortho(-width, width, -height*2, height*2);
  //translate(width/2, -height/2, 0);
  //surface.setResizable(true);
  noiseDetail(8); //
  //frameRate(1);
  started = false; //whether the music has started
  selection = false;
  initGame();
}

void draw() {
  canPlay = true; //if game is in a state where the music can play
  background(0); //set background to black
  triggers();
  handleInputs();
  checkCollision();
  if (!consol && !turnoff) {
    ns.drawNoteSheet();
  }
  DrawLines();
  
  //delay(60);
  //classicVi.drawBEQ(); 
  classicVi.drawWEQ();
  mp3.play();
  if (consol) {
    debug();
    mp3.close();
    b.hp = 3;
  }
  if (turnoffm) {
    mp3.close();
  }
  b.DrawHP();
  drawTriggers();
  //triggers();
  //drawArc();
  b.update();
  b.render();
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
  
  if (key == TAB) {
    turnoff = true;
  }
  if (key == SHIFT) {
    turnoff = true;
  }
}