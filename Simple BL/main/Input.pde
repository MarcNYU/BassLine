void input() {
  if (keyPressed) {
    //if(key == 'b' && eRadius > 60) {
    if(( b.pos.x < 50 || b.pos.x > 430) && frozen == true){jump = false;}
    else
    {
      if (key == 'b' ) 
      {
        jump = true;
        start = false;
      }
    } 
  /*else 
    {
      jump = false;
    }*/
  }
}

//void keyPressed() {
//  if (key == 'b') {
//    jump = true;
//    start = false;
//  } else {
//    jump = false;
//  }
  
//}