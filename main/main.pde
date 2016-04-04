import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

void setup() {
  //fullScreen();
  surface.setResizable(true);
  size(640, 900);
  frameRate(60);
  noiseDetail(8);
  PlayTest = true;
  initGame();
}

void draw() {
  background(0);
  if (PlayTest) {
    GameMode();
  } else {
    //GameMode();
    DebugMode();
  }
}