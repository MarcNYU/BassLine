// INITIALIZATION VARS
Visualizer classicVi;
Minim minim;
FFT fft;
AudioOutput out;
AudioPlayer mp3;
BeatDetect beat;
Ball b;
Camera c;
NoteSheet ns;

// GAME VARS
int move = 0;
int state = 0;
int score;

// GUIDE VARS
float ceilling = height+100;
float ground = height+650;
float left = 50;
float right = 430;

// PHYSICS VARS
float gravity = .3;

// PLAYER VARS
boolean jump;
boolean start = true;

//MUSIC VARS
//String[] musicQueue = new String[3];
AudioPlayer[] musicQueue = new AudioPlayer[3];
//AudioFile[] musicQueue = new AudioFile[3];
int currentSongIdx = 0;
Boolean musicPaused = false;

// EQ VARS
float eRadius;

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