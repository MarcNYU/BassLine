float yoff = 0.0;  // 2nd dimension of perlin noise
float nInt = 10;    // noise intensity
float nAmp = .3;    // noise amplitude

float y;
float z;
float u;

void DrawLines() {
  BaseLine();
  LWallLine();
  RWallLine();
}

void BaseLine() {
  pushMatrix();
  translate(0, 445);
  stroke(255);
  noFill();
  //fill(0);
  beginShape(); 
  float xoff = 0;       // Option #1: 2D Noise
  // Iterate over horizontal pixels
  for (float x = 0; x <= width; x += 10) {
    // Calculate a y value according to noise, map to 
    if (spike >= 0 && b.grounded()) {
      y = map(noise(xoff*nInt+1, yoff*nAmp+1), 0, 1, 200, 300); // Option #1: 2D Noise
    } 
    if (spike <= 1) {
      y = 250;
    }
    vertex(x, y); 
    // Increment x dimension for noise
    xoff += 0.05;
  }
  // increment y dimension for noise
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  popMatrix();
}

void LWallLine() {
  pushMatrix();
  stroke(255);
  noFill();
  fill(0);
  beginShape(); 
  float xoff = 0;       // Option #1: 2D Noise
  // Iterate over horizontal pixels
  for (float x = 0; x <= height; x += 10) {
    // Calculate a y value according to noise, map to 
    if (spike >= 0 && b.leftB()) {
      z = map(noise(xoff*nInt, yoff*nAmp), 0, 1, 200, 300)-200; // Option #1: 2D Noise
    } 
    if (spike <= 1) {
      z = 40;
    }
    vertex(z, x);
    // Increment x dimension for noise
    xoff += 0.05;
  }
  // increment y dimension for noise
  yoff += 0.01;
  vertex(-width, height);
  vertex(-width, 0);
  endShape(CLOSE);
  popMatrix();
}

void RWallLine() {
  pushMatrix();
  stroke(255);
  noFill();
  fill(0);
  beginShape(); 
  float xoff = 0;       // Option #1: 2D Noise
  // Iterate over horizontal pixels
  for (float x = 0; x <= height; x += 10) {
    // Calculate a y value according to noise, map to 
    if (spike >= 0 && b.rightB()) {
      u = map(noise(xoff*nInt+1, yoff*nAmp+1), 0, 1, 200, 300)+350; // Option #1: 2D Noise
    } 
    if (spike <= 1) {
      u = width-40;
    }
    vertex(u, x); 
    xoff += 0.05;
  }
  // increment y dimension for noise
  yoff += 0.01;
  vertex(width, height);
  vertex(width, 0);
  endShape(CLOSE);
  popMatrix();
}