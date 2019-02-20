//Seth Banker
//Easier Primitives

Primitive square = new Primitive();

public void settings() {
  size(500, 500);
}

void setup() {
  //Declare everything once
  square.x = 1;
  square.y = 1;
  square.w = 30;
  square.h = 30;
  
  square.stroke = 5;
  
  //square is default white and opaque so no color values for now.
}

void draw() {
  //Primitive follows mouse 
  square.x = mouseX;
  square.y = mouseY;
  //Wipe background
  background(200);
  //Draw square
  //square.drawPrimitive(PImage);
  square.drawPrimitive();

  /*
  For comparison:
  
  //Wipe abckground
  background(0);
  //Stroke is 5 pixels wide
  stroke(5)
  //Color square white and make it opaque
  fill(255, 255, 255, 255);
  //Draw rect at mouse position and make it 30 wide
  rect(mouseX, mouseY, 30, 30);
  */
}
