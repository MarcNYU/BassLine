class NoteSheet {
  int margin_top = 10;  // margin before top layer note
  int sheet_height = 20;  // width of space between line
  int interval = 200;  // intervals of generating notes in milliseconds
  float fall_freq = 0.3; // frequency of note falling
  int drop_margin = 40;  // left and right margin of balls dropping
  int x_speed = 5;  // speed of horizontal move
  int y_speed = 3;  // speed of vertical move
  int radius = sheet_height / 2;
  
  
  int timer = millis();
  Note[] notes = new Note[20];

  void drawNoteSheet() {
    pushMatrix();
    if (millis() - timer > interval) {
      generateNote();
      timer = millis();
    }
    background(0);
    drawSheet();
    for (int i = 0; i < notes.length; ++i) {
       if (notes[i] != null) {
          notes[i].drawNote();
          if (notes[i].outbound()) {
             notes[i] = null; 
          }
       }
    }
    popMatrix();
  }
  boolean collide(Ball b) {
    for (int i = 0; i < notes.length; ++i) {
      if (Math.pow((b.pos.x - notes[i].cx),2) + Math.pow((b.pos.y - notes[i].cy), 2) < Math.pow(b.radius+ radius, 2)) {
        notes[i] = null;
        return true; 
      }
    }
    return false;
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
  
  class Note {
   int d = radius * 2;
   float cx = d;
   float cy;
   float x_limit; // where does the note fall
   Note(int layer) {  // high -> low : 1 -> 7
     cy = layer*d/2+margin_top;
     if (Math.random() > fall_freq) {
       x_limit = width * 2; 
     } else {
       x_limit = (float)((Math.random() * (width-drop_margin*2))+drop_margin);
     }
   }
   void drawNote() {
     pushMatrix();
     noStroke();
     fill(255);
     ellipse(cx, cy, d, d);
     move();
     popMatrix();
   }
   void move() {
     if (cx >= x_limit) {
        cy += y_speed; 
     } else {
       cx += x_speed; 
     }
   }
   boolean outbound() {
      return (cx > width || cy > ground); 
   }
  }
}