/*Intro to IM Final Project
 Instructor: Michael Shiloh 
 Title:Ambush From All Sides
 Made by: Zou Xinyi xz2043
 
 Description:
 - I created a sound visualization of of the classical Chinese pipa song "Ambush From All Sides", which depicts a battle scene. 
 There are two modes to this visualization: The user can either not do anything, and let the armies(two circles) fight along the battle line on their own. 
 To participate in the battle, the user can click on the screen and choose where the fighting of the two armies takes place.
 She can also choose to pause and play the sound by clicking on the pause button. 
 
 
 Sources:
 - other ppl trying to visualize sound
 https://www.youtube.com/watch?v=LsADo2gcPWE
 https://www.youtube.com/watch?v=2O3nm0Nvbi4
 https://www.youtube.com/watch?v=283rmgvFDE0
 https://www.youtube.com/watch?v=2lZZhTf5uHY
 
 - how to create code that analyzes and maps live sound 
 https://forum.processing.org/two/discussion/24080/help-with-audio-visualizer
 http://responsivedesign.de/wp-content/uploads/2016/05/tutorial-06_processing-soundmapping2.pdf
 
 - button 
 https://processing.org/examples/button.html
 https://processing.org/reference/libraries/sound/SoundFile_isPlaying_.html
 https://processing.org/reference/logicalAND.html
 
 - special thanks to Alex Edwards for assisting with the check collision function 
 */



//minim library setup 
import ddf.minim.*; 
import ddf.minim.signals.*;
Minim minim;
AudioPlayer mySound;
int rectX, rectY; //position of the button 
int rectSize = 90; 

Button button;

//MAIN SETUP
void setup () {

  smooth();
  background (0);
  frameRate(24);

  //add mp3 file of a Pipa version of the music
  minim = new Minim(this);
  mySound = minim.loadFile("pipa.mp3");    //load the mp3 file 
  size(800, 800); //size of the canvas 
  button=new Button(600, 600, 64);
}

float moveCircle=0;
float moveCircleUpdate=10;

float moveCircleX=400; //mouse click
float moveCircleY=400; //initial mouse click 

boolean isPlaying = false; 
// initial value is set to larger than the initial check for cooldowndPeriod which is 10
int coolDownPeriod = 11; 

void draw () {

  //if the button has been clicked 

  if (mousePressed) { 
    if (button.mouseClickedIsContained(mouseX, mouseY)) { //check if the button contains the cursor 
      // Cool down period is set to 0 if something was recently pressed 
      // It must be larger than 10 to make sure that nothing was recently pressed
      // Else this can lead to the 'same' click turning this off and on multiple times instaneously, because how fast everything is happening

      if (!isPlaying && coolDownPeriod > 10) { //check that the music is not playing and the button has not been pressed recently 
        mySound.play(); 
        isPlaying = true; 
        coolDownPeriod = 0;
      } 
      if (isPlaying && coolDownPeriod > 10) { 
        mySound.pause(); 
        isPlaying = false; 
        coolDownPeriod = 0;
      }
    } else { 
      moveCircleX = mouseX; 
      moveCircleY = mouseY;
    }
  }

  coolDownPeriod++; 


  background(0); //set background to black
  strokeWeight(0.5);
  noStroke();  
  noFill();
  rect(0, 0, width, height);

  if (isPlaying) { //the armies and battle line would only occur if the music is playing 

    // Since we want the 'armies' to always collide, we can have x and y exist on the same straigth line y = x 
    // they are updated by the same amount 

    if (moveCircle > 400) { //part of the collision functtion
      moveCircleUpdate = -10;
    }
    if (moveCircle < 0) { 
      moveCircleUpdate = 10;
    }


    for (int i = 0; i < mySound.bufferSize() - 1; i++) {//iterator,goes through every single frame of the audio file

      float r = sin(i)* 10; //orange circle
      float r2 = sin(i)* 30;  //white circle how far away from the center of the circle X and Y are

      //setting parametors of each circle 
      float x = sin(radians(i)) * (r2+30) + moveCircleX- moveCircle; //for X:radius,angle and origin of the circle. Basically what the circle would look like
      float y = cos(radians(i)) * (r2+30) + moveCircleY- moveCircle ; //same thing for Y 

      float x2 = sin(radians(i))*(r2+30) + moveCircleX+ moveCircle ;
      float y2 = cos(radians(i))*(r2+30) + moveCircleY+ moveCircle;

      float x3 = sin(radians(i))*(100/(r*i/10))+ 400; //we want the battle line to be relatively stationary, so no need for +/-moveCircle
      float y3 = cos(radians(i))*(100/(r*i/10)) + 400;


      //collision check: make sure that x and y for everything(armies and battle line) are always contained within the canvas
      if (x < 0) x = 10; 
      if (x > 800) x = 790; 
      if (y < 0) y = 10; 
      if (y > 800) y = 790;

      if (x2 < 0) x2 = 10; 
      if (x2 > 800) x2 = 790; 
      if (y2 < 0) y2 = 10; 
      if (y2 > 800) y2 = 790;

      if (x3 < 0) x3 = 10; 
      if (x3 > 800) x3 = 790; 
      if (y3 < 0) y3 = 10; 
      if (y3 > 800) y3 = 790;

      //actually drawing each circle
      fill (245, 220, 152); // army1 left
      ellipse(x, y, mySound.left.get(i)*10, mySound.left.get(i)*10); //how big the circle is based on the frequency of the sound frame being played 

      fill (255, 134, 110); //army1 left
      rect(x2, y2, mySound.left.get(i)*10, mySound.left.get(i)*10);

      fill (255, 134, 110); //army2 right
      rect(x, y, mySound.right.get(i)*10, mySound.right.get(i)*10);

      fill (255, 134, 110); //army2 right
      rect(x2, y2, mySound.right.get(i)*10, mySound.right.get(i)*10);


      fill (255, 255, 255); //white battle line left
      rect(x3, y3, mySound.left.get(i)*20, mySound.left.get(i)*10);

      fill(255, 255, 255); //white battle line right
      rect(x3, y3, mySound.right.get(i)*10, mySound.right.get(i)*20);
    }

    moveCircle = moveCircle + moveCircleUpdate;  //moves the circle around on their own, every time a next sound is played, the circles move a bit more
  }

  fill(255); //text that tells the user what the button is used for 
  textSize(22);
  text("On/Off Battle Mode", 500, 700);
  button.display(mouseX, mouseY);
}
