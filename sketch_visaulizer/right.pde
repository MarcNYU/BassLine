Note n;
float x = 500;

class right {
  PImage fade;
  float rWidth, rHeight;
  int hVal;
  float nVal; // noise value
  float nInt = 1; // noise intensity
  float nAmp = 1; // noise amplitude
  float t = 0;
  float tChange = .02;
  
  right() {  
    hVal = 0;
    //rectMode(CORNERS);
    rectMode(CORNER);
    fade = get(0, 0, width, height);
    rWidth = width*0.99;
    rHeight = height*0.99;
  }  

  void drawEQ()
  {
    pushMatrix();
    // rainbow Effect parameters
    smooth();
    colorMode(HSB);// sets color mode value 
    fill(hVal, 255, 255);//cycles through hue and brightness to expose a greater color palete
    stroke(hVal, 255, 225);// sets the stroke to cycle through the whole color spectrum 
    colorMode(RGB);//sets color mode back to Red green and blue 
    //fill(EQColorR,EQColorG,EQColorB);


    //for loop for creating the audio bars
    //translate(width/2, height/2);
    //noFill();
    //beginShape();
    fft.forward(mp3.mix);// used to analyze the frequency coming from the mix 
    for (int i = 0; i < fft.specSize(); i += 50)// specSize is changing the range of analysis
    {
      
      //rect(i, height/12, 25, (height/2 - 100) - fft.getFreq(i)*1.2);// draws an inversed rect and alters its height based on the translated frequency
      //rect(i, height+50, 25, -height/2 - fft.getFreq(i)*1.2);// draws a rect and alters its height based on the translated frequency
      //rect(width, i/1.8, -10 - fft.getFreq(i)*1.2, 25);
      triangle(width, i/1.8, -fft.getFreq(i)/1000, i/1.8 + 12.5, width, i/1.8 + 25);
      //x-=.01;
      if (fft.getFreq(i)*1.2 > 1) {
        n = new Note(x, i/1.8, 5, 25);
        //x-=.01;
        n.draw();
      }
    }
    hVal +=1;
    t += tChange;

    if (hVal > 255)
    {
     hVal = 0;
    }
    popMatrix();
  }
}

class Note {
  PVector pos;
  PVector dem;
  float speed;
  
  Note(float x, float y, float w, float h) {
    pos = new PVector(x, y);
    dem = new PVector(w, h);
    speed = 2.1;
  }
  
  void draw() {
    pushMatrix();
    //pos.x-=.01;
    noStroke();
    fill(255);
    rect(pos.x, pos.y, dem.x, dem.y);
    popMatrix();
  }
}