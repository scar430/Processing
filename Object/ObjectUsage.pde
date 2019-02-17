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
  
  square.red = 255;
  square.green = 255;
  square.blue = 255;
  square.alpha = 255;
  square.stroke = 5;
}

void draw() {
  square.x = mouseX;
  square.y = mouseY;
  background(200);
  square.drawPrimitive();

  /*
  For comparison:
  
  background(0);
  stroke(5)
  fill(255, 255, 255, 255);
  rect(mouseX, mouseY, 30, 30);
  */
}
