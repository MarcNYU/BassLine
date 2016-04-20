class Beat {
 int time;
 void reset() {
    eRadius = 85;
    time = millis();
 }
 void draw() {
   
   fill(255);
    ellipse(width/2,height-100,eRadius,eRadius);  
    
    // decrease brightness over time
    int dt = millis() - time;
    eRadius -= (dt * 0.2);
    //if (brightness < 0) brightness = 0;
    if (eRadius < 20) eRadius = 20;
    time  = millis(); 
    //fill(brightness * 255);
    //ellipse(width/2,height-100,85,85);  
    
    //// decrease brightness over time
    //int dt = millis() - time;
    //brightness -= (dt * 0.005);
    //println(brightness);
    //if (brightness < 0) brightness = 0;
    //time = millis(); 
    //// set threshold and alpha to the mouse position
    ////beatDetector.setThreshold((float)mouseX/width);
    ////beatDetector.setAlpha((float)mouseY/height);
 }
}