/*Recreate an old computer art 
 Intro to IM
 Zou Xinyi
 My idea is to have 2 cubes that are at different rotating angles. Each of them has a shadow cube in the background that disrupts the line of the original cube.
 inspirations: http://recodeproject.com/artwork/v3n1p139b; https://processing.org/tutorials/p3d/;https://processing.org/reference/box_.html
 Special thanks to Alex Edwards for the inspiration for the rotation function*/

import java.util.Random; 

public void settings() {
  size(700, 300, P3D);
}

void setup() {

  background(255);
  strokeWeight(3); 

  stroke(0); 

  //initial position 
  translate(200, 150, 0); 

  for (int i = 0; i < 2; i++) { //incrementing loop for the 2 cubes
    strokeWeight(3); 
    Random rand = new Random(); //setting a random angle that causes the rotation of the cube
    float rot1 = rand.nextFloat(); 
    float rot2 = rand.nextFloat();
    rotateZ(rot1);             //rotate the frame
    box(100, 100, 100);        //draw 'unrotated' cube in rotated frame
    translate(-100, 0, 0);  //putting the white box in the right covering spot
    stroke(255); 
    box(100, 100, 100); //draws a white box that covers one side of the cute
    stroke(0); 
    translate(100, 0, 0); //reverts everything back to normal
    rotateZ(-rot1);             //rerotate back the frame so now only the cube is rotated
    noFill();  

    strokeWeight(1);         // repeat
    rotateZ(rot2);
    box(100, 100, 100);
    rotateZ(-rot2); 

    translate(300, 0, 0);
  }

}
