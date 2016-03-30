float rate;
Delay myDelay;

class Visualizer {
  PImage fade; 
  float rWidth, rHeight;
  int hVal;
  Bar barBarR;
  Bar barBarL;
  

  // The radius of a circle
  float r = 200;
  // The width and height of the boxes (dimensions of the platforms)
  float w = 20;
  float h = 25;
  float d = 42;

  Visualizer() {  
    hVal = 0; //hue value
    rectMode(CORNER); //set rectangles to be drawn from top left corner
    
    //fade = get(0, 0, width, height); 
    //rWidth = width*0.99; 
    //rHeight = height*0.99;
  }  

  void drawBEQ()
  {
    pushMatrix(); //saves current context of the operations
    // rainbow Effect parameters
    smooth(); //linearly interpolates between color gradient
    colorMode(HSB);// sets color mode value (Hue-Saturation-Brightness or RGB)
    fill(hVal, 255, 255);//cycles through hue and brightness to expose a greater color palete (parameters are H,S,B)
    stroke(hVal, 255, 225);// sets the stroke to cycle through the whole color spectrum (Draws outline of rectangles)
    colorMode(RGB);//sets color mode back to Red green and blue //Resets color setting to RGB

    //for loop for creating the audio bars
    translate(width/2, height); //Moves EQ wheel downward from center of the screen
    float arclength = 0; //Arc of the EQ wheel (distance between bars as the EQ wheel rotates)

    //noFill();
    fft.forward(mp3.mix);// used to analyze the frequency coming from the mix 
    
    for (int i = 0; i < fft.specSize(); i += 50)// specSize is changing the range of analysis (iterates through sound sample returned from fft incrementing by 50 which is the size of each line)
    {
      w = (fft.getFreq(i)*1.2); //width is set to the frequency value 
      // Each box is centered so we move half the width
      arclength += d; //spaces the boxes out at intervals of size distance (d) 

      // Angle in radians is the arclength divided by the radius
      float theta = arclength / r;     

      pushMatrix();
      rotate(-(frameCount * 0.005) + (i*PI/(i*10))); //0.005 is the velocity of rotation, (i*PI/(i*10) ensures the center points are rotating uniformly  
      // Polar to cartesian coordinate conversion
      translate(r*cos(theta), r*sin(theta)); //used to find a point on unit circle
      // Rotate the box
      rotate(theta); //rotates the boxes based on the position of the circle rotation
      rectMode(CENTER); // Draws rectangles from the center points
      rect(0, 0, w, h);  //Initializes boxes to 0, 0
      //b = new Bar(0, 0, w, h);
      //b.drawBar();
      //b.collidesWithBar();
      popMatrix();
      // Move halfway again
      arclength += d/2; //increments the arclength to be drawn to the next segment
    }
    hVal +=1;

    if (hVal > 255)
    {
      hVal = 0;
    }
    noStroke(); //remove outline of the circle
    fill(0);// covers up the center of the circle
    ellipse(0, 0, r*2, r*2); // draws the full circle
    popMatrix();
  }
  void drawWEQ()
  {
    //noLoop();
    pushMatrix();
    // rainbow Effect parameters
    smooth();
    rectMode(CORNER);
    colorMode(HSB);// sets color mode value 
    fill(hVal, 255, 255);//cycles through hue and brightness to expose a greater color palete
    stroke(hVal, 255, 225);// sets the stroke to cycle through the whole color spectrum 
    colorMode(RGB);//sets color mode back to Red green and blue 
    //fill(EQColorR,EQColorG,EQColorB);


    //for loop for creating the audio bars
    
    fft.forward(mp3.mix);// used to analyze the frequency coming from the mix 
    
    for (int i = 0; i < fft.specSize(); i += 65)// specSize is changing the range of analysis
    {
      //float u = random(65, fft.specSize());
      
      //rect(width-40, i/1.5, -fft.getFreq(i)/1.5, 25);
      //rect(40, i/1.5, fft.getFreq(i)/1.5, 25);
      
      float target = i;
      float dx = target - rate;
      rate += dx * 1.1;//ease rate
      
      barBarR = new Bar(width-40, i/1.5, -fft.getFreq(i)/1.5, 25);
      barBarR.drawBar();
      barBarR.collidesWithBar();
      
      barBarL = new Bar(40, i/1.5, fft.getFreq(i)/1.5, 25);
      barBarL.drawBar();
      barBarL.collidesWithBar();
      
      //triangle(40, i/1.5, 40+fft.getFreq(i)/1.1, (i/1.5)+12.5, 40, (i/1.5)+25);
      //triangle(width-40, i/1.5, width-40-fft.getFreq(i)/1.1, (i/1.5)+12.5, width-40, (i/1.5)+25);
      //s = new Spike(width-40, i/1.5, width-40-fft.getFreq(i)/1.1, (i/1.5)+12.5, width-40, (i/1.5)+25);
      //s.drawSpike();
    }

    hVal +=1;

    if (hVal > 255)
    {
      hVal = 0;
    }
    popMatrix();
  }
}