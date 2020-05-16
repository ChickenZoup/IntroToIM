//a class to describe a button inspired by Dnaiel Shiffman's doorbell example 

class Button {
  // Location and size
  float x;
  float y;
  float r;


  //create the button 
  Button (float x_, float y_, float r_) {
    x = x_;
    y = y_;
    r = r_;
  }

  // check if the cursor is somewhere within the button 
  boolean mouseClickedIsContained(float mx, float my) {
    if (dist(mx, my, x, y) < r) {
      return true;
    } else {
      return false;
    }
  }

  // Show the button
  void display(float mx, float my) {
    fill(255, 50);
    stroke(0);
    strokeWeight(4);
    ellipse(x, y, r, r);
  }
}
