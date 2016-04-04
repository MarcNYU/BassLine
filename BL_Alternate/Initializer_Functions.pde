Ball b;
Bar rBars[];
Bar lBars[];
NoteSheet ns;

Visualizer classicVi;
Minim minim;
FFT fft;
AudioOutput out;
AudioPlayer mp3;
BeatDetect beat;

static final int GAMEOVER = 1;
static final int GAME = 0;
int gameState;
int jumpCounter = 0;

int UY = 100;

boolean started; //boolean for telling if the program has started 
boolean selection; //boolean for telling if a song has been selected
boolean canPlay;//boolean for allowing the audio to play 
boolean consol = false;

void initGame() {
  ns = new NoteSheet();
  rBars = new Bar[14];
  lBars = new Bar[14];
  t = new Trigger[8]; //array of platforms 
  b = new Ball(t4.pos.x, t4.pos.y, 20); //x = 200
  //triggers();
  makeBars();

  gameState = 0;
  started = false; //if the music has started
  selection = false; //if a song song switch selection has been made
  minim = new Minim(this); 
  //mp3 = minim.loadFile("Crypt_of_the_NecroDancer_OST_-_Tombtorial_(Tutorial).mp3", 2048);
  mp3 = minim.loadFile("44_Drum_beat_(Rock).mp3", 2048);
  out = minim.getLineOut(Minim.STEREO, 44100);
  fft = new FFT(mp3.bufferSize(), mp3.sampleRate());//initializes a buffer with the entire sound file 
  myDelay = new Delay( 0.4, 0.5, true, true );
  rectMode(CORNERS);
  //mp3.loop();//loop the song
  beat = new BeatDetect();
  classicVi = new Visualizer(); // initializes the class visualizer
  
  //makeSpikes();
}

void drawGuides() { //debug lines
  pushMatrix();
  stroke(#FF0000);
  //line(0, ground-51, width, ground-51);
  line(0, ground-1, width, ground-1);
  //line(0, ground, width, ground);
  line(0, ground+1, width, ground+1);

  line(left-1, 0, left-1, height);
  //line(left, 0, left, height);
  line(left+1, 0, left+1, height);
  //line(50, 0, 50, height);
  //line(590, 0, 590, height);
  line(right-1, 0, right-1, height);
  //line(right, 0, right, height);
  line(right+1, 0, right+1, height);
  popMatrix();
}

void drawArc() {
  pushMatrix();
  stroke(255);
  noFill();
  arc(t1.pos.x, t1.pos.y, 50, 50, 0, HALF_PI);
  popMatrix();
}

void checkCollision() {
  for (int i = 0; i < rBars.length; i++) {
    rBars[i].collidesWithBall(0);
    lBars[i].collidesWithBall(1);
  }
  for (int j = 0; j < lBars.length; j++) {
    lBars[j].collidesWithBall(1);
  }
  
}

void debug() {
  drawGuides();
  //drawArc();
  //drawTriggers();
}