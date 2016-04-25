void initGame() {
  b = new Ball(40, height-200, 25);
  classicVi = new Visualizer();
  ns = new NoteSheet();
  score = (int) b.pos.y;

}

void initMusic() {
  minim = new Minim(this); 
  mp3 = minim.loadFile("Tongue Tied (Instrumental Version).mp3", 2048);
  //mp3 = minim.loadFile("44_Drum_beat_(Rock).mp3", 2048);
  //mp3 = minim.loadFile("I'm Gonna Be (500 Miles) - Sleeping At Last Karaoke.mp3", 2048);
  //mp3 = minim.loadFile("Crypt_of_the_NecroDancer_OST_-_Tombtorial_(Tutorial).mp3", 2048);
  out = minim.getLineOut(Minim.STEREO, 44100);
  fft = new ddf.minim.analysis.FFT(mp3.bufferSize(), mp3.sampleRate());//initializes a buffer with the entire sound file 
  beat = new BeatDetect();
}