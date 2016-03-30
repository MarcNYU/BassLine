void handleInputsOld() {
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




void handleInputs() {
  
  //println("t1 position: " + t2.pos.x);
  //println("Decision Graph position: " + decisionGraph[3][4].pos.x);
  
  //println("Decision Graph position: " + t[(b.currentPlatform-1)].pos.x);
  //println("current platform " + (b.currentPlatform-1));
  if (keyPressed) {
    if(b.currentPlatform < 5){
    //if (b.grounded()) {
      if (key == 'q') {
        for(int i = 0; i < 8; i++){
          // for(int j = 0; j <8; j++){
             // println(decisionGraph[i][0].pos +" "+ decisionGraph[i][1].pos + " "+ decisionGraph[i][2].pos + " "+decisionGraph[i][3].pos + " "+ decisionGraph[i][4].pos + " "+decisionGraph[i][5].pos + " "+ decisionGraph[i][6].pos + " "+ decisionGraph[i][7].pos); 
           //}
        }
        choice1 = true;    
        triggerSpike = true;
        //interpolate ball from its current position to the position of the target platform
        PVector target = new PVector(decisionGraph[(b.currentPlatform-1)][4].pos.x, decisionGraph[(b.currentPlatform-1)][4].pos.y);
        b.pos.lerp(target,1);
        
        println("  Decision Space: [ " );
        for(int i = 0; i < 8; i++){
         if(!(decisionGraph[(b.currentPlatform-1)][i].isNull)){
           println(decisionGraph[(b.currentPlatform-1)][i].platformIdx + " , ");
         }
        }
        println("]");
        
        b.currentPlatform = 5;
      } 
      else if (key == 'w') {
        choice2 = true;
        triggerSpike = true;
        PVector target2 = new PVector(decisionGraph[(b.currentPlatform-1)][5].pos.x, decisionGraph[(b.currentPlatform-1)][5].pos.y);
        b.pos.lerp(target2,1);
        
        
        //println("Ball current position: " + b.pos + " Platform Target Position: " + target2);
        println(" Decision Space: [ " );
        for(int i = 0; i < 8; i++){
         if(!(decisionGraph[(b.currentPlatform-1)][i].isNull)){
           println(decisionGraph[(b.currentPlatform-1)][i].platformIdx + " , ");
         }
        }
        println("]");
        b.currentPlatform = 6;
      }
      else if (key == 'o') {
        choice3 = true;
        triggerSpike = true;
        PVector target3 = new PVector(decisionGraph[(b.currentPlatform-1)][6].pos.x, decisionGraph[(b.currentPlatform-1)][6].pos.y);
        b.pos.lerp(target3,1);
        
        println(" Decision Space: [ " );
        for(int i = 0; i < 8; i++){
         if(!(decisionGraph[(b.currentPlatform-1)][i].isNull)){
           println(decisionGraph[(b.currentPlatform-1)][i].platformIdx + " , ");
         }
        }
        println("]");
        b.currentPlatform = 7;
        
      }
      else if (key == 'p') {
        choice4 = true;
        triggerSpike = true;
        PVector target4 = new PVector(decisionGraph[(b.currentPlatform-1)][7].pos.x, decisionGraph[(b.currentPlatform-1)][7].pos.y);
        b.pos.lerp(target4,1);
        
        println(" Decision Space: [ " );
        for(int i = 0; i < 8; i++){
        if(!(decisionGraph[(b.currentPlatform-1)][i].isNull)){
          println(decisionGraph[(b.currentPlatform-1)][i].platformIdx + " , ");
        }
        }
        println("]");
        b.currentPlatform = 8;
        
      }
  //  }
    else {
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
  else if(b.currentPlatform >= 5){
    //if (b.grounded()) {
      if (key == 'q') {
        choice1 = true;
        triggerSpike = true;
        PVector target5 = new PVector(decisionGraph[(b.currentPlatform-1)][3].pos.x, decisionGraph[(b.currentPlatform-1)][3].pos.y);
        b.pos.lerp(target5,1);
        
        println(" Decision Space: [ " );
        for(int i = 0; i < 8; i++){
          if(!(decisionGraph[(b.currentPlatform-1)][i].isNull)){
            println(decisionGraph[(b.currentPlatform-1)][i].platformIdx + " , ");
          }
        }
        println("]");
        b.currentPlatform = 1;
      } 
      else if (key == 'w') {
        choice2 = true;
        triggerSpike = true;
        PVector target6 = new PVector(decisionGraph[(b.currentPlatform-1)][2].pos.x, decisionGraph[(b.currentPlatform-1)][2].pos.y);
        b.pos.lerp(target6,1);
        
        println(" Decision Space: [ " );
        for(int i = 0; i < 8; i++){
          if(!(decisionGraph[(b.currentPlatform-1)][i].isNull)){
            println(decisionGraph[(b.currentPlatform-1)][i].platformIdx + " , ");
          }
        }
        println("]");
        b.currentPlatform = 2; 
        
      }
      else if (key == 'o') {
        choice3 = true;
        triggerSpike = true;
        PVector target7 = new PVector(decisionGraph[(b.currentPlatform-1)][1].pos.x, decisionGraph[(b.currentPlatform-1)][1].pos.y);
        b.pos.lerp(target7,1);
        
        println(" Decision Space: [ " );
        for(int i = 0; i < 8; i++){
          if(!(decisionGraph[(b.currentPlatform-1)][i].isNull)){
            println(decisionGraph[(b.currentPlatform-1)][i].platformIdx + " , ");
          }
        }
        println("]");
        b.currentPlatform = 3;
        
      }
      else if (key == 'p') {
        choice4 = true;
        triggerSpike = true;
        PVector target8 = new PVector(decisionGraph[(b.currentPlatform-1)][0].pos.x, decisionGraph[(b.currentPlatform-1)][0].pos.y);
        b.pos.lerp(target8,1);
        
        println(" Decision Space: [ " );
        for(int i = 0; i < 8; i++){
          if(!(decisionGraph[(b.currentPlatform-1)][i].isNull)){
            println(decisionGraph[(b.currentPlatform-1)][i].platformIdx + " , ");
          }
        }
        println("]");
        b.currentPlatform = 4;
        
      }
    }
    else {
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
  //}
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