void gameStates()
{
  switch(state)
  {
  case 0:
    initialize();
    println("Play Test");


    break;
  case 1:



    background(0);
    textSize(32);
    fill(255);
    text("GAME OVER", width/2-textWidth("GAME OVER")/2, height/2-32);
    text("Hit any key to replay", width/2-textWidth("Hit any key to replay")/2, height/2+32);
    text("Distance: " + (int)(b.pos.y/100), width/2-textWidth("Distance: #")/2, height-100);
    if (keyPressed) {
      initialize();
      state = 0;
    }
    println("Game Over");

    break;

  case 2: 
    drawGuides();
    initialize();
    println("Debug");
    break;
  }
}