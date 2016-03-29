Ball b;
Trigger t1;
Trigger t2;
Trigger t3;
Trigger t4;
Trigger t5;
Trigger t6;
Trigger t7;
Trigger t8;
Trigger t[];
Visualizer classicVi;
Minim minim;
FFT fft;
AudioOutput out;
AudioPlayer mp3;

static final int GAMEOVER = 1;
static final int GAME = 0;
int gameState;

boolean started; //boolean for telling if the program has started 
boolean selection; //boolean for telling if a song has been selected
boolean canPlay;//boolean for allowing the audio to play 
boolean consol = false;

void initGame() {
  t = new Trigger[8]; //array of platforms 
  b = new Ball(200, ground, 20); //x = 200

  gameState = 0;
  started = false; //if the music has started
  selection = false; //if a song song switch selection has been made
  minim = new Minim(this); 
  mp3 = minim.loadFile("Crypt_of_the_NecroDancer_OST_-_Tombtorial_(Tutorial).mp3", 2048);
  out = minim.getLineOut(Minim.STEREO, 44100);
  fft = new FFT(mp3.bufferSize(), mp3.sampleRate());//initializes a buffer with the entire sound file 
  rectMode(CORNERS);
  mp3.loop();//loop the song
  classicVi = new Visualizer(); // initializes the class visualizer
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

void debug() {
  drawGuides();
  triggers();
}