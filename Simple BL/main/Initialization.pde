//AudioFile track1 = new AudioFile("44_Drum_beat_(Rock).mp3");;  
//AudioFile track2 = new AudioFile("Tongue Tied (Instrumental Version).mp3");
//AudioFile track3 = new AudioFile("Crypt_of_the_NecroDancer_OST_-_Tombtorial_(Tutorial).mp3");;

//class AudioFile{
//  //AudioFile musicFile;
//  String name;
  
//  AudioFile(String aName){
//    //musicFile = aFile;    
//    name = aName;
//  }

  
//  void displayName(){
//    println("current song: " + name);
//  }  
//}
//void initTracks(){
//  //track2 = new AudioFile("44_Drum_beat_(Rock).mp3");
//  //track1 = new AudioFile("Tongue Tied (Instrumental Version).mp3");
//  //track3 = new AudioFile("Crypt_of_the_NecroDancer_OST_-_Tombtorial_(Tutorial).mp3");
//  musicQueue[0] = track1;
//  musicQueue[1] = track2;
//  musicQueue[2] = track3;
//}
//musicQueue[0] = track1;
//AudioFile track3 = new AudioFile(minim.loadFile("Crypt_of_the_NecroDancer_OST_-_Tombtorial_(Tutorial).mp3", 2048), "Crypt_of_the_NecroDancer_OST_-_Tombtorial_(Tutorial).mp3");

//musicQueue[0] = tr1ck1;
//musicQueue[1] = track2;
//musicQueue[2] = track3;

//2usicQueue[currentSongIdx].play();


void initGame() {
  b = new Ball(40, height-200, 25);
  c = new Camera();
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