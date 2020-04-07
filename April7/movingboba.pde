
/*for this assignment, 
 I designed a cup of bubble tea with moving bobas with OOP used the example of moving circles in class(https://github.com/michaelshiloh/simpleProcessingClassExample) as a base. */

int XSPEED=4;
int YSPEED=5; 
int CIRCLESIZE=15; 

//class that moves the boba 
class MovingBoba {

  float x, y, xSpeed, ySpeed;

  MovingBoba(float xpos, float ypos) {
    x = xpos;
    y = ypos;
    xSpeed = XSPEED;
    ySpeed = YSPEED;
  }

  // The update() function adds the speed to the position, making
  // the bobas move around:
  void update() {
    x += xSpeed;
    y += ySpeed;
  }

  // checking if bobas have gone beyond the scope of the cup. If so, it reverses the speed and the direction of the boba in motion. 
  void checkCollisions() {
    float r = CIRCLESIZE/2;
    if ( (x<130+r) || (x>130+180-r)) { //left&right of the cup
      xSpeed = -xSpeed;
    }
    if ( (y<200+100+r) || (y>200+190-r)) { //top and bottom of the cup 
      ySpeed = -ySpeed;
    }
  }

  // draws each boba 
  void drawBoba() {
    fill(0);
    ellipse(x, y, CIRCLESIZE, CIRCLESIZE);
  }
} 

//create an empty array for a bunch of objects of type Boba
MovingBoba[] myCircleArray=new MovingBoba[5];


void setup() {
  size(400, 400);
  smooth();
  colorMode(RGB, 255, 255, 255);
  // Here is where we create the objects and populate the
  // array with them
  for (int i=0; i < myCircleArray.length; i++) {
  //make sure the boba's starting position is within the range of the dimension of the cup 
    myCircleArray[i] = new MovingBoba(random(130, 130+180-CIRCLESIZE), 
      random(200+100, 200+190-CIRCLESIZE));//make sure the highest the bobas move is about 1/2 of the cup's height to make it more realistic
  }
}

void draw() {
  background(255);

  //draws boba cup 
  fill(227, 181, 102);
  stroke(227, 181, 102);
  rect(130, 200, 180, 190);

  //draws straw
  fill(128, 96, 61);
  noStroke();
  rect(210, 100, 20, 120, 0, 0, 140, 140);

  //draws lid
  fill(128, 96, 61);
  noStroke();
  ellipse(220, 210, 200, 40);

  // iterate through every moving boba

  for (int i=0; i < myCircleArray.length; i++) {

    myCircleArray[i].update();
    myCircleArray[i].checkCollisions();

    myCircleArray[i].drawBoba();
  }
}
