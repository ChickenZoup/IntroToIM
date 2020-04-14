/* For this assignment on data visualization, I came up with a set of data about people's favorite boba flavors. The size of the circle next to each flavor corresponds to the amount of votes it received. The user can also click mouse to change the colors being displayed. 
references:   https://www.youtube.com/watch?v=pJthD0t6k1U 
              https://stackoverflow.com/questions/4208655/empty-an-array-in-java-processing
              https://processing.org/reference/mousePressed.html
              https://processing.org/reference/mouseClicked_.html*/
Table bobaData; 
PImage backgroundimage;
int textcolorToFill[] = new int[]{209, 166, 128};  //create an empty array for the color of the texts
int morethan20color[]=new int[]{209, 166, 128};//create an empty array for the color of circles for flavors with more than 20 votes
int lessthan20color[]=new int[]{139, 173, 224};//create an empty array for the color of circles for flavors with less than 20 votes

void setup() {
  size (800, 600);
  bobaData=loadTable("data.csv", "header"); //avoids the program from running the first row of the csv file, which is just the categories of the data
  textAlign(LEFT, CENTER); //make sure the text is alligned so it looks nice with the ellipses
}

void draw() {
  backgroundimage=loadImage("background.jpg"); //adds the background image 
  background(backgroundimage); 

  for (int i=0; i<bobaData.getRowCount(); i++) { //runs through each row of the dataset 
    fill(textcolorToFill[0], textcolorToFill[1], textcolorToFill[2]); //text with the initial color 
    text(bobaData.getString(i, 0), 100/*x-axis location*/, 50+i*100/*line spacing of each flavor*/);//print out all the names of the flavors
    textSize(30);
    if (bobaData.getFloat(i, 1)<20) { //if the flavor has less than 20 votes, have this color
      fill(morethan20color[0], morethan20color[1], morethan20color[2]);
    } else { //otherwise, have this color 
      fill(lessthan20color[0], lessthan20color[1], lessthan20color[2]);
    }

    noStroke();
    ellipse(580, 50+i*100, bobaData.getFloat(i, 1)*2, bobaData.getFloat(i, 1)*2); //the circles are drawn next to the name of each flavor 

    if (mousePressed == true) { //if the mouse is pressed
      textcolorToFill = new int[]{129, 136, 128};  //changes color for the text and circles
      morethan20color=new int[]{139, 173, 224};
      lessthan20color=new int[]{209, 166, 128};
    } else { //if the mouse is released, the original set of colors are back 
      textcolorToFill = new int[]{209, 166, 128}; 
      morethan20color=new int[]{209, 166, 128};
      lessthan20color=new int[]{139, 173, 224};
    }
  }
}
