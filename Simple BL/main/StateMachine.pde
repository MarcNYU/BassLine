void gameStates()
{
  switch(state)
  {
  case 0:
    Game();
    println("Play Test");


    break;
  case 1:


    //musicQueue[currentSongIdx].close();
    musicQueue[0].close();
    background(0);
    textSize(32);
    fill(255);
    text("GAME OVER", width/2-textWidth("GAME OVER")/2, height/2-32);
    text("Hit any key to replay", width/2-textWidth("Hit any key to replay")/2, height/2+32);
    text("Distance: " + (int)(score/100), width/2-textWidth("Distance: #")/2, height-100);
    if (keyPressed) {
    resetGame();
    musicQueue[0].play();
    state = 0;
    }
    println("Game Over");

    break;

  case 2: 
    drawGuides();
    Game();
    //println("Debug");
    if (keyPressed) {
     //If the user presses the right arrow, the next song in the array is played
       if (key == CODED) {
          if (keyCode == RIGHT) {
            println("Right pressed");
           int newIdx = currentSongIdx + 1;
           changeMusic(newIdx);   
          }
          //This is supposed to play the previous song but it's now causing an index error 
          else if(keyCode == LEFT ){
            println("Left pressed");            
            int newIdx = currentSongIdx - 1; 
            changeMusic(newIdx);
          }
       }
  
    }
    break;
  }
}