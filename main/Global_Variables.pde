// GAMEMODE
boolean PlayTest = false;
static final int GAMEOVER = 1;
static final int GAME = 0;
int gameState;
boolean turnoff = false;
boolean turnoffm = false;

// MUSIC
Visualizer classicVi;
Minim minim;
FFT fft;
AudioOutput out;
AudioPlayer mp3;
BeatDetect beat;

// ENTITIES
Ball b;
Bar rBars[];
Bar lBars[];
NoteSheet ns;

// DEBUG VARS
int grid = 1;
int platStart = 0;
float ground = 785;
float left = 50;
float right = 590;
boolean turnGridOn = false;

// PHYSICS VARS
float easing = 0.35;
float gravity = 0.2;
float dampen = 0.1;

// PLAYER VARS
boolean triggerSpike = false;
boolean choice1 = false;
boolean choice2 = false;
boolean choice3 = false;
boolean choice4 = false;
boolean choice5 = false;
boolean choice6 = false;
boolean choice7 = false;
boolean choice8 = false;

int hpCoord = 200;

float beginX = 40.0 ;  // Initial x-coordinate
float beginY = 272.5;  // Initial y-coordinate

float endX = 40.0;   // Final x-coordinate
float endY = 272.5;   // Final y-coordinate
float distX;          // X-axis distance to move
float distY;          // Y-axis distance to move
float exponent = 6;   // Determines the curve 
float current_x = 0.0;        // Current x-coordinate
float current_y = 0.0;        // Current y-coordinate
float step = 0.02;    // Size of each step along the path (Use to adjust speed of the ball)
float pct = 0.0;      // Percentage traveled (0.0 to 1.0)

boolean canMoveTo = false;
boolean locked = false;

// PLATFROM VARS
PVector Coords[];
float space = 272.5;

Platform t1 = new Platform(40, space, 10, 50);//x=40
Platform t2 = new Platform(40, space+200, 10, 50);
Platform t3 = new Platform(40, space+400, 10, 50);
Platform t4 = new Platform(width/2 + 120, 795, 50, 10);
Platform t5 = new Platform(width/2+400, height/2+745, 50, 10);
Platform t6 = new Platform(600, space, 10, 50);//x=600
Platform t7 = new Platform(600, space+200, 10, 50);
Platform t8 = new Platform(600, space+400, 10, 50);
Platform tNull = new Platform(0, 0, 0, 0);
Platform t[];

Platform[][]  decisionGraph = {{tNull,tNull,tNull,tNull,t5,t6,t7,t8},
                              {tNull,tNull,tNull,tNull,t5,t6,t7,t8},
                              {tNull,tNull,tNull,tNull,t5,t6,t7,t8},
                              {tNull,tNull,tNull,tNull,t5,t6,t7,t8},
                              {t1,t2,t3,t4,tNull,tNull,tNull,tNull},
                              {t1,t2,t3,t4,tNull,tNull,tNull,tNull},
                              {t1,t2,t3,t4,tNull,tNull,tNull,tNull},
                              {t1,t2,t3,t4,tNull,tNull,tNull,tNull}};

// LINE VARS
float spike = -1;
float yoff = 0.0;  // 2nd dimension of perlin noise
float nInt;    // noise intensity
float nAmp;    // noise amplitude

float fws = -1;
float lws = -1;
float rws = -1;

float y;
float z;
float u;

// BAR VARS
int barGap = 100;