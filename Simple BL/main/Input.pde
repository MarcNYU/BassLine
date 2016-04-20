void input() {
  if (keyPressed) {
    //if(key == 'b' && eRadius > 60) {
    if (key == 'b' && !frozen) {
      jump = true;
      start = false;
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
    
  }
}