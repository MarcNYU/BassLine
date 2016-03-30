<<<<<<< HEAD
=======


>>>>>>> Tebyt
class NoteSheet {
  int margin_top = 10;  // margin before top layer note
  int sheet_height = 20;  // width of space between line
  int interval = 200;  // intervals of generating notes in milliseconds
  float fall_freq = 0.3; // frequency of note falling
  int x_speed = 5;  // speed of horizontal move
  int y_speed = 3;  // speed of vertical move
<<<<<<< HEAD
=======
  int note_limit = 20; // Maximum of notes that will appear in the screen at the same time 
  int radius = sheet_height/2;
>>>>>>> Tebyt
  
  
  int timer = millis();
  Note[] notes = new Note[20];

<<<<<<< HEAD
  void drawNoteSheet() {
    pushMatrix();
=======
  void draw() {
>>>>>>> Tebyt
    if (millis() - timer > interval) {
      generateNote();
      timer = millis();
    }
    background(0);
    drawSheet();
    for (int i = 0; i < notes.length; ++i) {
       if (notes[i] != null) {
<<<<<<< HEAD
          notes[i].drawNote();
=======
          notes[i].draw();
>>>>>>> Tebyt
          if (notes[i].outbound()) {
             notes[i] = null; 
          }
       }
    }
<<<<<<< HEAD
    popMatrix();
=======
  }
  boolean collide(Ball b) {
    for (int i = 0; i < notes.length; ++i) {
      if (Math.pow((b.pos.x - notes[i].cx),2) + Math.pow((b.pos.y - notes[i].cy), 2) < Math.pow(b.radius+ radius, 2)) {
         return true; 
      }
    }
    return false;
>>>>>>> Tebyt
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
<<<<<<< HEAD
   int d = sheet_height;
=======
   int d = radius * 2;
>>>>>>> Tebyt
   float cx = d;
   float cy;
   float x_limit; // where does the note fall
   Note(int layer) {  // high -> low : 1 -> 7
     cy = layer*d/2+margin_top;
     x_limit = (float)(Math.random() * width / fall_freq);
   }
<<<<<<< HEAD
   void drawNote() {
     pushMatrix();
     noStroke();
     fill(255);
     ellipse(cx, cy, d, d);
     move();
     popMatrix();
=======
   void draw() {
     ellipse(cx, cy, d, d);
     move();
>>>>>>> Tebyt
   }
   void move() {
     if (cx >= x_limit) {
        cy += y_speed; 
     } else {
       cx += x_speed; 
     }
   }
   boolean outbound() {
<<<<<<< HEAD
      return (cx > width || cy > ground); 
   }
  }
}
=======
      return (cx > width || cy > height); 
   }
  }
}


// Example Usage:
/*

NoteSheet ns;
void setup() {
 size(640, 360);
 ns = new NoteSheet();
}

void draw() {
 ns.draw();
 if (ns.collide(b)) {
    //handleCollide(); 
 }
}

*/
>>>>>>> Tebyt
