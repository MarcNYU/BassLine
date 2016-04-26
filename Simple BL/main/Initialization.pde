void initGame() {
  //b = new Ball(40, height-200, 25);
  b = new Player(40, height-200);
  c = new Camera();
  classicVi = new Visualizer();
  ns = new NoteSheet();
  score = (int) b.pos.y;
  ll = new Line(-200);
  rl = new Line(200);
}

void initMusic() {
  minim = new Minim(this); 
  mp3 = minim.loadFile(songList[currentSongIdx], 2048);
  out = minim.getLineOut(Minim.STEREO, 44100);
  fft = new ddf.minim.analysis.FFT(mp3.bufferSize(), mp3.sampleRate());//initializes a buffer with the entire sound file 
  beat = new BeatDetect();
}