void gameStates()
{
  switch(state)
  {

  case 0:
    background(0);
    //outt.mute();

    //DrawLines();
    stroke(255);
    line(40, 0, 40, height);
    line(440, 0, 440, height);
    // classicVi.drawEQ();

    textSize(50);

    fill(50, 150, 255);
    //text(1 + ". " + songList[0] + "\n", width/2-textWidth(1 + ". " +songList[0]+ "\n")/2, height/2+42);
    text("BassLine\n\n", width/2-textWidth("BassLine\n\n")/2, height/4-100);
    //textSize(20);
    //fill(255);
    //text("Select the number that \ncorresponds with each song\n\n", width/2-textWidth("Select the number that \n\ncorresponds with each song\n\n")/2, height/4+84);
    textSize(15);
    //if (keyPressed) {
    ////If the user presses the right arrow, the next song in the array is played
    //  if (key == CODED) {
    //     if (keyCode == RIGHT) {
    //       noLoop();
    //       if(currentSongIdx < songList.length -1)
    //         currentSongIdx++;
    //       text(currentSongIdx + ". " + songList[currentSongIdx] + "\n", width/2-textWidth(currentSongIdx + ". " +songList[currentSongIdx]+ "\n")/2, height- 282 + 40);
    //     }
    //     else if(keyCode == LEFT){
    //       if(currentSongIdx > 0)
    //         currentSongIdx--;
    //         text(currentSongIdx + ". " + songList[currentSongIdx] + "\n", width/2-textWidth(currentSongIdx + ". " +songList[currentSongIdx]+ "\n")/2, height- 282 + 40);
    //     }
    //  }
    //}
    //loop();
    if (keyPressed && releasedKey == true) {
      //If the user presses the right arrow, the next song in the array is played
      releasedKey = false;
      if (key == CODED) {
        if (keyCode == UP) {
          noLoop();
          upPressed = true;
          if (currentSongIdx < songList.length -1)
            currentSongIdx++;
          else if (currentSongIdx >= songList.length -1)
            currentSongIdx = 0;
        } else if (keyCode == DOWN) {
          downPressed = true;
          if (currentSongIdx > 0)
            currentSongIdx--;
          else if ( currentSongIdx <= 0 )
            currentSongIdx = 2;
        }
      }
    }

    text("Choose your song", width/2-textWidth("Choose your song")/2, 220);
    fill(0);
    stroke(255);
    //strokeWeight(1);
    if (upPressed == true)
      fill(255);
    triangle(width/2, height- 505, (width/2)-20, height- 485, (width/2)+20, height- 485);
    fill(0);
    if (downPressed == true)
      fill(255);
    triangle(width/2, height- 385, (width/2)-20, height- 405, (width/2)+20, height- 405);
    fill(0);
    rect(width/2, height- 445, 380, 50);

    fill(255);

    textSize(12);
    text(songList[currentSongIdx] + "\n", width/2-textWidth(currentSongIdx + ". " +songList[currentSongIdx]+ "\n")/2, height- 442);

    textSize(20);
    //Draws the blinking press enter key to start
    fill(blinkColor);
    text("Press Enter to start", width/2-textWidth("Press Enter to start")/2, height- 320);
    blinkColor+= blinkChange;
    if (blinkColor >= 255 || blinkColor <= 0)
      blinkChange = blinkChange* -1;

    loop();

    //for(int i = 0; i < songList.length; i++){
    // text(i+1 + ". " + songList[i] + "\n", width/2-textWidth(i+1 + ". " +songList[i]+ "\n")/2, height- 282 + i *40);   

    if (keyPressed) {
      if (key == ENTER)
      {
        text("Loading...", width/2-textWidth("loading...")/2, height - 200); 
        state = 1;
      }
    }
    //text("Distance: " + (int)(score/100), width/2-textWidth("Distance: #")/2, height-100);

    //text("loading", width/2-textWidth("loading")/2, height/4-24);
    menuVi.drawEQ();
    //if (keyPressed ) {
    //  //text("Loading", width/2-textWidth("Loading")/2, height/2-24);
    //  if (key == '1') {
    //    currentSongIdx = 0;
    //    //text("loading", width/2-textWidth("loading")/2, height/4-24);  
    //    state = 1;


    //  } else if (key == '2') {
    //    currentSongIdx = 1;
    //    //text("Loading", width/2-textWidth("Loading")/2, height/2-24);

    //    state = 1;
    //  }
    //  else if(key == '3'){
    //    currentSongIdx = 2;
    //    text("Loading", width/2-textWidth("Loading")/2, height/2-24);

    //    state = 1;
    //  }


    break;
  case 1:

    println("game started");
    if (gameInit) {
      initBeat();
      gameInit = false;
    }
    if (!(ac.isRunning())) {
      ac.start();
    }
    Game();
    //println("Play Test");


    break;
  case 2:
    //outt.mute();

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
      state = 0;
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