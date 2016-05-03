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
Float fadeValue2;
Boolean timerStart; 
Integer failTimer;
Boolean failing;
Boolean hitFloor;

Boolean playtest;

String[] songList = new String[4];
String song1 = "I Heard It Through The Grapevine vs. Feel Good Inc.mp3";
String song2 = "Major Lazer & DJ Snake - Lean On .mp3";  
String song3 = "Twenty One Pilots - Stressed Out Audio Only.mp3";
String song4 = "SKRILLEX - BANGARANG (FT. SIRAH).mp3";


Integer[] songRuntimes = new Integer[4];

//full length runtime

//Integer sLen1 = 180000 + 42000;//00:03:42 = (180,000 + 42000)
//Integer sLen2 = 120000 + 58000;//00:02:58 = (120,000 + 58000)
//Integer sLen3 = 180000 + 20000;//00:03:20 = (180,000 + 20000)
//Integer sLen4 = 180000 + 44000;//00:03:36 = (180,000 + 36000)

//Abridged Versions

Integer sLen1 = 60000; //+ 42000;//00:03:42 = (180,000 + 42000)
Integer sLen2 = 60000;// + 58000;//00:02:58 = (120,000 + 58000)
Integer sLen3 = 60000 ;//+ 20000;//00:03:20 = (180,000 + 20000)
Integer sLen4 = 60000; //+ 44000;//00:03:36 = (180,000 + 36000)

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
  songList[3] = song4;
  songRuntimes[0] = sLen1;
  songRuntimes[1] = sLen2;
  songRuntimes[2] = sLen3;
  songRuntimes[3] = sLen4;
  ac = new AudioContext();
  volume = 1;
  gameStates();
  initGame();
  initString();
  initRipples();
  fadeValue = 255.0;
  fadeValue2 = 0.0;
  timerStart = false;
  failTimer = 0;
  failing = false;
  hitFloor = false;
  playtest = true;
  //background(0);
}

void draw() {
  background(0);
  outt.mute();
  if( ac.getTime() > songRuntimes[currentSongIdx] && !startOfGame){
       //songEnded = false;
     //else if( ac.getTime() > 5000){    
      // println("song ended");
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