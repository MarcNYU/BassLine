class NoteSheet {
  int margin_top = 10;  // margin before top layer note
  int margin_left = 50;
  int margin_right = 50;
  int sheet_height = 20;  // width of space between line
  int x_speed = 5;  // speed of horizontal move
  int y_speed = 3;  // speed of vertical move
  
  int notes_capacity = 20;
  Note[] notes = new Note[notes_capacity];
  int start_index_notes = 0;
  int end_index_notes = 0;
  int notes_dropping_capacity = 5;
  Note[] notes_dropping = new Note[notes_dropping_capacity];
  int index_dropping = 0;

  void drawNoteSheet() {
    strokeWeight(1);
    int tempo_type = td.detectTempo();
    println(tempo_type);
    if (tempo_type == 1) {
      generateNote();
      timer = millis();
    }
    if (tempo_type == 2) {
     generateDroppingNote();
    }
    //background(0);
    drawSheet();  
    drawNotes();
    drawDroppingNotes();
  }
  void generateNote() {
    if ((end_index_notes + 1) % notes_capacity != start_index_notes) {
        notes[end_index_notes] = new Note((int)(Math.random() * 6)+1);
        end_index_notes = (end_index_notes + 1) % notes_capacity;
    }
  }
  void generateDroppingNote() {
     for (int i = 0; i < notes_dropping_capacity; ++i) {
       if (notes_dropping[i] == null || notes_dropping[i].outbound()) {
         notes_dropping[i] = new Note();
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
  void recycleNotes() {
    if (notes[start_index_notes] == null) return;
    while (notes[start_index_notes].outbound()) {
       start_index_notes = (start_index_notes + 1) % notes_capacity; 
    }
  }
  void drawNotes() {
    recycleNotes();
    for (int i = start_index_notes; i != end_index_notes; i = (i + 1) % notes_capacity) {
       notes[i].drawNote();
    }
  }
  
  void drawDroppingNotes() {
    for (int i = 0; i < notes_dropping_capacity; ++i) {
       if (notes_dropping[i] != null) {
          if (!notes_dropping[i].detectCollision()) {
            notes_dropping[i].drawNote(); 
          } else {
            notes_dropping[i] = null; 
          }
       }
    }
  }
  
  
  void setTime(int power)
  {
    switch(power)
    {
      case 1:
        currentTime = timer;
        destTime = timer + 36;
        break;
      case 2:
        currentTime = timer;
        destTime = timer + 300;
        break;
    }
  }
  
  class Note {
   

   float d = sheet_height;  // diameter of note
   float cx = 0;
   float cy;
   //float x_limit; // where does the note fall
   int powerUp;
   boolean dropping = false;
   int dx = 30;  // for initial animation
   
   Note(int layer) {  // high -> low : 1 -> 7
     cy = layer*d/2+margin_top;
     //x_limit = (float)(Math.random() * (width) / fall_freq);
     powerUp = (int)(random(1,4));                            // Selects random powerup
     //powerUp = 1;
   }
   Note() {  // dropping note
     cx = (float)(Math.random() * (width-margin_left-margin_right)+margin_left);
     cy = margin_top + sheet_height*3;
     powerUp = (int)(random(1,4));                            // Selects random powerup
     dropping = true;
   }
   void apperEffect() {
     
   }
   void drawNote() {
     noStroke();
     switch(powerUp)
     {
       case DEATH:
         fill(255, 100, 100);
         break;
       case FREEZE:
         fill(100, 200, 255);
         break;
       case LIFE:
         fill(100, 255, 100);
         break;
     }
     ellipse(cx, cy, d+dx, d+dx);
     if (dx > 0) dx -= 5;
     move();
   }
   
   void startDropping() {
     dropping = true; 
   }
   void move() {
     if (dropping) {
        cy += y_speed; 
     } else {
       cx += x_speed; 
     }
   }
   void applyPowerUp(){
    if (b.bColor == powerUp) {
      return;
    }
    switch(powerUp){
      case FREEZE:  // freeze
        hasPowerUp = true;
        frozen = true;
        setTime(1);
        break;
      case DEATH: 
        state = 2;
        break;
      case LIFE:   // second chance

        secLifeOn = true;
        //println("hii", secLifeOn);
        break;
    }
  }
  boolean detectCollision() {
    if(Math.pow((b.pos.x - cx),2) + Math.pow((b.pos.y - cy),2) < Math.pow((b.radius + d/2), 2)){
      applyPowerUp();
      return true;
    }
    return false;
  }
   boolean outbound() {
      return (cx > width || cy > ground); 
   }
  }
}