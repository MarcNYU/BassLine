// GUIDE VARS
float ceilling = 200;
float ground = 750;
float middle = 425;
float left = 85;
float right = 465;


void drawGuides() {
  stroke(#FF0000);
  line(0, ground, width, ground);

  line(0, ceilling, width, ceilling);
  
  line(0, middle, width, middle);

  line(left-30, 0, left-30, height);
  //line(width/2 - 200, 0, width/2 -200, height);
  line(left, 0, left, height);
  
  line(right, 0, right, height);
  //line(width/2 + 200, 0, width/2 + 200, height);
  line(right+30, 0, right+30, height);
}