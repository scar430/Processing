//Seth Banker
//Declaring new primitives because I hate how Processing handles Primitives.

//Rectangle Primitive : Bascially a different way for rect() to work and combines it all in one, designed for cutting down redundancy (and hopefully reduces mistakes)
class rPrimitive{
  
  float x;//x position
  float y;//y position
  float w;//width
  float h;//height
  
  //RGBA values
  float red;
  float green;
  float blue;
  float alpha;
  
  //stroke width
  float stroke;
  
  rPrimitive(){
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    
    red = 255;
    green = 255;
    blue = 255;
    alpha = 255;
    
    stroke = 0;
  }
  
  //drawPrim() draws the rPrimitive object
  void createPrim(){
    fill(red, green, blue, alpha);
    stroke(stroke);
    rect(x, y, w, h);
  }
}
