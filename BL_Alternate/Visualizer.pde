float yoff = 0.0;  // 2nd dimension of perlin noise
float nInt = 1;    // noise intensity
float nAmp = 1;    // noise amplitude
float y;

class Visualizer {
  PImage fade;
  float rWidth, rHeight;
  int hVal;

  // The radius of a circle
  float r = 200;
  // The width and height of the boxes
  float w = 20;
  float h = 25;
  float d = 42;
  
  Visualizer() {  
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
    drawLine();
    // rainbow Effect parameters
    smooth();
    colorMode(HSB);// sets color mode value 
    fill(hVal, 255, 255);//cycles through hue and brightness to expose a greater color palete
    stroke(hVal, 255, 225);// sets the stroke to cycle through the whole color spectrum 
    colorMode(RGB);//sets color mode back to Red green and blue 
    //fill(EQColorR,EQColorG,EQColorB);


    //for loop for creating the audio bars
    translate(width/2, height);
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

void drawLine() {
  stroke(255);
  noFill();
  //fill(0);
  beginShape(); 

    float xoff = 0;       // Option #1: 2D Noise

    // Iterate over horizontal pixels
    for (float x = 0; x <= width; x += 10) {
      // Calculate a y value according to noise, map to 
      if (spike >= 0) {
        y = map(noise(xoff*nInt+1, yoff*nAmp+1), 0, 1, 200, 300); // Option #1: 2D Noise
      } 
      if (spike <= 1) {
        y = 260;
      }
      //println(spike);
      //float y = map(noise(cos(xoff)*nInt+1, sin(yoff)*nAmp+1), 0, 1, 200,300); // Option #2: map noise value to match the amplitude
      //println(y);
      // Set the vertex
      vertex(x, y*1.65); 
      // Increment x dimension for noise
      xoff += 0.05;
    }
    // increment y dimension for noise
    yoff += 0.01;
    vertex(width, height);
    vertex(0, height);
    endShape(CLOSE);
}