class StringSignal implements AudioSignal {
  void generate(float[] samp) {
    for (int i=0; i<samp.length; i++) {
      samp[i] = xc[monitorPoint];
      stringUpdate();
    }
  }
  void generate(float[] left, float[] right) {
    for (int i=0; i<left.length; i++) {
      left[i] = xc[monitorPoint];
      right[i] = xc[monitorPoint];
      stringUpdate();
    }
  }
}
class Line {
  float b;
  int a;
  int c;
  int r;
  float pos;
  boolean trigger;
  Line(float p) {
    b = constrain(1f*(155+0.5)/width*(num-1), 0, num-1);
    a = floor(b);
    c = ceil(b);
    pos = p;
    r = (int)random(height/2 - 10, height/2 + 10);
  }
  void updateString() {
    for (int i=1; i<num; i++) {
      float F = (xc[i]-xc[i-1])*kc+(v[i]-v[i-1])*cc;
      f[i-1] += F;
      f[i] -= F;
    }
    for (int i=0; i<num; i++) {
      v[i] += f[i];
      f[i] = 0;
      xc[i] += v[i];
      xc[i] = constrain(xc[i], -1, 1);
    }
    xc[0] = 0;
    v[0] = 0;
    xc[num-1] = 0;
    v[num-1] = 0;
    //  v[num-2] = 0;
  }
  void drawLine() {
    pushMatrix();
    stroke(255);
    translate (pos, 1);
    arrayCopy(xc, Xcopy);
    for (int i=1; i<num; i++) {
      //line(float(i-1)/(num-1)*width, (0.5+Xcopy[i-1]*0.5)*height, 
      //  float(i)/(num-1)*width, (0.5+Xcopy[i]*0.5)*height);
      line( (0.5+Xcopy[i-1]*0.5)*width, float(i-1)/(num-1)*height, 
        (0.5+Xcopy[i]*0.5)*width, float(i)/(num-1)*height);
    }
    //ellipse((0.5+Xcopy[monitorPoint]*0.5)*width, b.pos.y, 10, 10);
    popMatrix();
  }
  void triggerSpike() {
    float b = constrain(1f*(155+0.5)/width*(num-1), 0, num-1);
    int a = floor(b);
    int c = ceil(b);
    int r = (int)random(height/2 - 10, height/2 + 10);
    if (keyPressed) {
      if (key == 'b') {
        float X = xc[a]+(xc[c]-xc[a])*(b-a);
        float Xm = float(r)/(height/2)-1;
        float F = (Xm-X)*1f;
        float Fa = (c-b)*F;
        float Fc = (b-a)*F;
        f[a] += Fa;
        f[c] += Fc;
      }
    } else {
      float V = v[a]+(v[c]-v[a])*(b-a);
      float F = V*-0.95;
      float Fa = (c-b)*F;
      float Fc = (b-a)*F;
      f[a] += Fa;
      f[c] += Fc;
    }
  }
}
void initLine() {
  minimc = new Minim(this);
  outt = minimc.getLineOut();
  signal = new StringSignal();
  outt.addSignal(signal);
  stroke(255);
  //  smooth();
  ellipseMode(CENTER);
  noFill();
  xc = new float[num];
  Xcopy = new float[num];
  v = new float[num];
  f = new float[num];
}
void drawStringR() {
  pushMatrix();
  stroke(255);
  translate (200, 1);
  arrayCopy(xc, Xcopy);
  for (int i=1; i<num; i++) {
    //line(float(i-1)/(num-1)*width, (0.5+Xcopy[i-1]*0.5)*height, 
    //  float(i)/(num-1)*width, (0.5+Xcopy[i]*0.5)*height);
    line( (0.5+Xcopy[i-1]*0.5)*width, float(i-1)/(num-1)*height, 
      (0.5+Xcopy[i]*0.5)*width, float(i)/(num-1)*height);
  }
  //ellipse((0.5+Xcopy[monitorPoint]*0.5)*width, b.pos.y, 10, 10);
  popMatrix();
}
void drawStringL() {
  pushMatrix();
  stroke(255);
  translate (-200, 1);
  arrayCopy(xc, Xcopy);
  for (int i=1; i<num; i++) {
    //line(float(i-1)/(num-1)*width, (0.5+Xcopy[i-1]*0.5)*height, 
    //  float(i)/(num-1)*width, (0.5+Xcopy[i]*0.5)*height);
    line( (0.5+Xcopy[i-1]*0.5)*width, float(i-1)/(num-1)*height, 
      (0.5+Xcopy[i]*0.5)*width, float(i)/(num-1)*height);
  }
  //ellipse((0.5+Xcopy[monitorPoint]*0.5)*width, b.pos.y, 10, 10);
  popMatrix();
}
void stringUpdate() {
  for (int i=1; i<num; i++) {
    float F = (xc[i]-xc[i-1])*kc+(v[i]-v[i-1])*cc;
    f[i-1] += F;
    f[i] -= F;
  }
  for (int i=0; i<num; i++) {
    v[i] += f[i];
    f[i] = 0;
    xc[i] += v[i];
    xc[i] = constrain(xc[i], -1, 1);
  }
  xc[0] = 0;
  v[0] = 0;
  xc[num-1] = 0;
  v[num-1] = 0;
  //  v[num-2] = 0;
  press();
}
void press() {
  float b = constrain(1f*(155+0.5)/width*(num-1), 0, num-1);
  int a = floor(b);
  int c = ceil(b);
  int r = (int)random(height/2 - 10, height/2 + 10);
  if (keyPressed) {
    if (key == 'b') {
      float X = xc[a]+(xc[c]-xc[a])*(b-a);
      float Xm = float(r)/(height/2)-1;
      float F = (Xm-X)*1f;
      float Fa = (c-b)*F;
      float Fc = (b-a)*F;
      f[a] += Fa;
      f[c] += Fc;
    }
  } else {
    float V = v[a]+(v[c]-v[a])*(b-a);
    float F = V*-0.95;
    float Fa = (c-b)*F;
    float Fc = (b-a)*F;
    f[a] += Fa;
    f[c] += Fc;
  }
}