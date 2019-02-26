//Seth Banker
//Executive file, this is where the magic happens

Menu startMenu;

//Player Code.
PImage playerSprite;//PImage used to represent the player, used in conjunction with an "playerPrimitive".
rPrimitive playerPrimitive;//rPrimitive used to represent the player, used in conjunction with "playerSprite".
RigidBody player;//2D RigidBody used for applying physics to the player, used in conjunction with "playerPrimitive"

//Meteor Waves Code.
ArrayList<EntityWave> waves = new ArrayList<EntityWave>();//ArrayList used to manage Meteor Waves, also helps with performance as you can stop using waves when you are done with them.
int waveTime;//Integer used to benchmark time and signals waves, used in conjunction with "waveInt".
int waveInt = 1000;//Integer used as an interval and is added onto "waveTime" in order to refresh it.
PImage meteorSprite;//PImage used to represent meteors.

PGraphics deathScreen;//PGraphic that is drawn on death to indicate the game is over.

enum gameState{
  Menu, 
  Difficulty,
  Game,
  Death
}

gameState state = gameState.Menu;

public void settings() {
  size(400, 400, P3D);//P3D mode was added in order to add z values. This helps with PGraphics.
}

void setup() {
  deathScreen = createGraphics(width, height);//deathScreen the PGraphic is initialized here.
  death();
  
  waveTime = waveInt;//waveTime is initialized as equal to waveInt in order to benchmark time from 0.
  
  meteorSprite = loadImage("meteorSprite.png");//meteorSprite, the PImage, is initialized as a file known as "meteorSprite.png" and is located in sketchPath().
  
  //Player Initialize code.
  playerSprite = loadImage("playerSprite.png");//playerSprite, the PImage, is initialized as a file known as "playerSprite.png" and is located in sketchPath().
  playerPrimitive = new rPrimitive(width/2-30.0F, height - 30.0F, 30.0F, 30.0F, 0.0F, 100.0F, 200.0F, 255.0F, 5.0F, playerSprite);//playerPrimitive ,the rPrimitive, is initialized here and used in conjunction with "player", the ddRb (2D rigidbody).
  player = new RigidBody(playerPrimitive, 5);//player, the ddRB (2D rigidbody), is used to enact forces onto the player.
  
  //Menu Initialize
  rPrimitive buttonDisplay = new rPrimitive(0, 0, width * 0.5, height * 0.25, 255, 255, 255, 255, 5, null);
  Button startGame = new Button((width * 0.25), (height * 0.25), (width * 0.5), (height * 0.25),  "Start Game", buttonDisplay);
  rPrimitive menuDisplay = new rPrimitive(0, 0, width, height, 255, 255, 255, 255, 0, null);
  Button[] buttons = { startGame };
  startMenu = new Menu(0, 0, width, height, menuDisplay, buttons);
}

void draw() {
  background (30);//Background is set to 30, a little lighter than black, helps reduce the loss of detail.
  
  switch(state){
    case Menu:
      background(0);//wipe background
      startMenu.display();//Show the Start Menu
    break;
    
    case Difficulty:
      
    break;
    
    case Game:
      background(0);
      //If any mouse button is pressed...
      if (mousePressed) {
        /*
        Move the players rigidbody towards the target position using the direction(float, float) function.
        This will move the players rigidbody and all other involved aspects towards the target x and y.
        */
        player.direction(mouseX - (player.object.w/2), mouseY - (player.object.h/2));
      }
      
      
      //Out of Bounds Code.
      //If player is outside of the RIGHT bounds...
      if((player.object.x + player.object.w) > width){
        player.object.x = (width - player.object.w);//Reset the player back to where there x was before crossing the bounds.
      }
      //If player is outside of the LEFT bounds...
      if(player.object.x < 0){
        player.object.x = 0;//Reset the player back to where there x was before crossing the bounds.
      }
      //If player is outside of the BOTTOM bounds...
      if(player.object.y + player.object.h > height){
        player.object.y = (height - player.object.h);//Reset the player back to where there x was before crossing the bounds.
      }
      //If player is outside of the TOP bounds...
      if(player.object.y < 0){
        player.object.y = 0;//Reset the player back to where there x was before crossing the bounds.
      }
      
      //Collision Code
      //For all of the waves
      for(EntityWave wave : waves){
        //For all of the meteors in these waves
        for(RigidBody rb : wave.channel.values()){
          //If the players x and x + width are within the bounds of the meteor...
         if(player.object.x > rb.object.x && player.object.x < (rb.object.x + rb.object.w) && player.object.y > rb.object.y && player.object.y < (rb.object.y + rb.object.h)|| (player.object.x + player.object.w) > rb.object.x && (player.object.x + player.object.w) < (rb.object.x + rb.object.w) && player.object.y > rb.object.y && player.object.y < (rb.object.y + rb.object.h)){
           state = gameState.Death;//die :(
         }
        }
      }
      
      //***NOTE*** implement ship turning towards the mouse and resetting position on mouse release
      playerPrimitive.display();//Draw player PImage, this is the visual representation of the player.
      
      //If the allotted time has passed... (current time > allotted time)
      if (millis() > waveTime) {
        waveTime += waveInt;//Add waveInt to waveTime in order to create the next time benchmark.
        EntityWave wave = new EntityWave(5);//Create a new EntityWave since the benchmark has been reached
        wave.createWave();//Create the new wave
        waves.add(wave);//Add the wave to the ArrayList, waves, in order to use it.
        
        print("New Wave!\n");//Debug feature to signal new wave.
      }
      
      //For every EntityWave in waves : wave.moveWave(ArrayList waves). This applies the Physics method direction(float, float) to all entites in the wave.
      for(EntityWave wave : waves){
        //This applies the Physics method direction(float, float) to all entites in the wave and parses in the ArrayList "waves" in order to remove the element from the list when it is no longer in view.
        wave.moveWave();
      }
    break;
    
    case Death:
      death();//Make Death screen
      delay(2000);
    break;
  }
  
  print(state + "\n");
}

void mouseReleased(){
  switch(state){
    case Menu:
    Vector vector = new Vector(mouseX, mouseY);//Make a new vector to reference in CheckBounds()
    //If the mouse is within the buttons bounds
    if(startMenu.buttons[0].CheckBounds(vector) == true){
      setPlayer();//Reset the player
      state = gameState.Game;
    }
    break;
    
    case Difficulty:
    
    break;
    
    case Game:
    
    break;
    
    case Death:
    state = gameState.Menu;
    break;
  }
}

void death(){
  print("COLLISION\n");//Debug, detect collisions.
      
  //Death Screen Code.
  deathScreen.beginDraw();//Being drawing the "PGraphic deathScreen".
  background(0);//Wipe the background and color it black.
  textAlign(CENTER, CENTER);//Text in the center of the screen.
  textSize(25);//Text size is 100.
  fill(255);//The text color is white.
  text("YOU DIED", 0, height/2 - 25, width, 50);//Display textBox with the string "YOU DIED".
  text("Press any button to continue.", 0, height/2 + 25, width, 50);//Display textBox with the string "YOU DIED".
  deathScreen.endDraw();//End drawing the "PGraphic deathScreen".
  
  //Display PGraphic Code.
  translate(0, 0, 999);//Translate the z-value to 999. (Most reliable, higher values can sometimes cause blank images).
  image(deathScreen, 0, 0, width, height);//Draw the "PGraphic deathScreen", as an image and make it take up the whole screen
}

//Set the players position to default position.
void setPlayer(){
  waveTime = millis() + waveInt;//Reset the time for wave intervals
  waves.clear();//Remove allthe waves
  player.object.x = (width/2) - (player.object.w/2);//Reset player x
  player.object.y = height - player.object.h;//Reset the player y
}
