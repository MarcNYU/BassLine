void input() {
  if (keyPressed) {
    //if(key == 'b' && eRadius > 65) {
    if (key == 'b') {
      jump = true;
      start = false;
    }
  } else {
    jump = false;
  }
}