Ball b;
float easing = 0.35;
float gravity = 0.2;
float ground = 700;
float left = 60;
float right = 580;
float dampen = 0.1;

void setup() {
  size(640, 900);
  frameRate(60);
  b = new Ball(width/4, ground, 20);
}

void draw() {
  background(0);
  b.update();
  b.render();
  //drawFloor();
  drawWalls();
  stroke(#03F6FC);
  //line(0, ground-51, width, ground-51);
  line(0, ground-1, width, ground-1);
  //line(0, ground, width, ground);
  line(0, ground+1, width, ground+1);
  
  line(left-1, 0, left-1, height);
  //line(left, 0, left, height);
  line(left+1, 0, left+1, height);
  //line(50, 0, 50, height);
  //line(590, 0, 590, height);
  line(right-1, 0, right-1, height);
  //line(right, 0, right, height);
  line(right+1, 0, right+1, height);
  
}

void drawGuides() {
  pushMatrix();
  stroke(#03F6FC);
  //line(0, ground-51, width, ground-51);
  line(0, ground-1, width, ground-1);
  //line(0, ground, width, ground);
  line(0, ground+1, width, ground+1);
  
  line(left-1, 0, left-1, height);
  //line(left, 0, left, height);
  line(left+1, 0, left+1, height);
  //line(50, 0, 50, height);
  //line(590, 0, 590, height);
  line(right-1, 0, right-1, height);
  //line(right, 0, right, height);
  line(right+1, 0, right+1, height);
  popMatrix();
}

void drawWalls() {
  pushMatrix();
  rectMode(CENTER);
  stroke(255);
  fill(0);
  rect(0, height/2, 100, height*2);
  rect(width, height/2, 100, height*2);
  popMatrix();
}

void drawFloor() {
  pushMatrix();
  stroke(255);
  fill(0);
  rect(0, 755, width*2, 200);
  popMatrix();
}