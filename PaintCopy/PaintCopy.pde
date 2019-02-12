//Seth Banker

float menuHeight;//How large the menu you will be
float menuIndentation = 0.1;//percentage of menu space that the menu buttons is indented

float canvasIndentation = 0.03;//percentage of canvas space that the canvas is indented

//(This is for brushes and their shapes)
float brushAOE = 6;// Brush Area of Effect

//Menu Icons
PImage SaveIcon;

void setup(){
  
  size(500, 500);//Size can be any size
  background(240);//Light Gray background
  menuHeight = (height*0.1);//Menu height is a eprcentage of height
  
  //Draw Menu
  line(0, menuHeight, width, menuHeight);//Just an aesthetic border
  fill(200);//Menu color
  noStroke();//Remove border, this is replaced by the above line() function
  rect(0,0,width, menuHeight);//Drawing the menu across the top of the screen
  
  //***MENU BUTTONS***
  //Draw Save Button
  stroke(5);//Add border
  fill(255);//Color it white
  SaveIcon = loadImage("SaveIcon.png");
  rect((menuHeight * menuIndentation), (menuHeight * menuIndentation), menuHeight - (menuHeight * menuIndentation) * 2, menuHeight - (menuHeight * menuIndentation) * 2);
  image(SaveIcon ,(menuHeight * menuIndentation), (menuHeight * menuIndentation), menuHeight - (menuHeight * menuIndentation) * 2, menuHeight - (menuHeight * menuIndentation) * 2);//Drawing a square button to fit into the menu bar
  
  //Draw change color button
  
  
  //Draw Canvas
  stroke(5);//Add border
  fill(255);//Color it white
  rect((width*canvasIndentation), (menuHeight + (height * canvasIndentation)), (width - ((width*canvasIndentation)*2)), ((height - ((height*canvasIndentation)*2)) - menuHeight));
}

void draw(){
  //This draws with the selected brush and color, sets the brush's center to the mouseX and mouseY
  if(mousePressed && mouseX > ((width*canvasIndentation) + (brushAOE/2)) && mouseX < (width - ((width*canvasIndentation)) - (brushAOE/2)) && mouseY > (menuHeight + (height * canvasIndentation) + (brushAOE/2)) && mouseY < (height - (height*canvasIndentation) - (brushAOE/2)) ){
    rect((mouseX - (brushAOE/2)), (mouseY - (brushAOE/2)), brushAOE, brushAOE);
  }
}

void mouseReleased(){
  //When the players mouse is within the Save Button bounds it will save the canvas's current state
  if(mouseX > (menuHeight * menuIndentation) && mouseX < (menuHeight - (menuHeight * menuIndentation) * 2) && mouseY > (menuHeight * menuIndentation) && mouseY < (menuHeight - (menuHeight * menuIndentation) * 2)){
    
    /*Rounds canvas x/y positions and the canvas width/height to int to use in createImage() and updatePixels.
    The weird little additions and subtractions are to remove the border around the image.*/
    int iX = round((width*canvasIndentation) + 1);
    int iY = round((menuHeight + (height * canvasIndentation)) + 1);
    int iWidth = round((width - ((width*canvasIndentation)*2)) - 1);
    int iHeight = round(((height - ((height*canvasIndentation)*2)) - menuHeight) - 1);
    
    //Create new image that is the size of the canvas
    PImage savedImage = createImage(iWidth, iHeight, RGB);
    //get the array of pixels from the canvas
    savedImage = get(iX, iY, iWidth, iHeight);
    
    //This is finding files in SavedImages/, this is used to reference what number the saved image is.
    File[] files = listFiles("SavedImages");
    
    //export the saved image as a jpg
    //savedImage.save("SavedImages/" + "savedImage" + (str(files.length)) + "/" + "savedImage" + (str(files.length)) + ".jpg");
    savedImage.save("SavedImages/" + "savedImage" + (str(files.length)) + ".jpg");
  }
}
