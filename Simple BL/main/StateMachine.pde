void gameStates()
{
  switch(state)
  {
  case 0:
    background(0);
    textSize(32);
    fill(255);
    //text(1 + ". " + songList[0] + "\n", width/2-textWidth(1 + ". " +songList[0]+ "\n")/2, height/2+42);
    text("Select A Song\n\n", width/2-textWidth("Select A Song\n\n")/2, height/4-24);
    text("Select the number that \ncorresponds with each song\n\n", width/2-textWidth("Select the number that \n\ncorresponds with each song\n\n")/2, height/4+24);
    textSize(14);
    for(int i = 0; i < songList.length; i++){
      text(i+1 + ". " + songList[i] + "\n", width/2-textWidth(i+1 + ". " +songList[i]+ "\n")/2, height- 282 + i *40);   
    
    }
    //text("Distance: " + (int)(score/100), width/2-textWidth("Distance: #")/2, height-100);
    if (keyPressed ) {
      if (key == '1') {
        currentSongIdx = 0;
        
        state = 1;
      } else if (key == '2') {
        currentSongIdx = 1;
        
        state = 1;
      }
      else if(key == '3'){
        currentSongIdx = 2;
        
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
    error = true;
    if(error){
      // add the sine generator as an input to the Gain
       g.addInput(sine);
    
      // ramp the frequency up to 2000Hz over 1000 ms
      frequencyEnvelope.addSegment(2000.0f, 1000.0f);
      error = false;
    }
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