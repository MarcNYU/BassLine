// LINE VARS
float spike = -1;
float yoff = 0.0;  // 2nd dimension of perlin noise
float nInt;    // noise intensity
float nAmp;    // noise amplitude

float fws = -1;
float lws = -1;
float rws = -1;

float z;
float u;

float lH = -height;
float bH;

void DrawLines() {
  LWallLine();
  RWallLine();
}

void LWallLine() {
  pushMatrix();
  strokeWeight(1);
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
  lH-=100;
}

void RWallLine() {
  pushMatrix();
  strokeWeight(1);
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
  lH-=100;
}

void drawGuides() {
  pushMatrix();
  strokeWeight(1);
  stroke(#FF0000);
  //line(0, ground-51, width, ground-51);
  line(0, ground-1, width, ground-1);
  //line(0, ground, width, ground);
  line(0, ground+1, width, ground+1);

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

void drawHeights() {
  textSize(32);
  fill(255);
  text(height/4, width/2-textWidth("000")/2, height/4);
  //text(height/4 + 300, width/2-textWidth("000")/2, height/4 - 300);
  text(height/4 + 500, width/2-textWidth("000")/2, height/4 - 500);
  text(height/4 + 500*2, width/2-textWidth("000")/2, height/4 - 500*2);
  text(height/4 + 500*3, width/2-textWidth("000")/2, height/4 - 500*3);
  text(height/4 + 500*4, width/2-textWidth("000")/2, height/4 - 500*4);
  text(height/4 + 500*5, width/2-textWidth("000")/2, height/4 - 500*5);
  text(height/4 + 500*6, width/2-textWidth("000")/2, height/4 - 500*6);
  text(height/4 + 500*7, width/2-textWidth("000")/2, height/4 - 500*7);
  text(height/4 + 500*8, width/2-textWidth("000")/2, height/4 - 500*8);
  text(height/4 + 500*9, width/2-textWidth("000")/2, height/4 - 500*9);
  text(height/4 + 500*10, width/2-textWidth("000")/2, height/4 - 500*10);
  text(height/4 + 500*15, width/2-textWidth("000")/2, height/4 - 500*15);
  text(height/4 + 500*20, width/2-textWidth("000")/2, height/4 - 500*20);
  text(height/4 + 500*25, width/2-textWidth("000")/2, height/4 - 500*25);
  text(height/4 + 500*30, width/2-textWidth("000")/2, height/4 - 500*30);
  text(height/4 + 500*40, width/2-textWidth("000")/2, height/4 - 500*40);
  text(height/4 + 500*50, width/2-textWidth("000")/2, height/4 - 500*50);
  text(height/4 + 500*60, width/2-textWidth("000")/2, height/4 - 500*60);
  text(height/4 + 500*70, width/2-textWidth("000")/2, height/4 - 500*70);
  text(height/4 + 500*80, width/2-textWidth("000")/2, height/4 - 500*80);
  text(height/4 + 500*90, width/2-textWidth("000")/2, height/4 - 500*90);
  text(height/4 + 500*100, width/2-textWidth("000")/2, height/4 - 500*100);
}