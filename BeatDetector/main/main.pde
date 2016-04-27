float brightness = 0;
BeatDetector bd;    
BeatQueue bq;
int forward = 2000;  // how many milliseconds to look forward


void setup() {
  stroke(255);
  bd = new BeatDetector(forward);
  bd.loadSong("Tongue.mp3");
  bq = new BeatQueue(bd);
  bd.start();
}

void draw()
{
  background(0);
  noFill();
  int beats[] = bq.nexts(); // returns an array of time of beats
  for (int i = 0; i < beats.length; ++i) {
    
    int y = beats[i] * height / forward;
    //line (0, y, width, y);
    ellipse(width/2, height/2, y, y);
  }
  int next = bq.next(); // return next beat
  if (next <= 20) {
     background(255); 
  }
  //fill(brightness*255);
  //ellipse(width/2,height/2,width/2,height/2); 
  brightness -= 0.1; 

}