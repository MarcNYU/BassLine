import beads.*;
import org.jaudiolibs.beads.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


void setup() {
  //fullScreen();
  surface.setResizable(true);
  size(480, 852);
  //initBeat();
  frameRate(60);
  noiseDetail(8);
  initMusic();
  initBeat();
  initGame();
  initLine();

  //background(0);
}

void draw() {
  background(0);
  gameStates();

  if (keyPressed ) {
    if (key == 'd') {
      state = 2;
    } else if (key == 'o') {
      state = 0;
    }
  }
}