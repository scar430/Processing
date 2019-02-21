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
  
  //Sprite used for the object
  PImage image;
  
  rPrimitive(float _x, float _y, float _w, float _h, float _red, float _green, float _blue, float _alpha, float _stroke, PImage _image){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    
    red = _red;
    green = _green;
    blue = _blue;
    alpha = _alpha;
    
    stroke = _stroke;
    
    image = _image;
  }
  
  //drawPrim() draws the rPrimitive object
  void createPrim(){
    fill(red, green, blue, alpha);
    stroke(stroke);
    if(image != null){
      image(image, x, y, w, h);
    }
    else
    {
      rect(x, y, w, h);
    }
  }
}
