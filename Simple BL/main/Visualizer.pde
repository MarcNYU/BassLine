class Visualizer {
  PImage fade; 
  float rWidth, rHeight;
  int hVal;

  float bw = 0;
  // The radius of a circle
  float r = 80;

  // The width and height of the boxes (dimensions of the platforms)
  float w = 10;
  float h = 5;
  float d = 10.5;

  Visualizer() {  
    hVal = 0; //hue value
    eRadius = 20;
    rectMode(CORNER); //set rectangles to be drawn from top left corner
  }  

  void drawEQ() {
    pushMatrix(); //saves current context of the operations
    //strokeWeight(1);
    // rainbow Effect parameters
    smooth(); //linearly interpolates between color gradient
    colorMode(HSB);// sets color mode value (Hue-Saturation-Brightness or RGB)
    fill(hVal, 255, 255);//cycles through hue and brightness to expose a greater color palete (parameters are H,S,B)
    stroke(hVal, 255, 225);// sets the stroke to cycle through the whole color spectrum (Draws outline of rectangles)
    colorMode(RGB);//sets color mode back to Red green and blue //Resets color setting to RGB

    //for loop for creating the audio bars
    //translate(width/2, height-100); //Moves EQ wheel downward from center of the screen
    float arclength = 0; //Arc of the EQ wheel (distance between bars as the EQ wheel rotates)

    //noFill();
    fft.forward(mp3.mix);// used to analyze the frequency coming from the mix 

    for (int i = 0; i < fft.specSize()-170; i += 50)// specSize is changing the range of analysis (iterates through sound sample returned from fft incrementing by 50 which is the size of each line)
    {
      triangle(i/1.8, height-42, i/1.8 + 12.5, (height-42) - fft.getFreq(i)/2.8, i/1.8 + 25, height-42);
      //rect(i, height/12, 25, (height/2 - 100) - fft.getFreq(i)*1.2);// draws an inversed rect and alters its height based on the translated frequency
      //rect(i/2, height, 10, -height/2 - fft.getFreq(i)/1.2);// draws a rect and alters its height based on the translated frequency
      //triangle(i, height, i+1, fft.getFreq(i)/1.2, i+2, height);
      //w = (fft.getFreq(i)/1.2); //width is set to the frequency value 
      //// Each box is centered so we move half the width
      //arclength += d; //spaces the boxes out at intervals of size distance (d) 

      //// Angle in radians is the arclength divided by the radius
      //float theta = arclength / r;     

      //pushMatrix();
      //rotate(-(frameCount * 0.005) + (i*PI/(i*10))); //0.005 is the velocity of rotation, (i*PI/(i*10) ensures the center points are rotating uniformly  
      //// Polar to cartesian coordinate conversion
      //translate(r*cos(theta), r*sin(theta)); //used to find a point on unit circle
      //// Rotate the box
      //rotate(theta); //rotates the boxes based on the position of the circle rotation
      //rectMode(CENTER); // Draws rectangles from the center points
      //rect(0, 0, w, h);  //Initializes boxes to 0, 0

      //popMatrix();
      //// Move halfway again
      //arclength += d/2; //increments the arclength to be drawn to the next segment
    }
    
    
    hVal +=1;

    if (hVal > 255)
    {
      hVal = 0;
    }
    noStroke(); //remove outline of the circle
    fill(0);// covers up the center of the circle
    //ellipse(0, 0, r*2, r*2); // draws the full circle
    popMatrix();
  }
}