//Seth Banker
//Executive file, this is where the maic happens

rPrimitive player = new rPrimitive();//Rectangle Primitive from rPrimitive class, this one is gonna be the player.
ddRB playerRB = new ddRB(player, 5);

public void settings(){
  size(500,500);
}

void setup(){
  background(255);
  
  //Player Visual component
  player.x = 100;
  player.y = 100;
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
  if(mousePressed){
   float x = mouseX;
   float y = mouseY;
   playerRB.direction(x, y);
  }
  player.createPrim();//draw current player state.
}
