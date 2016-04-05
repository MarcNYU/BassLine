

void initialize() {
  println(frameRate);
  mp3.play();
  input();
  translate(-c.pos.x, c.pos.y);
  drawHeights();
  b.update();
  b.render();
  
  translate(c.pos.x, -c.pos.y);
  //ns.drawNoteSheet();
  DrawLines();
  //b.render();
  drawGuides();
  classicVi.drawEQ();
  classicVi.drawBeat();
  c.draw();
}