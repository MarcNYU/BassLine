import beads.*;
import org.jaudiolibs.beads.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

String[] songList = new String[3];
String song1 = "Tongue Tied (Instrumental Version) copy.mp3";
String song2 = "44_Drum_beat_(Rock).mp3";  
String song3 = "Crypt_of_the_NecroDancer_OST_-_Tombtorial_(Tutorial).mp3";

Boolean songChosen = false;


void setup() {
  //fullScreen();
  surface.setResizable(true);
  size(480, 852);
  songList[0] = song1;
  songList[1] = song2;
  songList[2] = song3;
  gameStates();
  
  
  //frameRate(60);
  noiseDetail(8);
  
  initMusic();
  initGame();

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