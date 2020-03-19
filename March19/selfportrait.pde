//Self-Portrait, created by Zou Xinyi for Intro to IM 
//Referencings: https://processing.org/reference/;https://github.com/paredesfluffyshark/Intro-To-IM/blob/master/Self-Portrait/self-portrait-code;https://github.com/JulianAGCarrera/Intro_IM/blob/master/Week%208%20(Self-Portrait%20%2B%20%22Her%20Code...%22%20Reading/Self%20Portrait.pde;https://github.com/lucychoi1215/Intro-to-IM/blob/master/portrait.pde;


float shift=0;

void setup() {
  size(800, 800);
  background(255);
  colorMode(RGB, 255, 255, 255);
  ;
}

void draw() {

  //changes background color when the mouse moves
  shift= map(mouseX, 0, width, 0, 55);
  background(shift+200, 237, 250, 180);


  //hair in the back  
  noStroke();
  fill(201, 151, 64);
  rect(252, 300, 296, 400);

  //neck
  fill(227, 181, 102);
  rect(372, 520, 60, 70);
  arc(402, 583, 61, 55, radians(0), radians(180), CHORD);

  //head 
  fill(227, 181, 102);
  stroke(227, 181, 102);
  rect(260, 260, 280, 290, 0, 0, 140, 140);


  //ears
  noStroke();
  fill(227, 181, 102);
  ellipse(250, height/2, 55, 70); //left 
  ellipse(550, height/2, 55, 70); //right 

  //hoop earring
  noFill();
  stroke(255, 195, 66);
  strokeWeight(5);
  arc(230, 452, 50, 50, 1, 180); //left 
  arc(560, 452, 50, 50, 1, 180); //right


  //shirt
  fill( 255, 241, 217);
  arc(400, 700, 296, 280, radians(180), radians(360));


  //nose
  fill( 240, 184, 86);
  stroke(222, 151, 168);
  arc(400, 450, 30, 45, radians(220), radians(320));


  //mouth
  fill(222, 151, 168);
  noStroke();
  arc(400, 490, 65, 55, radians(0), radians(180), CHORD);

  //eyebrow
  noFill();
  stroke(150, 103, 39);
  strokeWeight(5);
  arc(470, 355, 85, 40, radians(220), radians(320)); //left
  arc(329, 355, 85, 40, radians(220), radians(320)); //right

  //glasses
  noFill();
  strokeWeight(2);
  stroke(150, 103, 39);
  rect(290, 365, 80, 60, 7); //left lense
  rect(430, 365, 80, 60, 7); //right lense
  line(290, 380, 250, 360); //left foot
  line(509, 380, 550, 360); //right foot
  strokeWeight(5);
  stroke(130, 86, 26);
  arc(400, 410, 48, 40, radians(220), radians(320)); //the arch that connects two lenses

  //pupils
  fill(0);
  stroke(0);
  ellipse(330, 395, 20, 20); //left
  ellipse(470, 395, 20, 20); //right

  //eyes
  stroke(255);
  fill(130, 86, 26);
  strokeWeight(5);
  ellipse(330, 395, 20, 35); //left 
  ellipse(470, 395, 20, 35); // right 

  //hair that needs to be in the front
  noStroke();
  fill(201, 151, 64);  
  rect (235, 250, 45, 330, 45, 330, 18, 9); //left
  rect (515, 250, 45, 330, 45, 330, 9, 18); //right 
  arc(398, 286, 326, 326, PI, 2*PI, 1); //top hair that covers the two sides, connecting the head with the rest of the hair
}
