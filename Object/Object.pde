//Seth Banker
//Easier Primitives

class Primitive {
  float x;//x position of object
  float y;//y positiom of object
  float w;//width of object
  float h;//height of object
  
  float red;//red value
  float green;//green value
  float blue;//blue value
  float alpha;//opacity value
  float stroke;//stroke width

  //constructor
  Primitive() {
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    
    red = 0;
    green = 0;
    blue = 0;
    alpha = 0;
    stroke = 0;
  }

  //I really didn't like the rect argument and made a new argument for drawing rects, this is more of an "all in one".
  //drawPrimitive() draws a rect using the x, y, w, h variables from above and takes arguments for colors and stroke width.
  void drawPrimitive() {
    stroke(stroke);
    fill(red, green, blue, alpha);
    rect(x, y, w, h);
  }
}
