void input() {
  if(keyPressed) {
    //if(key == 'b' && eRadius > 65) {
    if(key == 'b') {
      if(frozen == false)
        jump = true;
    }
  } else {
    jump = false;
  }
}