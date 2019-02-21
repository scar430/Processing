//Seth Banker
//Executive file, this is where the maic happens

//Player, a separate object for containing all these hasn't been made.
PImage playerSprite;
rPrimitive player;
ddRB playerRB;

public void settings() {
  size(500, 500);
}

void setup() {
  background(0);

  playerSprite = loadImage("playerSprite.png");
  player = new rPrimitive(0.0F, 0.0F, 30.0F, 30.0F, 0.0F, 100.0F, 200.0F, 255.0F, 5.0F, playerSprite);//Rectangle Primitive from rPrimitive class, this one is gonna be the player.
  playerRB = new ddRB(player, 5);
}

void draw() {
  background (0);//clear
  
  //If any mouse button is pressed...
  if (mousePressed) {
    //Move the players rigidbody towards the target position, target position is where ever the player clicks
    float x = mouseX;
    float y = mouseY;
    playerRB.direction(x, y);
  }
  
  //draw background objects layer 1
  /*float bObject1 = random(0, width);
  for(int i = 0; i < bObject1; i++){
    
  }*/
  
  //draw current player state.
  player.createPrim();
}
