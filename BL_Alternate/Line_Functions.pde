float yoff = 0.0;  // 2nd dimension of perlin noise
float nInt;    // noise intensity
float nAmp;    // noise amplitude

float fws;
float lws;
float rws;

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
  translate(0, 445); //move center point of the line down to 445
  stroke(255); //draws line with color value
  noFill();//inside of shape is transparent
  //fill(0);
  beginShape(); 

  nInt = map(fws, 0, width, 0.1, 30); // map jmp to noise intensity
  nAmp = map(fws, 0, height, 0.0, 1.0); // map jmp to noise amplitude

  float xoff = 0;       // Option #1: 2D Noise
  // Iterate over horizontal pixels
  for (float x = 0; x <= width; x += 10) {
    // Calculate a y value according to noise, map to 
    if (fws >= 0) {//checks if a spike in the wave has been made and if the ball was on the baseline
      y = map(noise(xoff*nInt+1, yoff*nAmp+1), 0, 1, 200, 300); // Option #1: 2D Noise
    } 
    if (fws <= 1) {
      y = 250;
    }
    vertex(x, y); //draws the top line of the rectangle with the noise function
    // Increment x dimension for noise
    xoff += 0.05;
  }
  // increment y dimension for noise
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);//closes the shape at the bottom of the screen
  popMatrix();
}

void LWallLine() {
  pushMatrix();
  stroke(255);
  noFill();
  fill(0);
  beginShape(); 

  nInt = map(lws, 0, width, 0.1, 30); // map jmp to noise intensity
  nAmp = map(lws, 0, height, 0.0, 1.0); // map jmp to noise amplitude

  float xoff = 0;       // Option #1: 2D Noise
  // Iterate over horizontal pixels
  for (float x = 0; x <= height; x += 10) {
    // Calculate a y value according to noise, map to 
    if (lws >= 0 && b.leftB()) {
      z = map(noise(xoff*nInt, yoff*nAmp), 0, 1, 200, 300)-200; // Option #1: 2D Noise
    } 
    if (lws <= 1) {
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

  nInt = map(rws, 0, width, 0.1, 30); // map jmp to noise intensity
  nAmp = map(rws, 0, height, 0.0, 1.0); // map jmp to noise amplitude

  float xoff = 0;       // Option #1: 2D Noise
  // Iterate over horizontal pixels
  for (float x = 0; x <= height; x += 10) {
    // Calculate a y value according to noise, map to 
    if (rws >= 0 && b.rightB()) {
      u = map(noise(xoff*nInt+1, yoff*nAmp+1), 0, 1, 200, 300)+350; // Option #1: 2D Noise
    } 
    if (rws <= 1) {
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