import beads.*;
import org.jaudiolibs.beads.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Visualizer menuVi;

String[] songList = new String[3];
String song1 = "Tongue Tied (Instrumental Version) copy.mp3";
String song2 = "Coldplay - Adventure Of A Lifetime Instrumental.mp3";  
String song3 = "Crypt_of_the_NecroDancer_OST_-_Tombtorial_(Tutorial).mp3";

Boolean songChosen = false;


void setup() {
  //fullScreen();
  surface.setResizable(true);
  size(480, 852);
  //initBeat();
  frameRate(60);
  noiseDetail(8);
  songList[0] = song1;
  songList[1] = song2;
  songList[2] = song3;
  menuVi = new Visualizer();
  initMusic();
  gameStates();
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
      state = 3;
    } else if (key == 'o') {
      state = 1;
    }
  }
}