AudioContext ac;
PeakDetector beatDetector;

float eRadius;

void initBeat()
{
  time = millis();

  // set up the AudioContext and the master Gain object
  ac = new AudioContext();
  beads.Gain g = new beads.Gain(ac, 2, 0.2);
  ac.out.addInput(g);

  // load up a sample included in code download
  SamplePlayer sp = null;
  try
  {
    sp = new SamplePlayer(ac, new Sample(sketchPath("") + songList[currentSongIdx])); // load up a new SamplePlayer using an included audio file
    g.addInput(sp); // connect the SamplePlayer to the master Gain
  }
  catch(Exception e)
  {
    e.printStackTrace(); // if there is an error, print the steps that got us to that error
  }  

  // set up the ShortFrameSegmenter
  // this class allows us to break an audio stream into discrete chunks
  ShortFrameSegmenter sfs = new ShortFrameSegmenter(ac);
  sfs.setChunkSize(2048); // how large is each chunk?
  sfs.setHopSize(441);
  sfs.addInput(ac.out); // connect the sfs to the AudioContext

  beads.FFT fft2 = new beads.FFT();
  PowerSpectrum ps = new PowerSpectrum();

  sfs.addListener(fft2);
  fft2.addListener(ps);

  // the SpectralDifference unit generator does exactly what it sounds like
  // it calculates the difference between two consecutive spectrums returned by an FFT (through a PowerSpectrum object)
  SpectralDifference sd = new SpectralDifference(ac.getSampleRate());
  ps.addListener(sd);

  // we will use the PeakDetector object to actually find our beats
  beatDetector = new PeakDetector();
  sd.addListener(beatDetector);

  // the threshold is the gain level that will trigger the beat detector - this will vary on each recording
  beatDetector.setThreshold(0.2f);
  beatDetector.setAlpha(.9f);

  // whenever our beat detector finds a beat, set a global variable 
  beatDetector.addMessageListener
    (
    new Bead()
  {
    protected void messageReceived(Bead b)
    {
      //brightness = 1.0; 
      eRadius = 85;
      //eRadius = 20;
      //println("Is Called"); 
    }
  }
  );

  ac.out.addDependent(sfs); // tell the AudioContext that it needs to update the ShortFrameSegmenter

  ac.start(); // start working with audio data
}

// the draw method draws a shape on screen whwenever a beat is detected
void drawBeat() { 
  pushMatrix();
  //fill(brightness*255);
  //ellipse(width/2,height-100,85,85);  
  stroke(100, 255, 100);
  //strokeWeight(2);
  noFill();
  //ellipse(width/2,height-100,eRadius,eRadius);  
  ellipse(b.pos.x, b.pos.y, eRadius, eRadius);
  ellipse(b.pos.x, b.pos.y, eRadius-1, eRadius-1);

  // decrease brightness over time
  int dt = millis() - time;
  eRadius -= (dt * 0.2);
  //eRadius += (dt * 0.1);
  if (eRadius < 20) eRadius = 20;
  //if (eRadius > 85) eRadius = 85;
  time += dt; 
  // set threshold and alpha to the mouse position
  beatDetector.setThreshold(0.95);
  beatDetector.setAlpha(0.95);
  //beatDetector.setThreshold((float)width-10);
  //beatDetector.setAlpha((float)height-10);
  popMatrix();
}