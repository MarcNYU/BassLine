void handleInputs() {
  if (keyPressed) {
    if (b.grounded()) {
      if (key == '1') {
        LWallJump = true;
        triggerSpike = true;
      } 
      if (key == '2') {
        RJump = true;
        triggerSpike = true;
      }
      if (key == '3') {
        LJump = true;
        triggerSpike = true;
      }
      if (key == '4') {
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
    if (key == '1') LWallJump = false;
    if (key == '2') RJump = false;
    if (key == '3') LJump = false;
    if (key == '4') RWallJump = false;
    float target = 0;
    float dx = target - spike;
    spike += dx * 0.55;//ease rate
  }
}