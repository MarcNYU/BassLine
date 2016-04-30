import beads.*;
import org.jaudiolibs.beads.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

AudioContext ac; // create our AudioContext
AudioContext ac2;

Float fadeValue;
Boolean timerStart; 
Integer failTimer;
Boolean failing;

String[] songList = new String[3];
String song1 = "Tongue Tied (Instrumental Version) copy.mp3";
String song2 = "Coldplay - Adventure Of A Lifetime Instrumental.mp3";  
String song3 = "Twenty One Pilots - Stressed Out (Tomsize Remix).mp3";

Integer[] songRuntimes = new Integer[3];
Integer sLen1 = 180000 + 43000;//00:03:43 = (180,000 + 43000)
Integer sLen2 = 240000 + 26000;//00:04:26 = (240,000 + 26000)
Integer sLen3 = 180000 + 44000;//00:03:44 = (180,000 + 44000)

Boolean songChosen = false;


void setup() {
  //fullScreen();
  surface.setResizable(true);
  size(480, 852);
  frameRate(60);
  noiseDetail(8);
  songList[0] = song1;
  songList[1] = song2;
  songList[2] = song3;
  songRuntimes[0] = sLen1;
  songRuntimes[1] = sLen2;
  songRuntimes[2] = sLen3;
  ac = new AudioContext();
  
  gameStates();
  initGame();
  initString();
  fadeValue = 255.0;
  timerStart = false;
  failTimer = 0;
  failing = false;

  //background(0);
}

void draw() {
  background(0);
  outt.mute();
  if( ac.getTime() > songRuntimes[currentSongIdx] + 5000 && !startOfGame){
       //songEnded = false;
     //else if( ac.getTime() > 5000){    
       println("song ended");
       state = 4;
      
       
     }
  gameStates();

  if (keyPressed ) {
    if (key == 'd') {
      state = 3;
    } else if (key == 'o') {
      state = 1;
    }
  }
}