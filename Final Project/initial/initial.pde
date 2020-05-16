/*Intro to IM Final Project
 Instructor: Michael Shiloh 
 Title:Ambush From All Sides
 Made by: Zou Xinyi xz2043
 
 Description: 
 - This is the initial code I started with that creates a sound visualization of the classical Chinese pipa song "Ambush From All Sides", which depicts a battle scene. 
 This version is relatively stactic, as the user does not have the option of using the mouse to determine where the circles are. 
 Furthermore, it is less of a mimacry of two armies in a battle field, but more of a visualization of how pipa creates a scene in war. 
 
 Sources:
 - other ppl trying to visualize sound
 https://www.youtube.com/watch?v=LsADo2gcPWE
 https://www.youtube.com/watch?v=2O3nm0Nvbi4
 https://www.youtube.com/watch?v=283rmgvFDE0
 https://www.youtube.com/watch?v=2lZZhTf5uHY
 
 - how to create code that analyzes and maps live sound 
 https://forum.processing.org/two/discussion/24080/help-with-audio-visualizer
 http://responsivedesign.de/wp-content/uploads/2016/05/tutorial-06_processing-soundmapping2.pdf
 */
float n4;
float n6;

//MUSIC  
import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioPlayer mySound;

//MAIN SETUP
void setup () {
  smooth();
  background (0);
  frameRate(24);

  //MUSIC | Add mp3 to file and change name of "Murph.mp3" to your song name
  minim = new Minim(this);
  mySound = minim.loadFile("pipa.mp3");    
  size(800, 800);
  mySound.play();
}

void draw () {
  fill(0, 50);  
  noStroke();
  rect(0, 0, width, height);
  translate(width/2, height/2);

  for (int i = 0; i < mySound.bufferSize() - 1; i++) { //the main idea is the same as the final submission. Refer to AFAS for comments

//parametors for each circles
    float angle = sin(i+n4)* 10; 
    float angle2 = sin(i+n6)* 300; 

    float x = sin(radians(i))*(angle2+30); 
    float y = cos(radians(i))*(angle2+30);

    float x3 = sin(radians(i))*(500/angle); 
    float y3 = cos(radians(i))*(500/angle);

    fill (245, 220, 152); //yellow
    ellipse(x, y, mySound.left.get(i)*10, mySound.left.get(i)*10);//how big the circle is based on the frequency of the sound frame being played 

    fill (255, 134, 110); //orange
    rect(x3, y3, mySound.left.get(i)*20, mySound.left.get(i)*10);

    fill ( 255, 134, 110); //orange
    rect(x, y, mySound.right.get(i)*10, mySound.right.get(i)*10);


    fill( 255, 134, 110); //white
    rect(x3, y3, mySound.right.get(i)*10, mySound.right.get(i)*20);
  }

  n4 += 0.008; //the rippling effect after each loop is over 
  n6 += 0.04;
}
