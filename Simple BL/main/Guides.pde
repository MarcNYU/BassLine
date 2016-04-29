// GUIDE VARS
float ceilling = 250;
float ground = 740;
float middle = 450;
float left = 40;
float right = 440;


void drawGuides() {
  
  if(!failing){
    stroke(#FFFFFF, 100);
  }
  else{
     stroke(#FFFFFF, fadeValue);
  }
  line(0, ground, width, ground);

  line(0, ceilling, width, ceilling);
  
  line(0, middle, width, middle);

  //line(left-30, 0, left-30, height);
  ////line(width/2 - 200, 0, width/2 -200, height);
  //line(left, 0, left, height);
  
  //line(right, 0, right, height);
  ////line(width/2 + 200, 0, width/2 + 200, height);
  //line(right+30, 0, right+30, height);
}