//Seth Banker

float menuHeight;//How large the menu you will be
float indentation = 0.03;//percentage of canvas space that the canvas is indented

float aoeWidth = 6;//Area of effect Width
float aoeHeight = 6;//Area of effect Height

void setup(){
  
  size(500,500);//Size can be any size
  background(240);//Light Gray background
  menuHeight = (height*0.1);//Menu height is a eprcentage of height
  
  //Draw menu
  line(0, menuHeight, width, menuHeight);//Just an aesthetic border
  fill(200);//Menu color
  noStroke();//Remove border, this is replaced by the above line() function
  rect(0,0,width, menuHeight);//Drawing the menu across the top of the screen
  
  
  
  //Draw Canvas
  stroke(5);//Add border after it was removed above
  fill(255);//Color it white
  rect((width*indentation), (menuHeight + (height * indentation)), (width - ((width*indentation)*2)), ((height - ((height*indentation)*2)) - menuHeight));
}

void draw(){
  
  //This draws with the selected brush and color
  if(mousePressed && mouseX > ((width*indentation) + (aoeWidth/2)) && mouseX < (width - ((width*indentation)) - (aoeWidth/2)) && mouseY > (menuHeight + (height * indentation) + (aoeHeight/2)) && mouseY < (height - (height*indentation) - (aoeHeight/2)) ){
    rect((mouseX - (aoeWidth/2)), (mouseY - (aoeHeight/2)), aoeWidth, aoeHeight);
  }
}
