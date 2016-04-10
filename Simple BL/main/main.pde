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
  frameRate(60);
  noiseDetail(8);
  initMusic();
  initGame();
  println("current Song: " + musicQueue[currentSongIdx].name );
  
  
  //println(state
  
}

void draw() {
  background(0);
  gameStates();
  if(!musicPaused && !(musicQueue[currentSongIdx].musicFile.isPlaying())){ 
      // musicQueue[currentSongIdx = (currentSongIdx + 1) % musicQueue.length].play();
  }
  if (keyPressed ) {
    if (key == 'd') {
      state = 2;
    } else if (key == 'o') {
      state = 0;
    }
    
  }
}