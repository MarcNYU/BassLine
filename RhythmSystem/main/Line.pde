float brightness = 1;
int time = millis(); 
boolean check = false;

int capacity = 5000;
Line lines[] = new Line[capacity];
int index = 0;

class Line {
  float y = 0;
  float z = 0;
  int time_create;
  int delays = 1000;
  Line() {
    time_create = millis();
  }
  void move() {
    //if (y >= left-30) {
    //if (y >= 13) {
    // check = true;
    //} else { 
    // check = false;
    //}
    //println(" x is " + y);
    if (y < 0) return;
    y = (millis() - time_create) * left / delays;    
    if (y >= left) {
      y = -1;
      //brightness = 1;
      eRadius = 20;
    }

    if (z == -1) return;
    z = width - (millis() - time_create) * left / delays;
    if (z <= right) {
      z = -1;
      // brightness = 1;
    }
  }
  void draw() {
    stroke(255);
    line (y, 0, y, height);
    line (z, 0, z, height);
  }
}

void generateLine() {
  lines[index++] = new Line();
}

void drawLines() {
  for (int i = 0; i < index; ++i) {
    lines[i].draw();
    lines[i].move();
    
  }
}

void checkLines() {
  for (int i = 0; i < index; ++i) {
    if (lines[i].y >= left-30) {
      check = true;
    } else {
      check = false;
    }
  }
}

void checkEllipse() {
  if (eRadius < 55) {
    check = true;
  } else {
    check = false;
  }
}