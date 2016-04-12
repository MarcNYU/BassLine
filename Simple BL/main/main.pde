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
    if (key == CODED) {
          if (keyCode == UP) {
                if (b.pos.x == 40 && jump) {
                  if (eRadius >= 65) {
                    b.velo.y = -9;
                    //b.velo.y += -2;
                  } else {
                    b.velo.y = -7;
                    //b.velo.y += -2;
                  }
                  b.velo.x = 11;
                  b.velo.x += 4;
                } else if (b.pos.x == 440 && jump) {
                  if (eRadius >= 65) {
                    b.velo.y = -9;
                   // b.velo.y += -2;
                  } else {
                    b.velo.y = -7;
                    //b.velo.y += -2;
                  }
                  b.velo.x = -11;
                  b.velo.x += -4;
                }
            
          }
          else if (keyCode == DOWN) {
            if (b.pos.x == 40 && jump) {
                  if (eRadius >= 65) {
                    b.velo.y = -9;
                  } else {
                    b.velo.y = -7;
                  }
                  b.velo.x = 11;
                } else if (b.pos.x == 440 && jump) {
                  if (eRadius >= 65) {
                    b.velo.y = -9;
                  } else {
                    b.velo.y = -7;
                  }
                  b.velo.x = -11;
                }
                
            
          }
    }
  }
  
}