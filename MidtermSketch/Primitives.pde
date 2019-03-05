//Seth Banker
//Declaring new primitives because I hate how Processing handles Primitives. (plus, mine are ez pz)

//Rectangle Primitive : Bascially a different way for rect() to work and combines it all in one, designed for cutting down redundancy (and hopefully reduces mistakes)
class rPrimitive{
  
  float x;//x position
  float y;//y position
  float w;//width
  float h;//height
  
  //RGBA values, self-explanatory.
  float red;
  float green;
  float blue;
  float alpha;
  
  //Width of the stroke.
  float stroke;
  
  //PImage used to represent the object. (Optional)
  PImage image;
  
  //Constructor
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
  
  //Draws the rPrimitive.
  void display(){
    fill(red, green, blue, alpha);//Color using the RGBA values defined above.
    stroke(stroke);//Stroke using the width of the stroke defined above.
    //If the PImage value is NOT null then draw the primitive as an image.
    if(image != null){
      image(image, x, y, w, h);//Draw Image using the PImage, x, y, width, height values defined above.
    }
    //If the PImage value was null then draw the primitive as a rect.
    else
    {
      rect(x, y, w, h);//Draw Rect using the x, y, width, height values defined above.
    }
  }
}
