PrintWriter output;
class visualizer {
  PImage fade;
  float rWidth, rHeight;
  int hVal;
  float nVal; // noise value
  float nInt = 1; // noise intensity
  float nAmp = 1; // noise amplitude
  float t = 0;
  float tChange = .02;
  visualizer() {  
    //output = createWriter("music.txt");
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
    //translate(width/2, height/2);
    //noFill();
    //beginShape();
    fft.forward(mp3.mix);// used to analyze the frequency coming from the mix 
    for (int i = 0; i < fft.specSize(); i += 50)// specSize is changing the range of analysis
    {
      //translate(1, 1);
      //rect(x1, y1, x2, y2)
      //change to:
      //rect(x, y, w, h);
      //println((height/2 - 100) - fft.getFreq(i)*1.2);
      //output.println(fft.getFreq(i)*1.2);
      
      rect(i, height/12, 25, (height/2 - 100) - fft.getFreq(i)*1.2);// draws an inversed rect and alters its height based on the translated frequency
      rect(i, height+50, 25, -height/2 - fft.getFreq(i)*1.2);// draws a rect and alters its height based on the translated frequency
      
      //rotate(0.02);
      
      //rect(i, height/12, i + 25, (height/2 - 100) - fft.getFreq(i)*1.2);// draws an inversed rect and alters its height based on the translated frequency
      //rect(i, height*12, i + 25, height/2 - fft.getFreq(i)*1.2);// draws a rect and alters its height based on the translated frequency
      
      //nInt = map(fft.getFreq(i)*1.2, 0, width, 0.1, 30); // map jmp to noise intensity
      //nAmp = map(fft.getFreq(i)*1.2, 0, height, 0.0, 1.0); // map jmp to noise amplitude
      
      //nVal = map(noise( cos(i)*nInt+1, sin(i)*nInt+1, t ), 0.0, 1.0, nAmp, 1.0);
      
      
      //vertex(cos(i)*100 *nVal, sin(i)*100 *nVal);
      //vertex(cos(i)*100 *nVal, sin(i)*100 *nVal);
      
    }
    //endShape(CLOSE);
    //fade = get(0, 0, width, height);
    hVal +=1;
    t += tChange;

    if (hVal > 255)
    {
     hVal = 0;
    }
  }
}