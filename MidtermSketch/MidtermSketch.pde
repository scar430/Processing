//Seth Banker
//Executive file, this is where the magic happens

//Player, a separate object for containing all these hasn't been made.
PImage playerSprite;
rPrimitive player;
ddRB playerRB;

//Incoming Meteors
PImage meteorSprite;
ArrayList<rPrimitive> meteors;

//Background Stars
ArrayList<rPrimitive> starsS;//First layer of stars, biggest and brightest
ArrayList<rPrimitive> starsSS;//Second layer of stars
ArrayList<rPrimitive> starsSSS;//Third layer of stars, smallest and dullest.

public void settings() {
  size(500, 500);
}

void setup() {
  background(100);
  
  meteors = new ArrayList<rPrimitive>();
  meteors.clear();
  
  starsS = new ArrayList<rPrimitive>();
  starsSS = new ArrayList<rPrimitive>();
  starsSSS = new ArrayList<rPrimitive>();

  playerSprite = loadImage("playerSprite.png");
  meteorSprite = loadImage("meteorSprite.png");
  player = new rPrimitive(width/2-30.0F, height - 30.0F, 30.0F, 30.0F, 0.0F, 100.0F, 200.0F, 255.0F, 5.0F, playerSprite);//Rectangle Primitive from rPrimitive class, this one is gonna be the player.
  playerRB = new ddRB(player, 5);
}

void draw() {
  background (30);//clear
  
  //If any mouse button is pressed...
  if (mousePressed) {
    //Move the players rigidbody towards the target position, target position is where ever the player clicks
    float x = mouseX;
    float y = mouseY;
    playerRB.direction(x, y);
  }
  
  if(meteors.size() < 5){
    rPrimitive meteor = new rPrimitive(random(0.0F, width), 0.0F, 40.0F, 40.0F, 255.0F, 255.0F, 255.0F, 255.0F, 0.0F, meteorSprite);
    meteors.add(meteor);
  }
  
  player.createPrim();//draw player sprite
  
  //For all the meteors in the ArrayList 'meteors' add 2 to their y
  for(rPrimitive meteor : meteors){
    meteor.y += 2;
    meteor.createPrim();
  }
  
  /*if(starsS.size() < 5){
    rPrimitive star = new rPrimitive(random(0.0F, width), 0.0F, 4.0F, 12.0F, 255.0F, 255.0F, 255.0F, 255.0F, 0.0F, null);
    starsS.add(star);
  }
  
  for(rPrimitive star : starsS){
    star.x += 1;
  }*/
  
  
  //***NOTE*** implement ship turning towards the mouse and resetting position on mouse release
  
  //draw current player state.
}
