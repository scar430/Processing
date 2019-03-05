//Seth Banker
//Collection of UI stuff

//Looking back now, this was sparse on comments as I was messing around a lot and just was trying to get it to work. I think looking through the project it becomes easy to understand my methodology and most things in here are self-explanatory.

//Button, basically an rPrimitive with an easy function for checking bounds.
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
  
  //This is often used as a variable in 'if' statements.
  Boolean CheckBounds(Vector object){
    if(object.x > x && object.x < x + w && object.y > y && object.y < y + h){
      //In bounds
      return true;
    }
    else{
      //Not in bounds
      return false; 
    }
  }
}

//Was gonna add functionality for formatting and aligning buttons however the plan fell through as I already have the application workign and don't want to mess it up.
class Menu{
  float x;
  float y;
  float w;
  float h;
  
  rPrimitive visual;//Background
  
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
      //teehee, butt.
      butt.display();
    }
  }
}
