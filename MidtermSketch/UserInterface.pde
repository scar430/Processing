//Seth Banker
//Collection of UI stuff

class Button{
  
  float x;
  float y;
  float w;
  float h;
  
  String label;
  rPrimitive visual;
  
  Button(float _x, float _y, float _w, float _h, String _label, rPrimitive _visual){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    label = _label;
    visual = _visual;
  }
  
  void display(){
    if(visual.image != null){
      image(visual.image, x, y, w, h);
    }
    else
    {
      rect(x, y, w, h);
    }
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(20);
    text(label, x, y, w, h);
  }
  
  Boolean CheckBounds(Vector object){
    if(object.x > x && object.x < x + w && object.y > y && object.y < y + h){
      return true;
    }
    else{
      return false; 
    }
  }
}

class Menu{
  float x;
  float y;
  float w;
  float h;
  
  rPrimitive visual;
  
  Button[] buttons;
  
  Menu(float _x, float _y, float _w, float _h, rPrimitive _visual, Button[] _buttons){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    visual = _visual;
    buttons = _buttons;
  }
  
  void display(){
    visual.display();
    for(Button butt : buttons){
      butt.display();
    }
  }
}
