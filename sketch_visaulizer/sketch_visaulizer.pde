import ddf.minim.*;
import ddf.minim.signals.*; 
import ddf.minim.analysis.*;
visualizer classicVi;
//v classicVi;

Minim minim;
FFT fft;

AudioOutput out;
AudioPlayer mp3;

PFont directions;
int hVal;

boolean started; //boolean for telling if the program has started 
boolean selection; //boolean for telling if a song has been selected
boolean canPlay;//boolean for allowing the audio to play 


void setup()
{
  
  //program setup 
  size(900,500);
  frameRate(60);
  started = false;
  selection = false;
  
// sound and minim setup parameters
  minim = new Minim(this);
  //mp3 = minim.loadFile("Before My Body Is Dry (Don't Lose Your Way) OST.mp3",2048);
  mp3 = minim.loadFile("Jamie_Berry_-_Delight_(feat._Octavia_Rose).mp3",2048);
  //mp3 = minim.loadFile("68 Gerudo Valley.mp3",2048);
  //mp3 = minim.loadFile("Crypt_of_the_NecroDancer_OST_-_Tombtorial_(Tutorial).mp3",2048);
  //mp3 = minim.loadFile("Fast_Drum_Beat_in_44_time_at_120bpm.mp3",2048);
  //mp3 = minim.loadFile("Undertale_OST_-_Ghost_Fight_Extended.mp3",2048);// load your mp3 file here make sure you use processing's built in add file feature and type the name of the loaded mp3 inside the quotation marks
  out = minim.getLineOut(Minim.STEREO,44100);
  fft = new FFT(mp3.bufferSize(),mp3.sampleRate());//allows for the decription of the sound waves 
  rectMode(CORNERS);
  mp3.loop();
  
  classicVi = new visualizer(); // initializes the class visualizer
  //classicVi = new v(); // initializes the class visualizer
}

void draw()
{
    canPlay = true;
    background(0);
    classicVi.drawEQ();
    if(canPlay)
    {
      mp3.play();
    }
}
// Start Button Parameters 
void keyPressed()
{
  if(key == ESC)
  {
    started = false; //kills the program 
    mp3.pause();
  }
  output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file
  exit(); // Stops the program
}