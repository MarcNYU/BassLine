class NoteSheet {
  int margin_top = 10;  // margin before top layer note
  int sheet_height = 20;  // width of space between line
  int interval = 200;  // intervals of generating notes in milliseconds
  float fall_freq = 0.18; // frequency of note falling
  int x_speed = 5;  // speed of horizontal move
  int y_speed = 3;  // speed of vertical move
  
  
  int timer = millis();
  Note[] notes = new Note[20];

  void drawNoteSheet() {
    pushMatrix();
    strokeWeight(1);
    if (millis() - timer > interval) {
      generateNote();
      timer = millis();
    }
    //background(0);
    drawSheet();
    for (int i = 0; i < notes.length; ++i) {
       if (notes[i] != null) {
          notes[i].drawNote();
          if( notes[i].checkBallCollsion() )        //Checks for note, ball collision
          {
            applyPowerUp(notes[i]);  
          }
          if (notes[i].outbound() || notes[i].checkBallCollsion()) {
          notes[i] = null;
        }
       }
    }
    popMatrix();
  }
  void generateNote() {
    for (int i = 0; i < notes.length; ++i) {
      if (notes[i] == null) {
         notes[i] = new Note((int)(Math.random() * 6)+1); 
         return;
      }
    }
  }
  void drawSheet() {
    stroke(255);
    pushMatrix();
    translate(0, margin_top);
    for (int i = 1; i <= 3; ++i) {
      translate(0, sheet_height);
      line(0, 0, width, 0);
    }
    popMatrix();
  }
  
  void applyPowerUp(Note n){
    switch(n.getPowerUp()){
      case 1:  // freeze
        if(hasPowerUp == false){
          hasPowerUp = true;
          frozen = true;
          setTime(1);
        }
        break;
      case 2:   // increase player size
        if(hasPowerUp == false){
          hasPowerUp = true;
          increase = true;
          setTime(2);
        }
        break;
      case 3:   // second chance

        secLifeOn = true;
        //println("hii", secLifeOn);
        break;
      
      
    }
  }
  
  void setTime(int power)
  {
    switch(power)
    {
      case 1:
        currentTime = timer;
        destTime = timer + 45;
        break;
      case 2:
        currentTime = timer;
        destTime = timer + 300;
        break;
    }
  }
  
  class Note {
   int d = sheet_height;
   float cx = d;
   float cy;
   float x_limit; // where does the note fall
   int powerUp;
   
   Note(int layer) {  // high -> low : 1 -> 7
     cy = layer*d/2+margin_top;
     x_limit = (float)(Math.random() * (width) / fall_freq);
     //powerUp = (int)(random(1,4));                            // Selects random powerup
     powerUp = 1;
   }
   void drawNote() {
     pushMatrix();
     noStroke();
     //fill(255);
     switch(powerUp)
     {
       case 1:
         fill(255, 100, 100);
         break;
       case 2:
         fill(255, 100, 200);
         break;
       case 3:
         fill(255, 200, 100);
         break;
     }
     ellipse(cx, cy, d, d);
     move();
     popMatrix();
   }
   void move() {
     if (cx >= x_limit && cx > 150 && cx < width-150) {
        cy += y_speed; 
     } else {
       cx += x_speed; 
     }
   }
   boolean outbound() {
      return (cx > width || cy > ground); 
   }
   boolean checkBallCollsion()
   {
     // Check right collision
     if( b.pos.x + 10 > cx - 12.5 && b.pos.x + 10 < cx + 12.5)
     {
       if( b.pos.y + 10 > cy - 12.5 && b.pos.y + 10 < cy + 12.5 )
       {
         //println("hit right", b.pos.y +10, cy - 12.5, cy + 12.5 );
         return true;
       }
       else if( b.pos.y - 10 > cy - 12.5 && b.pos.y - 10 < cy + 12.5 )
       {
         //println("hit right", b.pos.y -10, cy - 12.5, cy + 12.5);
         return true;
       }
     }
     // Check left collision
     else if( b.pos.x - 10 > cx -12.5 && b.pos.x - 10 < cx + 12.5)
     {
        if( b.pos.y - 10 > cy +12.5 && b.pos.y - 10 < cy - 12.5 )
        {
          //println("hit leftl", b.pos.y -10, cy - 12.5, cy + 12.5);
          return true;
        }
        else if( b.pos.y + 10 > cy -12.5 && b.pos.y +10 < cy + 12.5)
        {
          //println("hit leftr", b.pos.y +10, cy - 12.5, cy + 12.5);
          return true;
        }
     }
     return false;
   }
   int getPowerUp()
   {
     return powerUp;
   }
  }
}