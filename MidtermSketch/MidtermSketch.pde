//Seth Banker
//Executive file, this is where the maic happens

rPrimitive player = new rPrimitive();//Rectangle Primitive from rPrimitive class, this one is gonna be the player.
ddRB pVec = new ddRB(player.x, player.y, 5);

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
  
  pVec.direction(mouseX, mouseY);
  player.x = pVec.x;
  player.y = pVec.y;
}
