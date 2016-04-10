class AudioFile{
  AudioPlayer musicFile;
  String name;
  
  AudioFile(AudioPlayer aFile, String aName){
    musicFile = aFile;    
    name = aName;
  }
  
  void play(){
   musicFile.play(); 
  }
  
  void displayName(){
    println("current song: " + name);
  }
  
  
}


void initGame() {
  b = new Ball(40, height-200, 25);
  c = new Camera();
  classicVi = new Visualizer();
  ns = new NoteSheet();
  score = (int) b.pos.y;
}

void initMusic() {
  minim = new Minim(this); 
  Boolean isLoaded = false;
  
  //println("isLoaded:" + isLoaded); 
  //AudioFile track1 = new AudioFile(minim.loadFile("44_Drum_beat_(Rock).mp3", 2048), "44_Drum_beat_(Rock).mp3");
  //AudioFile track2 = new AudioFile(minim.loadFile("I'm Gonna Be (500 Miles) - Sleeping At Last Karaoke.mp3", 2048), "I'm Gonna Be (500 Miles) - Sleeping At Last Karaoke.mp3");
  //AudioFile track3 = new AudioFile(minim.loadFile("Crypt_of_the_NecroDancer_OST_-_Tombtorial_(Tutorial).mp3", 2048), "Crypt_of_the_NecroDancer_OST_-_Tombtorial_(Tutorial).mp3");
  
  musicQueue[0] = minim.loadFile("44_Drum_beat_(Rock).mp3", 2048);
  musicQueue[1] = minim.loadFile("I'm Gonna Be (500 Miles) - Sleeping At Last Karaoke.mp3", 2048);
  musicQueue[2] = minim.loadFile("Crypt_of_the_NecroDancer_OST_-_Tombtorial_(Tutorial).mp3", 2048);
  
  //musicQueue[0] = track1;
  //musicQueue[1] = track2;
  //musicQueue[2] = track3;
  
  println("initial index" + currentSongIdx); 
  
  //mp3 = minim.loadFile("44_Drum_beat_(Rock).mp3", 2048);
  //mp3 = minim.loadFile("I'm Gonna Be (500 Miles) - Sleeping At Last Karaoke.mp3", 2048);
  //mp3 = minim.loadFile("Crypt_of_the_NecroDancer_OST_-_Tombtorial_(Tutorial).mp3", 2048);
  out = minim.getLineOut(Minim.STEREO, 44100);
  fft = new FFT(musicQueue[currentSongIdx].bufferSize(), musicQueue[currentSongIdx].sampleRate());//initializes a buffer with the entire sound file 
  beat = new BeatDetect();
}