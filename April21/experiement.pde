/*For this assignment, we were asked to tweak around Aaron's example that he demonstrated in class. 
I really liked the subtleness of the emergent patterns, and wanted to bring more focus to the individual movements.
So I had the idea of a torch: the mouse moves around the screen, and wherever it moves to, the patterns emerge, 
like a torch in a dark cave. Once the user presses the mouse, the whole picture of the "cave" emerges. */

Rotater[] rotaters;

void setup() {
  size(640, 360);
  rotaters = new Rotater[200];
  for (int i=0; i< rotaters.length; i++) {
    float x = random(width);
    float y = random(height);
    float lineDistance = random(20, 50);
    //initiate with i for index
    rotaters[i]= new Rotater(x, y, i, lineDistance);
  }
}

void draw() {
  background(255);
  fill(245, 198, 204);
  text("Light Your Torch", 30, 300); //text display
  textSize(40);
  for (Rotater r : rotaters) {
    r.rotate();
    r.distance(rotaters);
  }
}

class Rotater {
  float centerX, centerY, x, y, angle, radius, speed, lineDistance, acceleration, direction;
  int index;
  Rotater(float _x, float _y, int i, float ld) {
    centerX= _x;
    centerY=_y;
    x=y=angle=0;
    radius=random(10, 45); //make the lines seem more densely packed
    speed = 0;
    index = i;
    lineDistance = ld;
    acceleration=0;
    //each rotater has a direction, make a coin flip initially to determine dir.
    direction=-1;
    float coinflip = random(1);
    if (coinflip>.5)
      direction=1;
  }

  void rotate() {
    //get cartesian coords from polar angle
    //add to center point of rotater to rotate around the actual spot
    x = cos(angle)*radius+centerX;
    y = sin(angle)*radius+centerY;
    //same as normal: vel+=acc
    speed+=acceleration;
    //angle is our pos now, mult by our direction
    angle+=speed*direction;
    //dampen it a little
    speed*=.98;
    acceleration=0;
    //rect(x, y, 2, 2);
  }

  void distance(Rotater[] rotaters) {
    //check the mouse, if close enough add some acceleration
    checkMouse();
    //check distance with all rotaters, if close enough draw line
    for (Rotater r : rotaters) {
      if (r.index != index) {
        if (dist(x, y, r.x, r.y)<lineDistance) {
          if (dist(mouseX, mouseY, x, y)<70) { //wherever the mouse is, make the strokes around it to be red
            float val = 256/(1+exp((dist(mouseX, mouseY, x, y))*30)); //make the strokes to have a gradient effect
            stroke(102, 2, 20);
          } else {
            stroke(255); //the other strokes remain "invisible", meaning the strokes outside of the set range are white
          }
          if (mousePressed==true) {
            stroke(245, 198, 204);
          }
          line(x, y, r.x, r.y);
        }
      }
    }
  }

  void checkMouse() {
    //if mouse is close enough give some acceleration
    if (dist(mouseX, mouseY, x, y)<100 && mouseX!=pmouseX && mouseY!=pmouseY) {
      acceleration=.002;
    }
  }
}
