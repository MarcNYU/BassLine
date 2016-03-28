void handleInputs() {
  if (keyPressed) {
    if (b.grounded()) {
      if (key == 'q') {
        LWallJump = true;
        triggerSpike = true;
      } 
      if (key == 'w') {
        RJump = true;
        triggerSpike = true;
      }
      if (key == 'o') {
        LJump = true;
        triggerSpike = true;
      }
      if (key == 'p') {
        RWallJump = true;
        triggerSpike = true;
      }
    } else {
      float target = 0;
      float dx = target - spike;
      spike += dx * 0.55;//ease rate
      triggerSpike = false;
    }
  }
  if (!keyPressed) {
    triggerSpike = false;
    if (key == 'q') LWallJump = false;
    if (key == 'w') RJump = false;
    if (key == 'o') LJump = false;
    if (key == 'p') RWallJump = false;
    float target = 0;
    float dx = target - spike;
    spike += dx * 0.55;//ease rate
  }
}