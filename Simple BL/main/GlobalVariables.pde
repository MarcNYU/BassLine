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
AudioContext ac;
beads.Gain g;
Envelope frequencyEnvelope;
WavePlayer sine;
PeakDetector beatDetector;
WavePlayer modulator;
Function frequencyModulation;
WavePlayer carrier;



//MUSIC VARS
//String[] musicQueue = new String[3];
//AudioPlayer[] musicQueue = new AudioPlayer[3];
//AudioFile[] musicQueue = new AudioFile[3];
int currentSongIdx = 0;
Boolean musicPaused = false;  



// GAME VARS
int move = 0;
int state = 0;
int score;
boolean error = false;
boolean loading = false;

// GUIDE VARS
float ceilling = height+100;
float ground = height+650;
float left = 50;
float right = 430;
float lw = 40;
float rw = 440;

// PHYSICS VARS
float gravity = .3;

// PLAYER VARS
boolean jump;
boolean gameInit = true;
boolean start = true;
int currentTime = 0;
int destTime = 0;
boolean frozen = false;
boolean increase = false;
boolean secLifeOn = false;
boolean hasPowerUp = false;
int increaseRadius = 50;

// EQ VARS
float eRadius;

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