/*
iNTRO TO IM
xz2043 Zou Xinyi
for this assignment, I tweaked around the image of a banana. I tried to mimick
something that gives some pop-art/Andy Warhol/velvet undergroundish vibes.
references:https://processing.org/tutorials/color/;
https://processing.org/reference/green_.html
*/

PImage banana;

void setup() {
  size(710, 828);
  banana=loadImage("banana.jpg");
}

void draw() {
  image(banana, 0, 0);
  loadPixels();
  banana.loadPixels();
  for (int x=0; x<width; x++) {
    for (int y=0; y<height; y++) {
      float d=dist(x, y, width/2, height/2);
      int location= x+y*width;
      //get the rgb components from the image 
      float r=red(banana.pixels[location]);
      float g=green(banana.pixels[location]);
      float b=blue(banana.pixels[location]);
      pixels[location]= color(r*3, g, b);
    }
  }
  updatePixels();
}
