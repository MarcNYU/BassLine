void input() {
  if (keyPressed) {
    //if(key == 'b' && eRadius > 60) {
    if ((key == ' ' || key == 'b') && !frozen) {
      jump = true;
      startOfGame = false;
    }
  } else {
    jump = false;
  }
}

//void keyReleased() {  
// if (key == 'b') {
//   //value = 255;
//   jump = true;
//   start = false;

// } else {
//   jump = false;
// }
//}

void keyPressed() {
  if (key == ESC) {
    //sp.close();
  }
}

void keyReleased() {
  jump = false;
  releasedKey = true;
  upPressed = false;
  downPressed = false;
}

void check() {
  if (!b.leftB() && !b.rightB() && jump) {
    b.freeze();
    gravity = .6;
  } else {
    if (b.pos.y < ceilling) {
      gravity = .65;
    } else {
      gravity = .4;
    }
  }
}