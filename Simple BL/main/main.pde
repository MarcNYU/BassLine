import beads.*;
import org.jaudiolibs.beads.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Visualizer menuVi;

String[] songList = new String[5];
String song1 = "Tongue Tied (Instrumental Version) copy.mp3";
String null1 = "";
String song2 = "Coldplay - Adventure Of A Lifetime Instrumental.mp3";
String null2 = "";
String song3 = "Crypt_of_the_NecroDancer_OST_-_Tombtorial_(Tutorial).mp3";
String null3 = "";

Boolean songChosen = false;


void setup() {
  //fullScreen();
  surface.setResizable(true);
  size(480, 852);
  //initBeat();
  frameRate(60);
  noiseDetail(8);
  songList[0] = song1;
  songList[1] = null1;
  songList[2] = song2;
  songList[3] = null2;
  songList[4] = song3;
  menuVi = new Visualizer();
  initMusic();
  gameStates();
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