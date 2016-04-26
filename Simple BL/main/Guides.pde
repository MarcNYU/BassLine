// GUIDE VARS
float ceilling = 200;
float ground = 750;
float middle = 425;
float left = 40;
float right = 440;


void drawGuides() {
  stroke(#FF0000);
  line(0, ground, width, ground);

  line(0, ceilling, width, ceilling);
  
  line(0, middle, width, middle);

  line(left-20, 0, left-20, height);
  //line(width/2 - 200, 0, width/2 -200, height);
  line(left+20, 0, left+20, height);
  
  line(right-20, 0, right-20, height);
  //line(width/2 + 200, 0, width/2 + 200, height);
  line(right+20, 0, right+20, height);
}