float space = 172.5 + UY;

Trigger t1 = new Trigger(40, space, 10, 50);//x=40
Trigger t2 = new Trigger(40, space+200, 10, 50);
Trigger t3 = new Trigger(40, space+400, 10, 50);
Trigger t4 = new Trigger(width/2 + 120, 795, 50, 10);
Trigger t5 = new Trigger(width/2+400, height/2+745, 50, 10);
Trigger t6 = new Trigger(600, space, 10, 50);//x=600
Trigger t7 = new Trigger(600, space+200, 10, 50);
Trigger t8 = new Trigger(600, space+400, 10, 50);
Trigger tNull = new Trigger(0, 0, 0, 0);
Trigger t[];

Trigger[][]  decisionGraph = {{tNull,tNull,tNull,tNull,t5,t6,t7,t8},
                              {tNull,tNull,tNull,tNull,t5,t6,t7,t8},
                              {tNull,tNull,tNull,tNull,t5,t6,t7,t8},
                              {tNull,tNull,tNull,tNull,t5,t6,t7,t8},
                              {t1,t2,t3,t4,tNull,tNull,tNull,tNull},
                              {t1,t2,t3,t4,tNull,tNull,tNull,tNull},
                              {t1,t2,t3,t4,tNull,tNull,tNull,tNull},
                              {t1,t2,t3,t4,tNull,tNull,tNull,tNull}};


class Trigger { //platforms to jump between
  PVector pos;
  PVector dim;
  Boolean isNull;
  int platformIdx;

  Trigger(float x, float y, float w, float h) {
    pos = new PVector(x, y);
    dim = new PVector(w, h);
    isNull = false;
    platformIdx = 0;
  }

  void drawT() {
    pushMatrix();
    rectMode(CENTER);
    stroke(255);
    //fill(0);
    rect(pos.x, pos.y, dim.x, dim.y);
    popMatrix();
  }
}

void triggers() {//hard coded platfomrs
  //t1 = new Trigger(width/2 - 120, 695+UY, 50, 10);
  //t2 = new Trigger(width/2 + 120, 695+UY, 50, 10);
  //t3 = new Trigger(40, space + 200, 10, 50);
  //t4 = new Trigger(600, space + 200, 10, 50);
  //t5 = new Trigger(40, space+400, 10, 50);
  //t6 = new Trigger(600, space+400, 10, 50);
  //t7 = new Trigger(40, space, 10, 50);
  //t8 = new Trigger(600, space, 10, 50);
  //tNull = new Trigger(0,0,0,0);
  
  t1.platformIdx = 1;
  t2.platformIdx = 2;
  t3.platformIdx = 3;
  t4.platformIdx = 4;
  t5.platformIdx = 5;
  t6.platformIdx = 6;
  t7.platformIdx = 7;
  t8.platformIdx = 8;
  tNull.isNull = true;

  t[0] = t1;
  t[1] = t2;
  t[2] = t3;
  t[3] = t4;
  t[4] = t5;
  t[5] = t6;
  t[6] = t7;
  t[7] = t8;

  
}

void drawTriggers() {
  for (int i = 0; i < t.length; i++) {
    t[i].drawT(); // draw each platform
  }
}