void input() {
  if (keyPressed) {
    //if(key == 'b' && eRadius > 60) {
    if (key == 'b') {
      jump = true;
      start = false;
    }
  } else {
    jump = false;
  }
}