import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


Visualizer classicVi;
Minim minim;
FFT fft;
AudioOutput out;
AudioPlayer mp3;
BeatDetect beat;
Ball b;
Camera c;
NoteSheet ns;

int move = 0;
int state = 0;

void setup() {
  //fullScreen();
  surface.setResizable(true);
  size(480, 852);
  frameRate(60);
  noiseDetail(8);
  
  b = new Ball(40, height-200, 25);
  c = new Camera();
  minim = new Minim(this); 
  mp3 = minim.loadFile("I'm Gonna Be (500 Miles) - Sleeping At Last Karaoke.mp3", 2048);
  //mp3 = minim.loadFile("Crypt_of_the_NecroDancer_OST_-_Tombtorial_(Tutorial).mp3", 2048);
  out = minim.getLineOut(Minim.STEREO, 44100);
  fft = new FFT(mp3.bufferSize(), mp3.sampleRate());//initializes a buffer with the entire sound file 
  beat = new BeatDetect();
  classicVi = new Visualizer();
  ns = new NoteSheet();
  bH = height+100;
}

void draw() {
  background(0);
gameStates();
  
  if(keyPressed ){
      if(key == 'd'){
         state = 2; 
      }
      else if(key == 'o'){
        state = 0;
      }
  }

  //drawGuides();
  
}