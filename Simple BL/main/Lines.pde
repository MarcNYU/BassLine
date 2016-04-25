void DrawLines() {
  LWallLine();
  RWallLine();
}

void LWallLine() {
  pushMatrix();
  //strokeWeight(1);
  stroke(255);
  noFill();
  //fill(0);
  beginShape(); 

  nInt = map(lws, 0, width, 0.1, 30); // map jmp to noise intensity
  nAmp = map(lws, 0, height, 0.0, 1.0); // map jmp to noise amplitude

  float xoff = 0;       // Option #1: 2D Noise
  // Iterate over horizontal pixels
  for (float x = 100; x <= height+100; x += 10) {
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
  vertex(-width, height+100);
  vertex(-width, 100);
  endShape(CLOSE);
  popMatrix();
}

void RWallLine() {
  pushMatrix();
  //strokeWeight(1);
  stroke(255);
  noFill();
  //fill(0);
  beginShape(); 

  nInt = map(rws, 0, width, 0.1, 30); // map jmp to noise intensity
  nAmp = map(rws, 0, height, 0.0, 1.0); // map jmp to noise amplitude

  float xoff = 0;       // Option #1: 2D Noise
  // Iterate over horizontal pixels
  for (float x = 100; x <= height+100; x += 10) {
    // Calculate a y value according to noise, map to 
    if (rws >= 0 && b.rightB()) {
      u = map(noise(xoff*nInt+1, yoff*nAmp+1), 0, 1, 200, 300)+200; // Option #1: 2D Noise
    } 
    if (rws <= 1) {
      u = width-40;
    }
    vertex(u, x); 
    xoff += 0.05;
  }
  // increment y dimension for noise
  yoff += 0.01;
  vertex(width, height+100);
  vertex(width, 100);
  endShape(CLOSE);
  popMatrix();
}

void drawGuides() {
  pushMatrix();
  //strokeWeight(1);
  stroke(#FF0000);
  //line(0, ground-51, width, ground-51);
  line(0, ground-1, width, ground-1);
  //line(0, ground, width, ground);
  line(0, ground+1, width, ground+1);

  line(0, ceilling-1, width, ceilling-1);
  line(0, ceilling+1, width, ceilling+1);

  line(left-2, 0, left-2, height);
  //line(left, 0, left, height);
  line(left+2, 0, left+2, height);
  //line(50, 0, 50, height);
  //line(590, 0, 590, height);
  line(right-2, 0, right-2, height);
  //line(right, 0, right, height);
  line(right+2, 0, right+2, height);
  popMatrix();
}