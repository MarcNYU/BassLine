// INITIALIZATION VARS
Visualizer classicVi;
Minim minim;
ddf.minim.analysis.FFT fft;
AudioOutput out;
AudioPlayer mp3;
BeatDetect beat;
//Ball b;
Camera c;
NoteSheet ns;
//Glide gainGlide;

//Minim minimc;
//AudioOutput outt;
//StringSignal signal;
Line ll;
Line rl;

//MUSIC VARS
int currentSongIdx = 0;
Boolean musicPaused = false; 
int timer = millis();
Boolean releasedKey = true;

// GAME VARS
int move = 0;
int state = 0;
//int score;

// MENU VARS
int blinkColor;
int blinkChange = 5;
Boolean upPressed = false;
Boolean downPressed = false;


// GUIDE VARS
//float ceilling = height+100;
//float ground = height+650;
//float left = 50;
//float right = 430;
//float lw = 40;
//float rw = 440;

// PHYSICS VARS
//float gravity = .3;

// PLAYER VARS
boolean gameInit = true;
boolean jump;
//boolean start = true;

int increaseRadius = 50;
boolean delay = false;
boolean collected = true;

// EQ VARS

// BEAT VARS
float brightness;
int time; // tracks the time 

// LINE VARS
float spike = -1;
float yoff = 0.0;  // 2nd dimension of perlin noise
float nInt;    // noise intensity
float nAmp;    // noise amplitude

float fws = -1;
float lws = -1;
float rws = -1;

float z;
float u;

// NEW LINE VARS
//float[] xc;
//float[] Xcopy;
//float[] v;
//float[] f;
//float kc = 0.5;
//float cc = 0.0003;
//int num = 256;
//int monitorPoint = num/18;