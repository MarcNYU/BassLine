Boolean withinRange(float mouse_x, float mouse_y, float target_x, float target_y){
  if(dist(mouse_x,mouse_y, target_x,target_y) <= 80){
    //println("within range, current platform: " + b.currentPlatform);
    return true;
  }
  else{
    //println("not within range, current platform: " + b.currentPlatform );    
   return false; 
  }
  
  
}


void handleInputs() {
  if (mousePressed) {
    
    if(b.currentPlatform < 5){
      
    //if (b.grounded()) {
      //if (key == 'q') {
        if (withinRange(mouseX,mouseY,t5.pos.x,t5.pos.y)) {
          println("can move to platform 5");

        choice1 = true;
        
        choice8 = false;
        choice7 = false;
        choice6 = false;
        choice5 = true; 
        choice2 = false;
        choice3 = false;
        choice4 = false;
        
        triggerSpike = true;

      } 
      //else if (key == 'w') {
        else if (withinRange(mouseX,mouseY,t6.pos.x,t6.pos.y)) {
          println("platform 6 selected");
        choice2 = true;
        
        choice1 = false;
        choice3 = false;
        choice4 = false;
        choice8 = false;
        choice7 = false;
        choice6 = false;
        choice5 = false; 
        triggerSpike = true;

      }
      //else if (key == 'o') {
        else if (withinRange(mouseX,mouseY,t7.pos.x,t7.pos.y)) {
          println("platform 7 selected");
        choice3 = true;
        
        choice1 =false;
        choice2 = false;
        choice4 = false;
        choice8 = false;
        choice7 = false;
        choice6 = false;
        choice5 = false; 
        
        triggerSpike = true;

        
      }
      //else if (key == 'p') {
        else if (withinRange(mouseX,mouseY,t8.pos.x,t8.pos.y)) {
          println("platform 8 selected");
        choice4 = true;
        
        choice1 =false;
        choice2 = false;
        choice3 = false;
        choice8 = false;
        choice7 = false;
        choice6 = false;
        choice5 = false; 
        triggerSpike = true;

        
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
      //if (key == 'q') {
       if (withinRange(mouseX,mouseY,t1.pos.x,t1.pos.y)) {
         println("platform 1 selected");
        choice5 = true;
        
        choice3 =false;
        choice2 = false;
        choice4 = false;
        choice8 = false;
        choice7 = false;
        choice6 = false;
        choice1 = false; 
        triggerSpike = true;

      } 
      //else if (key == 'w') {
       else if (withinRange(mouseX,mouseY,t2.pos.x,t2.pos.y)) {
         println("platform 2 selected");
        choice6 = true;
        
        choice1 =false;
        choice3 = false;
        choice4 = false;
        choice8 = false;
        choice7 = false;
        choice2 = false;
        choice5 = false; 
        triggerSpike = true;

      }
      //else if (key == 'o') {
       else if (withinRange(mouseX,mouseY,t3.pos.x,t3.pos.y)) {
         println("platform 3 selected");
        choice7 = true;
        
        choice1 =false;
        choice3 = false;
        choice4 = false;
        choice8 = false;
        choice2 = false; //<>//
        choice6 = false;
        choice5 = false;
        triggerSpike = true;

      }
      //else if (key == 'p') {
       else if (withinRange(mouseX,mouseY,t4.pos.x,t4.pos.y)) {
         println("platform 4 selected");
        choice8 = true;
        
        choice1 =false;
        choice3 = false;
        choice4 = false;
        choice6 = false;
        choice7 = false;
        choice2 = false;
        choice5 = false;
        triggerSpike = true;

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
  if (!mousePressed) {
    triggerSpike = false;

    float target = 0;
    float dx = target - fws;
    float dt = target - lws;
    float dl = target - rws;
    fws += dx * 0.35;//ease rate
    lws += dt * 0.35;//ease rate
    rws += dl * 0.35;//ease rate
  }
}


void keyPressed() {
  if (key == ESC) { 
    mp3.close();
  } else if (key == DELETE || key == BACKSPACE) {
    PlayTest = false; //kills the program
  } else if (key == TAB) {
    turnGridOn = !turnGridOn;
  }
}

void mouseClicked() {
  //println("mouse pressed");
  
  pct = 0.0;
  beginX = b.pos.x;
  beginY = b.pos.y;
  
  
  if (b.currentPlatform < 5) {
    if (choice1) {
      PVector target = new PVector(decisionGraph[(b.currentPlatform-1)][4].pos.x, decisionGraph[(b.currentPlatform-1)][4].pos.y);
      //b.pos.lerp(target, 1);
      endX = target.x;
      endY = target.y;
      
      b.currentPlatform = 5;
    } else if (choice2) {
      PVector target2 = new PVector(decisionGraph[(b.currentPlatform-1)][5].pos.x, decisionGraph[(b.currentPlatform-1)][5].pos.y);
      //b.pos.lerp(target2, 1);
      endX = target2.x;
      endY = target2.y;
      
      b.currentPlatform = 6;
    } else if (choice3) {
      PVector target3 = new PVector(decisionGraph[(b.currentPlatform-1)][6].pos.x, decisionGraph[(b.currentPlatform-1)][6].pos.y);
      //b.pos.lerp(target3, 1);
      endX = target3.x;
      endY = target3.y;
      
      b.currentPlatform = 7;
    } else if (choice4) {
      
      PVector target4 = new PVector(decisionGraph[(b.currentPlatform-1)][7].pos.x, decisionGraph[(b.currentPlatform-1)][7].pos.y);
      //b.pos.lerp(target4, 1);
      endX = target4.x;
      endY = target4.y;
      
      b.currentPlatform = 8;
      println("current platform: " + b.currentPlatform);
    }
  } else if (b.currentPlatform >= 5) {
    println("choice1 is: " +choice1);
    if (choice5) {
      PVector target5 = new PVector(decisionGraph[(b.currentPlatform-1)][0].pos.x, decisionGraph[(b.currentPlatform-1)][0].pos.y);
      //b.pos.lerp(target5, 1);
      endX = target5.x;
      endY = target5.y;
      println("choice1 is: " +choice1);
      b.currentPlatform = 1;
    } else if (choice6) {
      PVector target6 = new PVector(decisionGraph[(b.currentPlatform-1)][1].pos.x, decisionGraph[(b.currentPlatform-1)][1].pos.y);
      //b.pos.lerp(target6, 1);
      endX = target6.x;
      endY = target6.y;
      b.currentPlatform = 2;
    } else if (choice7) {
      PVector target7 = new PVector(decisionGraph[(b.currentPlatform-1)][2].pos.x, decisionGraph[(b.currentPlatform-1)][2].pos.y);
      //b.pos.lerp(target7, 1);
      endX = target7.x;
      endY = target7.y;
      b.currentPlatform = 3;
    } else if (choice8) {
      PVector target8 = new PVector(decisionGraph[(b.currentPlatform-1)][3].pos.x, decisionGraph[(b.currentPlatform-1)][3].pos.y);
      //b.pos.lerp(target8, 1);
      endX = target8.x;
      endY = target8.y;
      b.currentPlatform = 4;
    }
  }
  
  distX = endX - beginX;
  distY = endY - beginY;
}