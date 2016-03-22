import ddf.minim.*;
import ddf.minim.signals.*; 
import ddf.minim.analysis.*;

Ball b;
Visualizer classicVi;
Minim minim;
FFT fft;
AudioOutput out;
AudioPlayer mp3;

static final int GAMEOVER = 1;
static final int GAME = 0;
int gameState;
int hVal;
float spike;
float easing = 0.35;
float gravity = 0.2;
float ground = 300;
float dampen = 0.2;

boolean started; //boolean for telling if the program has started 
boolean selection; //boolean for telling if a song has been selected
boolean canPlay;//boolean for allowing the audio to play 

void setup() {
  size(640, 640);
  noiseDetail(8);
  frameRate(60);
  started = false;
  selection = false;
  initGame();
}

void draw() {
  canPlay = true;
  background(0);
  classicVi.drawEQ();
  if (canPlay)
  {
    mp3.play();
  }
  if (b.pos.y > 260 && spike < 1) {
    stroke(255);
    line(0, ground-40, 1000, ground-40);
  }
}

void initGame() {
  b = new Ball();
  b.pos = new PVector(100, 250);
  b.dir = 1;
  b.velo = new PVector(0, 0);
  b.roll = 5;
  b.bounce = 8;
  b.radius = 20;

  gameState = 0;
  started = false;
  selection = false;
  minim = new Minim(this);
  mp3 = minim.loadFile("Jamie_Berry_-_Delight_(feat._Octavia_Rose).mp3", 2048);
  out = minim.getLineOut(Minim.STEREO, 44100);
  fft = new FFT(mp3.bufferSize(), mp3.sampleRate());//allows for the decription of the sound waves 
  rectMode(CORNERS);
  mp3.loop();
  classicVi = new Visualizer(); // initializes the class visualizer
}

void keyPressed()
{
  if (key == ESC)
  {
    started = false; //kills the program 
    mp3.pause();
  }
}