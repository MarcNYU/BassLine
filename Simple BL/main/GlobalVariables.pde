// INITIALIZATION VARS
Visualizer classicVi;
Minim minim;
ddf.minim.analysis.FFT fft;
AudioOutput out;
AudioPlayer mp3;
BeatDetect beat;
Ball b;
Camera c;
NoteSheet ns;

// GAME VARS
int move = 0;
int state = 0;
//int score;

//MUSIC VARS
int currentSongIdx = 0;
Boolean musicPaused = false; 
int timer = millis();
Boolean releasedKey = true;

// GUIDE VARS
float ceilling = height+100;
float ground = height+650;
float left = 50;
float right = 430;

// PHYSICS VARS
float gravity = .3;

// PLAYER VARS
boolean gameInit = true;
boolean jump;
boolean start = true;
int currentTime = 0;
int destTime = 0;
boolean frozen = false;
boolean increase = false;
boolean secLifeOn = false;
boolean hasPowerUp = false;
int increaseRadius = 50;
boolean delay = false;
boolean collected = true;

// EQ VARS
//float eRadius;

// MENU VARS
int blinkColor;
int blinkChange = 5;
Boolean upPressed = false;
Boolean downPressed = false;

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