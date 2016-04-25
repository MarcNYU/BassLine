float brightness = 1;
int time = millis(); 

void setup () {
  BeatDetector bd = new BeatDetector();
  bd.loadSong("Tongue.mp3");
  
  // Adding listener will always have this whole structure, just put your function at the place where generateLine() resides in
  bd.addListener(     
    new Bead()
     {
         protected void messageReceived(Bead b)
         {
           // Yeah, this is the place
           generateLine();  
         }
     }
   );
  bd.start();
}

class Line {
  float y = 0;
  int time_create;
  int delays = 1000;
  Line() {
    time_create = millis(); 
  }
  void move() {
    if (y == -1) return;
    y = height - (millis() - time_create) * height / delays;
    if (y < 0) {
      y = -1;
      brightness = 1; 
    }
  }
  void draw() {
    line (0, y, width, y); 
  }
}

int capacity = 5000;
Line lines[] = new Line[capacity];
int index = 0;

void generateLine() {
  lines[index++] = new Line();
}

void draw()
{
  stroke(255);
  background(0);
  fill(brightness*255);
  ellipse(width/2,height/2,width/2,height/2);  
  
  // decrease brightness over time
  int dt = millis() - time;
  brightness -= (dt * 0.01);
  if (brightness < 0) brightness = 0;
  time += dt;
  
  for (int i = 0; i < index; ++i) {
      lines[i].draw();
     lines[i].move();
  }
  
  // set threshold and alpha to the mouse position
}