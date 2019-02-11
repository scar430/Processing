//Seth Banker

float menuHeight;//How large the menu you will be
float menuIndentation = 0.1;//percentage of menu space that the menu buttons is indented

float canvasIndentation = 0.03;//percentage of canvas space that the canvas is indented

float aoeWidth = 6;//Area of effect Width
float aoeHeight = 6;//Area of effect Height

void setup(){
  
  size(500, 500);//Size can be any size
  background(240);//Light Gray background
  menuHeight = (height*0.1);//Menu height is a eprcentage of height
  
  //Draw Menu
  line(0, menuHeight, width, menuHeight);//Just an aesthetic border
  fill(200);//Menu color
  noStroke();//Remove border, this is replaced by the above line() function
  rect(0,0,width, menuHeight);//Drawing the menu across the top of the screen
  
  //Draw Save Button
  stroke(5);//Add border
  fill(255);//Color it white
  rect((menuHeight * menuIndentation), (menuHeight * menuIndentation), menuHeight - (menuHeight * menuIndentation) * 2, menuHeight - (menuHeight * menuIndentation) * 2);//Drawing a square button to fit into the menu bar
  
  //Draw change color button
  
  //Draw Canvas
  stroke(5);//Add border
  fill(255);//Color it white
  rect((width*canvasIndentation), (menuHeight + (height * canvasIndentation)), (width - ((width*canvasIndentation)*2)), ((height - ((height*canvasIndentation)*2)) - menuHeight));
}

void draw(){
  //This draws with the selected brush and color, sets the brush's center to the mouseX and mouseY
  if(mousePressed && mouseX > ((width*canvasIndentation) + (aoeWidth/2)) && mouseX < (width - ((width*canvasIndentation)) - (aoeWidth/2)) && mouseY > (menuHeight + (height * canvasIndentation) + (aoeHeight/2)) && mouseY < (height - (height*canvasIndentation) - (aoeHeight/2)) ){
    rect((mouseX - (aoeWidth/2)), (mouseY - (aoeHeight/2)), aoeWidth, aoeHeight);
  }
}

void mouseReleased(){
  //When the players mouse is within the Save Button bounds it will save the canvas's current state
  if(mouseX > (menuHeight * menuIndentation) && mouseX < (menuHeight - (menuHeight * menuIndentation) * 2) && mouseY > (menuHeight * menuIndentation) && mouseY < (menuHeight - (menuHeight * menuIndentation) * 2)){
    //rounds canvas x/y positions and the canvas width/height to int to use in createImage() and updatePixels
    int iX = round((width*canvasIndentation) + 1);
    int iY = round((menuHeight + (height * canvasIndentation)) + 1);
    int iWidth = round((width - ((width*canvasIndentation)*2)) - 1);
    int iHeight = round(((height - ((height*canvasIndentation)*2)) - menuHeight) - 1);
    //Create new image that is the size of the canvas
    PImage savedImage = createImage(iWidth, iHeight, RGB);
    //get the array of pixels from the canvas
    savedImage = get(iX, iY, iWidth, iHeight);
    //export the saved image as a jpg
    savedImage.save("savedImage.jpg");
  }
}
