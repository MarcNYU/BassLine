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
  
  
  //println(state
  
}

void draw() {
  background(0);
  gameStates();
  //Supposed to be used to go to the next song automatically when the currentt one ends
  
  if( !(musicQueue[currentSongIdx].isPlaying())){ 
      //This is the only call to the play function that gets the audio to play. It starts from the second song because of currentSongIdx + 1 which is supposed to be used to play the next song
      //I think this is the only one that works since its running in the draw() function
       musicQueue[currentSongIdx = (currentSongIdx + 1) % musicQueue.length].play();
  }
  if (keyPressed ) {
    if (key == 'd') {
      state = 2;
    } else if (key == 'o') {
      state = 0;
    }
    
  }
}