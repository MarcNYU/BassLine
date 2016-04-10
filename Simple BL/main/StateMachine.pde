void gameStates()
{
  switch(state)
  {
  case 0:
    Game();
    //println("Play Test");
    
    break;
  case 1:

    //musicQueue[currentSongIdx].close();
    musicQueue[currentSongIdx].musicFile.pause();
    musicPaused = true;
    background(0);
    textSize(32);
    fill(255);
    text("GAME OVER", width/2-textWidth("GAME OVER")/2, height/2-32);
    text("Hit any key to replay", width/2-textWidth("Hit any key to replay")/2, height/2+32);
    text("Distance: " + (int)(score/100), width/2-textWidth("Distance: #")/2, height-100);
    if (keyPressed) {
    resetGame();
    musicQueue[currentSongIdx].play();
    musicPaused = false;
    state = 0;
    }
    println("Game Over");

    break;

  case 2: 
    drawGuides();
    Game();
    //println("Debug");
    if (keyPressed) {    
       
          if (key == 'f') {
            println("Right pressed");
           int newIdx = currentSongIdx + 1;
           if(newIdx <3){
           changeMusic(newIdx);
           }
          }
          else if(key == 'r' ){
            println("Left pressed"); 
            if(currentSongIdx > 0){
              int newIdx = currentSongIdx - 1; 
              if(newIdx <3){
                changeMusic(newIdx);
              }
            }
          }
       
  
    }
    break;
  }
}