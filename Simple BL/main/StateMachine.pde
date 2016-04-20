void gameStates()
{
  switch(state)
  {
  
  case 0:
    background(0);
    
    
    DrawLines();
   // classicVi.drawEQ();
    
    textSize(40);
    
    fill(50 , 150, 255);
    //text(1 + ". " + songList[0] + "\n", width/2-textWidth(1 + ". " +songList[0]+ "\n")/2, height/2+42);
    text("Baseline\n\n", width/2-textWidth("Baseline\n\n")/2, height/4-24);
    textSize(20);
    fill(255);
    text("Select the number that \ncorresponds with each song\n\n", width/2-textWidth("Select the number that \n\ncorresponds with each song\n\n")/2, height/4+84);
    textSize(12);
    //if (keyPressed) {
    // //If the user presses the right arrow, the next song in the array is played
    //   if (key == CODED) {
    //      if (keyCode == RIGHT) {
    //        noLoop();
    //        if(currentSongIdx < songList.length -1)
    //          currentSongIdx++;
    //        text(currentSongIdx + ". " + songList[currentSongIdx] + "\n", width/2-textWidth(currentSongIdx + ". " +songList[currentSongIdx]+ "\n")/2, height- 282 + 40);
    //      }
    //      else if(keyCode == LEFT){
    //        if(currentSongIdx > 0)
    //          currentSongIdx--;
    //          text(currentSongIdx + ". " + songList[currentSongIdx] + "\n", width/2-textWidth(currentSongIdx + ". " +songList[currentSongIdx]+ "\n")/2, height- 282 + 40);
    //      }
    //   }
    //}
    //loop();
    
    for(int i = 0; i < songList.length; i++){
     text(i+1 + ". " + songList[i] + "\n", width/2-textWidth(i+1 + ". " +songList[i]+ "\n")/2, height- 282 + i *40);   
    
    }
    //text("Distance: " + (int)(score/100), width/2-textWidth("Distance: #")/2, height-100);
    
    //text("loading", width/2-textWidth("loading")/2, height/4-24);
    menuVi.drawEQ();
    if (keyPressed ) {
      //text("Loading", width/2-textWidth("Loading")/2, height/2-24);
      if (key == '1') {
        currentSongIdx = 0;
        //text("loading", width/2-textWidth("loading")/2, height/4-24);  
        state = 1;
        
        
      } else if (key == '2') {
        currentSongIdx = 1;
        //text("Loading", width/2-textWidth("Loading")/2, height/2-24);
        
        state = 1;
      }
      else if(key == '3'){
        currentSongIdx = 2;
        text("Loading", width/2-textWidth("Loading")/2, height/2-24);
        
        state = 1;
      }
  }
  
    break;
  case 1:
    
    println("game started");
    if(gameInit){
      initBeat();
      gameInit = false;
    }
    if(!(ac.isRunning())){
      ac.start();
    }
    Game();
    //println("Play Test");


    break;
  case 2:


    //mp3.close();
    //ac.reset();
    //frequencyEnvelope.clear();
    ac.stop();
    
    background(0);
    textSize(32);
    fill(255);
    text("GAME OVER", width/2-textWidth("GAME OVER")/2, height/2-32);
    text("Hit any key to replay", width/2-textWidth("Hit any key to replay")/2, height/2+32);
    text("Distance: " + (int)(score/100), width/2-textWidth("Distance: #")/2, height-100);
    
    if (keyPressed) {
    resetGame();
    start = true;
    //frequencyEnvelope.clear();
    state = 1;
    }
    //println("Game Over");

    break;

  case 3: 
    drawGuides();
    Game();
    println("Debug");
    break;
  }
}