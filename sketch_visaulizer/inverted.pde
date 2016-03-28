class b {
  PImage fade;
  float rWidth, rHeight;
  int hVal;

  // The radius of a circle
  float r = 95;
  // The width and height of the boxes
  float w = 20;
  float h = 20;
  float d = 20;
  
  b() {  
    //output = createWriter("data.txt");
    hVal = 0;
    //rectMode(CORNERS);
    rectMode(CORNER);
    fade = get(0, 0, width, height);
    rWidth = width*0.99;
    rHeight = height*0.99;
  }  

  void drawEQ()
  {
    // rainbow Effect parameters
    smooth();
    colorMode(HSB);// sets color mode value 
    fill(hVal, 255, 255);//cycles through hue and brightness to expose a greater color palete
    stroke(hVal, 255, 225);// sets the stroke to cycle through the whole color spectrum 
    colorMode(RGB);//sets color mode back to Red green and blue 
    //fill(EQColorR,EQColorG,EQColorB);


    //for loop for creating the audio bars
    translate(width/2, height/2);
    float arclength = 0;
    
    //noFill();
    fft.forward(mp3.mix);// used to analyze the frequency coming from the mix 
    for (int i = 0; i < fft.specSize(); i += 50)// specSize is changing the range of analysis
    {
      w = (fft.getFreq(i)*1.2)/2;
      // Each box is centered so we move half the width
      arclength += d;
      // Angle in radians is the arclength divided by the radius
      float theta = arclength / r;     

      pushMatrix();
      rotate(-(frameCount * 0.005) + (i*PI/(i*10)));
      // Polar to cartesian coordinate conversion
      translate(r*cos(theta), r*sin(theta));
      // Rotate the box
      rotate(theta);
      // Display the box
      //fill(0, 100);
      rectMode(CENTER);
      rect(0, 0, w, h);  
      popMatrix();
      // Move halfway again
      arclength += d/2;
    }
    //endShape(CLOSE);
    //fade = get(0, 0, width, height);
    hVal +=1;

    if (hVal > 255)
    {
      hVal = 0;
    }
    noStroke();
    fill(0);
    ellipse(0, 0, r*2, r*2);
  }
}