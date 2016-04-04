void DebugMode () {
  background(0); //set background to black
  mp3.close();
  platforms();
  handleInputs();
  checkCollision();
  DrawLines();
  //classicVi.drawBEQ(); 
  classicVi.drawWEQ();
  b.DrawHP();
  fill(0);
  drawplatforms();
  b.update();
  b.render();
  //highlight platforms that can 
  fill(20, 20, 255);
  for (int i =0; i < 8; i++) {
    if (!(decisionGraph[b.currentPlatform-1][i].isNull)) {
      decisionGraph[b.currentPlatform-1][i].drawP();
    }
  }
  drawGuides();
  if (turnGridOn) {
    drawGrid();
  }
}

void drawGrid() {
  int px = mouseX / grid;
  int py = mouseY / grid;
  rect(px * grid, py * grid, grid, grid);
   
  stroke(0, 0); 
  for (int y = 0; y < height; y += grid) {
    if (y % (5 * grid) == 0) {
      strokeWeight(3);
    } else {
      strokeWeight(1);
    }
    line(0, y, width, y);
  }
   
  for (int x = 0; x < width; x += grid) {
    if (x % (5 * grid) == 0) {
      strokeWeight(3);
    } else {
      strokeWeight(1);
    }
    line(x, 0, x, height);
  }
   
  String label = "( " + px + " , " + py + " )";
   
  int tx = 0, ty = 0;
  if (mouseX < width / 2) {
    tx = px * grid + (int)(1.5f * grid);
  } else {
    tx = px * grid - grid / 2 - (int)textWidth(label);
  }
   
  if (mouseY < height / 2) {
    ty = py * grid + (int)(1.5f * grid);
  } else {
    ty = py * grid;
  }
  pushMatrix(); 
  noStroke();
  fill(255);
  text(label, tx, ty);
  stroke(0);
  popMatrix();
}

void drawGuides() { //debug lines
  pushMatrix();
  stroke(#FF0000);
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

void makeWallPlatformsGuides() {
  pushMatrix();
  noStroke();
  fill(#FF0000);
  rect(30, 250, 10, 50);
  rect(600, 250, 10, 50);
  rect(30, 500, 10, 50);
  rect(600, 500, 10, 50);
  popMatrix();
}

void makeFloorPlatformGuides() {
  pushMatrix();
  noStroke();
  fill(#FF0000);
  rect(213-25, 700, 50, 10);
  rect(426-25, 700, 50, 10);
  popMatrix();
}