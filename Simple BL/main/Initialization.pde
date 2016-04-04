

void initialize(){
  println(frameRate);
  mp3.play();
  input();
  translate(-c.pos.x, c.pos.y);
  drawHeights();
  b.update();
  b.render();
  c.draw();
  translate(c.pos.x, -c.pos.y);
  //ns.drawNoteSheet();
  DrawLines();
  //b.render();
  classicVi.drawEQ();
  classicVi.drawBeat();
}