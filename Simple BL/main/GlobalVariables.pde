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
PeakDetector beatDetector;
Minim minimc;
AudioOutput outt;
StringSignal signal;



// GAME VARS
int move = 0;
int state = 0;
int score;

// GUIDE VARS
float ceilling = height+100;
float ground = height+650;
float left = 50;
float right = 430;
float lw = 40;
float rw = 440;

// PHYSICS VARS


// PLAYER VARS
boolean start = true;

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

// NEW LINE VARS