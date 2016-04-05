class Camera {
  PVector pos; //Camera's position
  //The Camera should sit in the top left of the window
  Camera() {
    pos = new PVector(0, 0);
    //You should play with the program and code to see how the staring position can be changed
  }
  void drawC() {
    if (b.pos.y < height/4) {
      pos.y+=2.9;
    } 
  }
}