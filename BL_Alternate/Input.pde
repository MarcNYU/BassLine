void handleInputs() {
  if (keyPressed) {
    if (b.grounded()) {
      if (key == 'q') {
        choice1 = true;
        triggerSpike = true;
      } 
      if (key == 'w') {
        choice2 = true;
        triggerSpike = true;
      }
      if (key == 'o') {
        choice3 = true;
        triggerSpike = true;
      }
      if (key == 'p') {
        choice4 = true;
        triggerSpike = true;
      }
    } else {
      float target = 0;
      float dx = target - fws;
      float dt = target - lws;
      float dl = target - rws;
      fws += dx * 0.35;//ease rate
      lws += dt * 0.35;//ease rate
      rws += dl * 0.35;//ease rate
      triggerSpike = false;
    }
  }
  if (!keyPressed) {
    triggerSpike = false;
    if (key == 'q') choice1 = false;
    if (key == 'w') choice2 = false;
    if (key == 'o') choice3 = false;
    if (key == 'p') choice4 = false;
    float target = 0;
    float dx = target - fws;
    float dt = target - lws;
    float dl = target - rws;
    fws += dx * 0.35;//ease rate
    lws += dt * 0.35;//ease rate
    rws += dl * 0.35;//ease rate
  }
}