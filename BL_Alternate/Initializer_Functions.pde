
Ball b;
//Trigger t1;
//Trigger t2;
//Trigger t3;
//Trigger t4;
//Trigger t5;
//Trigger t6;
//Trigger t7;
//Trigger t8;
Trigger t[];
//Null trigger
float space = 172.5;


//Trigger  t1 = new Trigger(width/2 - 120, 695, 50, 10);--Checked
//Trigger t2 = new Trigger(width/2 + 120, 695, 50, 10);--Checked
//Trigger  t3 = new Trigger(40, space*2.5 + 120, 10, 50);--Checked
//Trigger t4 = new Trigger(600, space*2.5 + 120, 10, 50);--Checked
//Trigger  t5 = new Trigger(40, space*2.1, 10, 50);--Checked
//Trigger  t6 = new Trigger(600, space*2.1, 10, 50);--Checked
//Trigger  t7 = new Trigger(40, space, 10, 50);
//Trigger  t8 = new Trigger(600, space, 10, 50);
//Trigger  tNull = new Trigger(0,0,0,0);

Trigger  t1 = new Trigger(40, space, 10, 50);//fixed
Trigger t2 = new Trigger(40, space*2.1, 10, 50); //fixed
Trigger  t3 = new Trigger(40, space*2.5 + 120, 10, 50); //Already Correct
Trigger t4 = new Trigger(width/2 + 120, 695, 50, 10); //fixed
Trigger  t5 = new Trigger(width/2, height/2, 50, 10); //fixed
Trigger  t6 = new Trigger(600, space*2.5 + 120, 10, 50); //fixed
Trigger  t7 = new Trigger(600, space*2.1, 10, 50);//fixed
Trigger  t8 = new Trigger(600, space, 10, 50);//Already Correct
Trigger  tNull = new Trigger(0,0,0,0);




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
float easing = 0.35; //lerps spikes on noise wave
float gravity = 0.2; //for the  ball
float left_x_gravity = -0.2; //when the ball is on the left wall
float right_x_gravity = 0.2; //when the ball is on the right wall
float ground = 690;//center point of ground debug line
float left = 50;//center point of left debug line
float right = 590;//center point of right debug line
float dampen = 0.1;//not being used now

boolean started; //boolean for telling if the program has started 
boolean selection; //boolean for telling if a song has been selected
boolean canPlay;//boolean for allowing the audio to play 
boolean consol = false;

void initGame() {
  t = new Trigger[8]; //array of platforms 
  b = new Ball(40, space, 20); //x = 200

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
  
}