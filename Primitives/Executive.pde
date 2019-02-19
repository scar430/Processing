//Seth Banker
//Executive file is where the magic happens.

rPrimitive player = new rPrimitive();//Rectangle Primitive from rPrimitive class, this one is gonna be the player.

public void settings(){
  size(500,500);
}

void setup(){
  background(255);
  
  //Player Visual component
  player.w = 20;//width
  player.h = 20;//height
  
  player.red = 100;//red
  player.green = 200;//green
  player.blue = 255;//blue
  player.alpha = 255;//opacity
  player.stroke = 5;//stroke width
}

void draw(){
  background (255);//clear
  player.createPrim();//draw current player state.
}

void mouseReleased(){
  player.x = mouseX;
  player.y = mouseY;
  
  
}
