//Seth Banker
//Save Images, Change Brush Type, Change Brush Color, Change Brush Size, Fitted with a Scalable Menu, Tooltips, Icons, etc.

float menuHeight;//How large the menu you will be
float menuIndentation = 0.1;//percentage of menu space that the menu buttons is indented

float buttonX;
float buttonSize;

float canvasIndentation = 0.03;//percentage of canvas space that the canvas is indented

//(This is for brushes and their shapes)
float brushAOE = 6;// Brush Area of Effect

//Menu Icons
PImage SaveIcon;
PImage CircleBrush;
PImage SquareBrush;
PImage Up;
PImage Down;

enum BrushType{
 circle,
 square
}

BrushType brushType;

float r;
float g;
float b;

void setup(){
  size(700,700);//Size can be no less than 200
  DrawBackground();
}

void draw(){
  //This draws with the selected brush and color, sets the brush's center to the mouseX and mouseY
  if(mousePressed && mouseX > ((width*canvasIndentation) + (brushAOE/2)) && mouseX < (width - ((width*canvasIndentation)) - (brushAOE/2)) && mouseY > (menuHeight + (height * canvasIndentation) + (brushAOE/2)) && mouseY < (height - (height*canvasIndentation) - (brushAOE/2)) ){
    Brush(brushType, r, g, b);
  }
  
  //When mouse is over the Save Icon show hint, when it is not show the icon
  if(mouseX > buttonX && mouseX < buttonX + buttonSize && mouseY > (menuHeight * menuIndentation) && mouseY < (buttonSize) + (menuHeight * menuIndentation)){
    //Draw Background
    stroke(5);
    fill(255);
    rect(buttonX, (menuHeight * menuIndentation), buttonSize, buttonSize);
    
    //Draw Hint
    fill(0);
    textAlign(CENTER, CENTER);
    text("Save \n Image", buttonX, (menuHeight * menuIndentation), buttonSize, buttonSize);
  }
  else
  {
    //Draw Background
    stroke(5);
    fill(255);
    rect(buttonX, (menuHeight * menuIndentation), buttonSize, buttonSize);//This is part of the button aesthetics and also marks the boundries of the button
    image(SaveIcon, buttonX, (menuHeight * menuIndentation), buttonSize, buttonSize);//Drawing a square button to fit into the menu bar
  }
  
  //When mouse is over the Circle Brush Icon show hint, when it is not show the icon
  if(mouseX > buttonX * 2 && mouseX < (buttonX * 2) + buttonSize && mouseY > (menuHeight * menuIndentation) && mouseY < (buttonSize) + (menuHeight * menuIndentation))
  {
    //Draw Background
    stroke(5);
    fill(255);
    rect(buttonX * 2, (menuHeight * menuIndentation), buttonSize, buttonSize);//This is part of the button aesthetics and also marks the boundries of the button
    
    //Draw Hint
    fill(0);
    textAlign(CENTER, CENTER);
    text("Circle\nBrush", buttonX * 2, (menuHeight * menuIndentation), buttonSize, buttonSize);
  }
  else
  {
    //Draw Circle Brush
    stroke(5);//Add border
    fill(255);//Color it white
    rect(buttonX * 2, (menuHeight * menuIndentation), buttonSize, buttonSize);//This is part of the button aesthetics and also marks the boundries of the button
    image(CircleBrush, buttonX * 2, (menuHeight * menuIndentation), buttonSize, buttonSize);//Drawing a square button to fit into the menu bar
  }
  if(mouseX > buttonX * 3 && mouseX < (buttonX * 3) + buttonSize && mouseY > (menuHeight * menuIndentation) && mouseY <(buttonSize) + (menuHeight * menuIndentation)){
    //Draw Background
    stroke(5);
    fill(255);
    rect(buttonX * 3, (menuHeight * menuIndentation), buttonSize, buttonSize);//This is part of the button aesthetics and also marks the boundries of the button
    
    //Draw Hint
    fill(0);
    textAlign(CENTER, CENTER);
    text("Square\nBrush", buttonX * 3, (menuHeight * menuIndentation), buttonSize, buttonSize);
  }
  else{
    //Draw Circle Brush
    stroke(5);//Add border
    fill(255);//Color it white
    rect(buttonX * 3, (menuHeight * menuIndentation), buttonSize, buttonSize);//This is part of the button aesthetics and also marks the boundries of the button
    image(SquareBrush, buttonX * 3, (menuHeight * menuIndentation), buttonSize, buttonSize);//Drawing a square button to fit into the menu bar
  }
}

void mouseReleased(){
  //When the players mouse is within the Save Button bounds it will save the canvas's current state
  if(mouseX > buttonX && mouseX < buttonX + buttonSize && mouseY > (menuHeight * menuIndentation) && mouseY < buttonSize + (menuHeight * menuIndentation)){
    
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
  
  //Change BrushType to Circle
  if(mouseX > buttonX * 2 && mouseX < (buttonX * 2) + buttonSize && mouseY > (menuHeight * menuIndentation) && mouseY < (buttonSize) + (menuHeight * menuIndentation))
  {
    brushType = BrushType.circle;
  }
  
  //Change BrushType to Square
  if(mouseX > buttonX * 3 && mouseX < (buttonX * 3) + buttonSize && mouseY > (menuHeight * menuIndentation) && mouseY <(buttonSize) + (menuHeight * menuIndentation)){
    brushType = BrushType.square;
  }
}

void DrawBackground(){
  background(240);//Light Gray background
  menuHeight = (height*0.1);//Menu height is a percentage of height
  
  brushType = BrushType.square;
  
  //Draw Menu
  line(0, menuHeight, width, menuHeight);//Just an aesthetic border
  fill(200);//Menu color
  noStroke();//Remove border, this is replaced by the above line() function
  rect(0,0,width, menuHeight);//Drawing the menu across the top of the screen
  
  //***MENU BUTTONS***
  buttonSize = (menuHeight - (menuHeight * menuIndentation) * 2);
  buttonX = (menuHeight - (menuHeight * menuIndentation) * 2) + (menuHeight * menuIndentation);
  
  //Draw Save Button
  stroke(5);//Add border
  fill(255);//Color it white
  SaveIcon = loadImage("SaveIcon.png");//Loading image "SaveIcon" for future use.
  rect(buttonX, (menuHeight * menuIndentation), menuHeight - (menuHeight * menuIndentation) * 2, menuHeight - (menuHeight * menuIndentation) * 2);//This is part of the button aesthetics and also marks the boundries of the button
  image(SaveIcon, buttonX, (menuHeight * menuIndentation), buttonSize, buttonSize);//Drawing a square button to fit into the menu bar
  
  //Draw Circle Brush
  stroke(5);//Add border
  fill(255);//Color it white
  CircleBrush = loadImage("CircleBrush.png");//Loading image "CircleBrush" for future use.
  rect(buttonX * 2, (menuHeight * menuIndentation), buttonSize, buttonSize);//This is part of the button aesthetics and also marks the boundries of the button
  image(CircleBrush, buttonX * 2, (menuHeight * menuIndentation), buttonSize, buttonSize);//Drawing a square button to fit into the menu bar
  
  //Draw Square Brush
  stroke(5);//Add border
  fill(255);//Color it white
  SquareBrush = loadImage("SquareBrush.png");//Loading image "SquareBrush" for future use.
  rect(buttonX * 3, (menuHeight * menuIndentation), buttonSize, buttonSize);//This is part of the button aesthetics and also marks the boundries of the button
  image(SquareBrush, buttonX * 3, (menuHeight * menuIndentation), buttonSize, buttonSize);//Drawing a square button to fit into the menu bar
  
  //Draw Red up/down
  stroke(5);//Add border
  fill(255,0,0);//Color it white
  Up = loadImage("Up.png");//Loading image "SquareBrush" for future use.
  rect((buttonX * 4), (menuHeight * menuIndentation), buttonSize, buttonSize);//This is part of the button aesthetics and also marks the boundries of the button
  image(Up, (buttonX * 4) + (buttonSize*.25), (menuHeight * menuIndentation), buttonSize/2, buttonSize/3);//Drawing a square button to fit into the menu bar
  Down = loadImage("Down.png");
  image(Down, (buttonX * 4) + (buttonSize*.25), (menuHeight * menuIndentation), buttonSize/2, buttonSize/3);
  
  //Draw Canvas
  stroke(5);//Add border
  fill(255);//Color it white
  rect((width*canvasIndentation), (menuHeight + (height * canvasIndentation)), (width - ((width*canvasIndentation)*2)), ((height - ((height*canvasIndentation)*2)) - menuHeight));
}


void Brush(BrushType brush, float r, float g, float b){
  switch(brushType){
    case circle:
    fill(r,g,b);
    ellipse(mouseX - (brushAOE/2), mouseY - (brushAOE/2), brushAOE, brushAOE);
    break;
    case square:
    fill(r,g,b);
    rect(mouseX - (brushAOE/2), mouseY - (brushAOE/2), brushAOE, brushAOE);
    break;
  }
}
