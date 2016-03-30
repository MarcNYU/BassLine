

void handleInputs() {
  
  //println("t1 position: " + t2.pos.x);
  println("Decision Graph position: " + decisionGraph[3][4].pos.x);
  
  //println("Decision Graph position: " + t[(b.currentPlatform-1)].pos.x);
  //println("current platform " + (b.currentPlatform-1));
  if (keyPressed) {
    if(b.currentPlatform < 5){
    if (b.grounded()) {
      if (key == 'q') {
        choice1 = true;
        
        triggerSpike = true;
        //interpolate ball from its current position to the position of the target platform
        b.pos.x = map(b.velo.x, 40,width-40 ,b.pos.x,decisionGraph[(b.currentPlatform-1)][4].pos.x);
        
        b.pos.y = map(b.velo.y,0,695,b.pos.y,decisionGraph[(b.currentPlatform-1)][4].pos.y);
        b.currentPlatform = 5;
      } 
      if (key == 'w') {
        choice2 = true;
        triggerSpike = true;
        b.pos.x = map(b.velo.x, 40,width-40 ,b.pos.x,decisionGraph[(b.currentPlatform-1)][5].pos.x);
        
        b.pos.y = map(b.velo.y,0,695,b.pos.y,decisionGraph[(b.currentPlatform-1)][5].pos.y);
        b.currentPlatform = 6; 
        
      }
      if (key == 'o') {
        choice3 = true;
        triggerSpike = true;
        b.pos.x = map(b.velo.x, 40,width-40 ,b.pos.x,decisionGraph[(b.currentPlatform-1)][6].pos.x);
        
        b.pos.y = map(b.velo.y,0,695,b.pos.y,decisionGraph[(b.currentPlatform-1)][6].pos.y);
        b.currentPlatform = 7;
        
      }
      if (key == 'p') {
        choice4 = true;
        triggerSpike = true;
        b.pos.x = map(b.velo.x, 40,width-40 ,b.pos.x,decisionGraph[(b.currentPlatform-1)][7].pos.x);
        
        b.pos.y = map(b.velo.y,0,695,b.pos.y,decisionGraph[(b.currentPlatform-1)][7].pos.y);
        b.currentPlatform = 8;
        
      }
    }
    else {
      float target = 0;
      float dx = target - spike;
      spike += dx * 0.55;//ease rate
      triggerSpike = false;
    }
  }
  else if(b.currentPlatform > 5){
    if (b.grounded()) {
      if (key == 'q') {
        choice1 = true;
        triggerSpike = true;
        b.pos.x = map(b.velo.x, 40,width-40 ,b.pos.x,decisionGraph[(b.currentPlatform-1)][0].pos.x);
        
        b.pos.y = map(b.velo.y,0,695,b.pos.y,decisionGraph[(b.currentPlatform-1)][0].pos.y);
        b.currentPlatform = 1;
      } 
      if (key == 'w') {
        choice2 = true;
        triggerSpike = true;
        b.pos.x = map(b.velo.x, 40,width-40 ,b.pos.x,decisionGraph[(b.currentPlatform-1)][1].pos.x);
        
        b.pos.y = map(b.velo.y,0,695,b.pos.y,decisionGraph[(b.currentPlatform-1)][1].pos.y);
        b.currentPlatform = 2; 
        
      }
      if (key == 'o') {
        choice3 = true;
        triggerSpike = true;
        b.pos.x = map(b.velo.x, 40,width-40 ,b.pos.x,decisionGraph[(b.currentPlatform-1)][2].pos.x);
        
        b.pos.y = map(b.velo.y,0,695,b.pos.y,decisionGraph[(b.currentPlatform-1)][2].pos.y);
        b.currentPlatform = 3;
        
      }
      if (key == 'p') {
        choice4 = true;
        triggerSpike = true;
        map(b.velo.x,0,1,b.pos.x,decisionGraph[(b.currentPlatform-1)][3].pos.x);
        
        map(b.velo.y,0,1,b.pos.y,decisionGraph[(b.currentPlatform-1)][3].pos.y);
        b.currentPlatform = 4;
        
      }
    }
    else {
      float target = 0;
      float dx = target - spike;
      spike += dx * 0.55;//ease rate
      triggerSpike = false;
    }
  }
  }
  if (!keyPressed) {
    triggerSpike = false;
    if (key == 'q') choice1 = false;
    if (key == 'w') choice2 = false;
    if (key == 'o') choice3 = false;
    if (key == 'p') choice4 = false;
    float target = 0;
    float dx = target - spike;
    spike += dx * 0.55;//ease rate
  }
}