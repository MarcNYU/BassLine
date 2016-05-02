// GUIDE VARS
float ceilling = 140;
float ground = 740;
float dropLine = 700;
float safeLine = 600;
float middle = 350;
float left = 40;
float right = 440;


void drawGuides() {

  if (!failing) {
    stroke(#FFFFFF, 100);
  } else {
    stroke(#FFFFFF, fadeValue);
  }
  
  line(0, ground, width, ground);

  line(0, ceilling, width, ceilling);

  line(0, middle, width, middle);

  line(0, dropLine, width, dropLine);

  line(0, safeLine, width, safeLine);

  //line(left-30, 0, left-30, height);
  ////line(width/2 - 200, 0, width/2 -200, height);
  //line(left, 0, left, height);

  //line(right, 0, right, height);
  ////line(width/2 + 200, 0, width/2 + 200, height);
  //line(right+30, 0, right+30, height);
}

void BG() {
  //fill(0, 150, 255);
  //rect(40, 0, 400, ceilling);
  //fill(0, 100, 205);
  //rect(40, ceilling, 400, 210);
  //fill(0, 50, 155);
  //rect(40, middle, 400, 250);
  //fill(0, 0, 105);
  //rect(40, safeLine, 400, 100);

  if (b.pos.y < ceilling) {
    fill(0, 150, 255);
    rect(40, 0, 400, ceilling);
    fill(0, 100, 205);
    rect(40, ceilling, 400, 210);
    fill(0, 50, 155);
    rect(40, middle, 400, 250);
    fill(0, 0, 105);
    rect(40, safeLine, 400, 100);
  } else if (b.pos.y < middle && b.pos.y > ceilling) {
    fill(0, 100, 205);
    rect(40, ceilling, 400, 210);
    fill(0, 50, 155);
    rect(40, middle, 400, 250);
    fill(0, 0, 105);
    rect(40, safeLine, 400, 100);
  } else if (b.pos.y < safeLine && b.pos.y > middle) {
    fill(0, 50, 155);
    rect(40, middle, 400, 250);
    fill(0, 0, 105);
    rect(40, safeLine, 400, 100);
  } else if (b.pos.y < dropLine && b.pos.y > safeLine) {
    fill(0, 0, 105);
    rect(40, safeLine, 400, 100);
  }
}