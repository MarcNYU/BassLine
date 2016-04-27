float fixDec(float n, int d) {
  return Float.parseFloat(String.format("%." + d + "f", n));
}
int seconds;
int minutes;
float score;
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
    
    textSize(15);
    
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

   
    if (keyPressed) {
      if (key == ENTER)
      {
        fill(255);
        text("Loading...", width/2-textWidth("loading...")/2, height - 200); 
        state = 1;
      }
    }
    
    menuVi.drawEQ();
    
    break;
  case 1:
    seconds = (int)(ac.getTime()/(1000))%60;
    minutes = (int)(ac.getTime()/1000)/60;  
    score = fixDec((float)(ac.getTime()/songRuntimes[currentSongIdx]),2);
    
    //println("game started");
    if (gameInit) {
      initBeat();
      mp3.play();
      mp3.mute();
      println("game init current song idx: " + currentSongIdx);
      gameInit = false;
    }
    
    Game();
    fill(0,0,150);
    text("Score: " + score , 50,40);
    //if (!(ac.isRunning())) {
    //  songEnded = true;
      
    //}
    
    //println("Play Test");


    break;
  case 2:
    //outt.mute();

    //mp3.close();
    //ac.reset();
    //frequencyEnvelope.clear();
    ac.stop();
    
    mp3.close();
    
    
    seconds = (int)(ac.getTime()/(1000))%60;
    minutes = (int)(ac.getTime()/1000)/60;  
    //score = fixDec((float)(ac.getTime()/songRuntimes[currentSongIdx]),2);
    
    
    background(0);
    textSize(32);
    fill(255);
    text("GAME OVER", width/2-textWidth("GAME OVER")/2, height/2-32);
    //text("Hit any key to replay", width/2-textWidth("Hit any key to replay")/2, height/2+32);
    textSize(22);
    text("Current Time: " + minutes  + ":" + seconds , width/2-textWidth("Current Time: ")/2, height-190);
    println("Current Time: " + minutes  + ":" + seconds);
    text("Score: " + score, width/2-textWidth("Score: ")/2, height-160);

    fill(blinkColor);
    text("Hit any key to replay", width/2-textWidth("Hit any key to replay")/2, height/2 + 32);
    blinkColor+= blinkChange;
    if (blinkColor >= 255 || blinkColor <= 0)
      blinkChange = blinkChange* -1;
    //drawScore();
     //menuVi.drawEQ();
     
    if (keyPressed) {
      resetGame();
      
      start = true;
      //returnToPlay = true;
      //frequencyEnvelope.clear();
      state = 0;
      gameInit = true;
      
      
    }
    //println("Game Over");

    break;

  case 3: 
    drawGuides();
    Game();
    println("Debug");
    break;
    
  case 4:
    //print("\n\n\n\nstate 4 entered\n\n\n\n");
    ac.stop();
    background(0);
    textSize(20);
    fill(255);
    //score = fixDec((float)(ac.getTime()/songRuntimes[currentSongIdx]),2);
    text("You've made it to the end of the song!", width/2-textWidth("You've made it to the end of the song!")/2, height/2-32);
    text("Current Time: " + minutes  + ":" + seconds , width/2-textWidth("Current Time: ")/2, height-190);
    println("Current Time: " + minutes  + ":" + seconds);
    text("Score: " + score, width/2-textWidth("Score: ")/2, height-160);

    fill(blinkColor);
    text("Hit any key to return to the main menu", width/2-textWidth("Hit any key to return to the main menu")/2, height/2+52);
    blinkColor+= blinkChange;
    if (blinkColor >= 255 || blinkColor <= 0)
      blinkChange = blinkChange* -1;
    
    menuVi.drawEQ();
    stroke(255);
    line(40, 0, 40, height);
    line(440, 0, 440, height);   
    
    
    text("Distance: " + score, width/2-textWidth("Distance: #")/2, height-100);

    if (keyPressed) {
      //frequencyEnvelope.clear();
      state = 0;
      
    }   
    break;
  }
  
    
}