void handleInputs() {
  if (keyPressed) {
    if (b.grounded()) {
      if (key == 'q') {
        LWallJump = true;
        triggerws = true;
      } 
      if (key == 'w') {
        RJump = true;
        triggerws = true;
      }
      if (key == 'o') {
        LJump = true;
        triggerws = true;
      }
      if (key == 'p') {
        RWallJump = true;
        triggerws = true;
      }
    } else {
      float target = 0;
      float dx = target - fws;
      fws += dx * 0.35;//ease rate
      triggerws = false;
    }
  }
  if (!keyPressed) {
    triggerws = false;
    if (key == 'q') LWallJump = false;
    if (key == 'w') RJump = false;
    if (key == 'o') LJump = false;
    if (key == 'p') RWallJump = false;
    float target = 0;
    float dx = target - fws;
    fws += dx * 0.35;//ease rate
  }
}