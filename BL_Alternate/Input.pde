

void handleInputs() {
  
  //println("t1 position: " + t2.pos.x);
  println("Decision Graph position: " + decisionGraph[3][4].pos.x);
  
  //println("Decision Graph position: " + t[(b.currentPlatform-1)].pos.x);
  //println("current platform " + (b.currentPlatform-1));
  if (keyPressed) {
    if(b.currentPlatform < 5){
    //if (b.grounded()) {
      if (key == 'q') {
        choice1 = true;
        
        triggerSpike = true;
        //interpolate ball from its current position to the position of the target platform
        PVector target = new PVector(decisionGraph[(b.currentPlatform-1)][4].pos.x, decisionGraph[(b.currentPlatform-1)][4].pos.y);
        b.pos.lerp(target,0.5);
        println("Ball current position: " + b.pos + " Platform Target Position: " + target);
        //b.pos.x = map(b.velo.x, 40,width-40 ,b.pos.x,decisionGraph[(b.currentPlatform-1)][4].pos.x);
        
        //b.pos.y = map(b.velo.y,0,695,b.pos.y,decisionGraph[(b.currentPlatform-1)][4].pos.y);
        b.currentPlatform = 5;
      } 
      else if (key == 'w') {
        choice2 = true;
        triggerSpike = true;
        PVector target2 = new PVector(decisionGraph[(b.currentPlatform-1)][5].pos.x, decisionGraph[(b.currentPlatform-1)][5].pos.y);
        b.pos.lerp(target2,0.5);
        //b.pos.x = map(b.velo.x, 40,width-40 ,b.pos.x,decisionGraph[(b.currentPlatform-1)][5].pos.x);
        
        //b.pos.y = map(b.velo.y,0,695,b.pos.y,decisionGraph[(b.currentPlatform-1)][5].pos.y);
        b.currentPlatform = 6; 
        
      }
      else if (key == 'o') {
        choice3 = true;
        triggerSpike = true;
        PVector target3 = new PVector(decisionGraph[(b.currentPlatform-1)][6].pos.x, decisionGraph[(b.currentPlatform-1)][6].pos.y);
        b.pos.lerp(target3,0.5);
        //b.pos.x = map(b.velo.x, 40,width-40 ,b.pos.x,decisionGraph[(b.currentPlatform-1)][6].pos.x);
        
        //b.pos.y = map(b.velo.y,0,695,b.pos.y,decisionGraph[(b.currentPlatform-1)][6].pos.y);
        b.currentPlatform = 7;
        
      }
      else if (key == 'p') {
        choice4 = true;
        triggerSpike = true;
        PVector target4 = new PVector(decisionGraph[(b.currentPlatform-1)][7].pos.x, decisionGraph[(b.currentPlatform-1)][7].pos.y);
        b.pos.lerp(target4,0.5);
        //b.pos.x = map(b.velo.x, 40,width-40 ,b.pos.x,decisionGraph[(b.currentPlatform-1)][7].pos.x);
        
        //b.pos.y = map(b.velo.y,0,695,b.pos.y,decisionGraph[(b.currentPlatform-1)][7].pos.y);
        b.currentPlatform = 8;
        
      }
  //  }
    else {
      float target = 0;
      float dx = target - spike;
      spike += dx * 0.55;//ease rate
      triggerSpike = false;
    }
  }
  else if(b.currentPlatform > 5){
    //if (b.grounded()) {
      if (key == 'q') {
        choice1 = true;
        triggerSpike = true;
        PVector target5 = new PVector(decisionGraph[(b.currentPlatform-1)][0].pos.x, decisionGraph[(b.currentPlatform-1)][0].pos.y);
        b.pos.lerp(target5,0.5);
        //b.pos.x = map(b.velo.x, 40,width-40 ,b.pos.x,decisionGraph[(b.currentPlatform-1)][0].pos.x);
        
        //b.pos.y = map(b.velo.y,0,695,b.pos.y,decisionGraph[(b.currentPlatform-1)][0].pos.y);
        b.currentPlatform = 1;
      } 
      else if (key == 'w') {
        choice2 = true;
        triggerSpike = true;
        PVector target6 = new PVector(decisionGraph[(b.currentPlatform-1)][1].pos.x, decisionGraph[(b.currentPlatform-1)][1].pos.y);
        b.pos.lerp(target6,0.5);
        //b.pos.x = map(b.velo.x, 40,width-40 ,b.pos.x,decisionGraph[(b.currentPlatform-1)][1].pos.x);
        
        //b.pos.y = map(b.velo.y,0,695,b.pos.y,decisionGraph[(b.currentPlatform-1)][1].pos.y);
        b.currentPlatform = 2; 
        
      }
      else if (key == 'o') {
        choice3 = true;
        triggerSpike = true;
        PVector target7 = new PVector(decisionGraph[(b.currentPlatform-1)][2].pos.x, decisionGraph[(b.currentPlatform-1)][2].pos.y);
        b.pos.lerp(target7,0.5);
        //b.pos.x = map(b.velo.x, 40,width-40 ,b.pos.x,decisionGraph[(b.currentPlatform-1)][2].pos.x);
        
        //b.pos.y = map(b.velo.y,0,695,b.pos.y,decisionGraph[(b.currentPlatform-1)][2].pos.y);
        b.currentPlatform = 3;
        
      }
      else if (key == 'p') {
        choice4 = true;
        triggerSpike = true;
        PVector target8 = new PVector(decisionGraph[(b.currentPlatform-1)][3].pos.x, decisionGraph[(b.currentPlatform-1)][3].pos.y);
        b.pos.lerp(target8,0.5);
        //map(b.velo.x,0,1,b.pos.x,decisionGraph[(b.currentPlatform-1)][3].pos.x);
        
        //map(b.velo.y,0,1,b.pos.y,decisionGraph[(b.currentPlatform-1)][3].pos.y);
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
  //}
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