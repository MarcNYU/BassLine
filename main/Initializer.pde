void initGame() {
  gameState = 0;
  ns = new NoteSheet();
  rBars = new Bar[14];
  lBars = new Bar[14];
  t = new Platform[8]; //array of platforms 
  b = new Ball(t4.pos.x, t4.pos.y, 20); //x = 200
  //platforms();
  makeBars();

  gameState = 0;
  minim = new Minim(this); 
  //mp3 = minim.loadFile("Crypt_of_the_NecroDancer_OST_-_Tombtorial_(Tutorial).mp3", 2048);
  mp3 = minim.loadFile("44_Drum_beat_(Rock).mp3", 2048);
  out = minim.getLineOut(Minim.STEREO, 44100);
  fft = new FFT(mp3.bufferSize(), mp3.sampleRate());//initializes a buffer with the entire sound file 
  rectMode(CORNERS);
  //mp3.loop();//loop the song
  beat = new BeatDetect();
  classicVi = new Visualizer(); // initializes the class visualizer
}

void initMusic() {
  minim = new Minim(this); 
  beat = new BeatDetect();
  classicVi = new Visualizer(); 
  
  mp3 = minim.loadFile("Crypt_of_the_NecroDancer_OST_-_Tombtorial_(Tutorial).mp3", 2048);
  out = minim.getLineOut(Minim.STEREO, 44100);
  fft = new FFT(mp3.bufferSize(), mp3.sampleRate());//initializes a buffer with the entire sound file 
}


void initPlatforms() {
  Coords = new PVector[4];
}