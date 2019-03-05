//Seth Banker
//***NOTE*** scores are stored in a file called HighScores and contain text files that show the core, time, and date.
//Executive file, this is where the magic happens

//Menu Variables
Menu startMenu;
PImage menuScreen;

//Player Variables.
PImage playerSprite;//PImage used to represent the player, used in conjunction with an "playerPrimitive".
rPrimitive playerPrimitive;//rPrimitive used to represent the player, used in conjunction with "playerSprite".
RigidBody player;//2D RigidBody used for applying physics to the player, used in conjunction with "playerPrimitive"

//Meteor Waves Variables.
ArrayList<EntityWave> waves = new ArrayList<EntityWave>();//ArrayList used to manage Meteor Waves, also helps with performance as you can stop using waves when you are done with them.
int waveTime;//Integer used to benchmark time and signals waves, used in conjunction with "waveInt".
int waveInt = 1000;//Integer used as an interval and is added onto "waveTime" in order to refresh it.
PImage meteorSprite;//PImage used to represent meteors.

//Stars, I did this quickly so it's janky
PImage star;
rPrimitive[] stars = new rPrimitive[2];//Stars will be moved together

//Score, the two are used to mark start time and end time.
int startScore;
int endScore;

//enumerator for menus and setting game states
enum gameState{
  Menu, 
  Difficulty,//deprecated
  Game,
  Death
}

gameState state = gameState.Menu;

public void settings() {
  size(400, 400, P3D);//P3D mode was added in order to add z values. This helps with PGraphics.
}

void setup() {
  menuScreen = loadImage("menuScreen.jpg");//menu background
  
  //Make stars, this is janky cuz im in a hurry. I'm not even sure if this works.
  star = loadImage("stars.gif");//game background
  rPrimitive firstStarPrim = new rPrimitive(float(0), float(0), float(width), float(height), float(255), float(255), float(255), float(255), float(0), star);//Theres two star prims because one has to star off screen
  rPrimitive secondStarPrim = new rPrimitive(float(0), float(0 - height), float(width), float(height), float(255), float(255), float(255), float(255), float(0), star);
  stars = new rPrimitive[]{ firstStarPrim, secondStarPrim};
  
  waveTime = waveInt;//waveTime is initialized as equal to waveInt in order to benchmark time from 0.
  
  meteorSprite = loadImage("meteorSprite.png");//meteorSprite, the PImage, is initialized as a file known as "meteorSprite.png" and is located in sketchPath().
  
  //Player Initialize code.
  playerSprite = loadImage("playerSprite.png");//playerSprite, the PImage, is initialized as a file known as "playerSprite.png" and is located in sketchPath().
  playerPrimitive = new rPrimitive(width/2-30.0F, height - 30.0F, 30.0F, 30.0F, 0.0F, 100.0F, 200.0F, 255.0F, 5.0F, playerSprite);//playerPrimitive ,the rPrimitive, is initialized here and used in conjunction with "player", the ddRb (2D rigidbody).
  player = new RigidBody(playerPrimitive, 5);//player, the ddRB (2D rigidbody), is used to enact forces onto the player.
  
  //Menu Initialize
  rPrimitive buttonDisplay = new rPrimitive(0, 0, width * 0.5, height * 0.25, 0, 0, 0, 255, 255, null);
  Button startGame = new Button((width * 0.25), (height * 0.5), (width * 0.5), (height * 0.10),  "Start Game", buttonDisplay);
  rPrimitive menuDisplay = new rPrimitive(0, 0, width, height, 255, 255, 255, 255, 0, menuScreen);
  Button[] buttons = { startGame };
  startMenu = new Menu(0, 0, width, height, menuDisplay, buttons);
  //difficultyMenu = new Menu(0, 0, width, height, )
}

void draw() {
  switch(state){
    case Menu:
      background(0);//wipe background
      startMenu.display();//Show the Start Menu
      fill(255);
      textSize(40);
      text("METEOR SHOWER", 0, (height * 0.15), width, height * 0.25);
    break;
    
    case Difficulty:
      
    break;
    
    case Game:
      //***Note*** I added the moving stars as a proof-of-concept however they make me motion sick. There is another option below this for loop, it's commented out.
      //This moves all the stars
      //EDIT: I slowed the rate at which they move to 1, this makes it tolerable to look at.
      for(rPrimitive star : stars){
        if(star.y > height){
          star.y = (0 - height);
          star.display();
        }
        else{
          star.y += 1;
          star.display();
        }
      }
      
      //These stars stay still. dunno why I added the push and pops in retrospect probably something to do with z values.
      /*pushMatrix();
      image(star, 0, 0, width, height);
      popMatrix();*/
      
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
      
      //Collision Code / Performance Code
      //For all of the waves
      for(EntityWave wave : waves){
        //For all of the meteors in these waves
        for(RigidBody rb : wave.channel.values()){
          //If the players x and x + width are within the bounds of the meteor...
         if(player.object.x > rb.object.x && player.object.x < (rb.object.x + rb.object.w) && player.object.y > rb.object.y && player.object.y < (rb.object.y + rb.object.h)|| (player.object.x + player.object.w) > rb.object.x && (player.object.x + player.object.w) < (rb.object.x + rb.object.w) && player.object.y > rb.object.y && player.object.y < (rb.object.y + rb.object.h)){
           state = gameState.Death;//die :(
         }
         
         if(rb.object.y > (height + rb.object.h)){
           wave.channel.clear();
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
      }
      
      //For every EntityWave in waves : wave.moveWave(ArrayList waves). This applies the Physics method direction(float, float) to all entites in the wave.
      for(EntityWave wave : waves){
        //This applies the Physics method direction(float, float) to all entites in the wave and parses in the ArrayList "waves" in order to remove the element from the list when it is no longer in view.
        wave.moveWave();
      }
    break;
    
    case Death:
      death();//Make Death screen
    break;
  }
}

void mouseClicked(){
  switch(state){
    case Menu:
    Vector vector = new Vector(mouseX, mouseY);//Make a new vector to reference in CheckBounds()
    //If the mouse is within the buttons bounds
    if(startMenu.buttons[0].CheckBounds(vector) == true){
      
      //Setup the game and start it.
      setPlayer();//Reset the player
      state = gameState.Game;
      startScore = millis();
    }
    break;
    
    case Difficulty:
    
    break;
    
    case Game:
    
    break;
    
    case Death:
    endScore = millis();
    int score = int(round(((endScore - startScore) / 1000)));//Score is the milliseconds between the start and end of game then divided by a thousand to turn milliseconds into seconds.
    printScore(score);//Record the score and store it.
    state = gameState.Menu;
    break;
  }
}

void death(){
  print("COLLISION\n");//Debug, detect collisions.
      
  //Death Screen Code.
  background(0);//Wipe the background and color it black.
  textAlign(CENTER, CENTER);//Text in the center of the screen.
  textSize(25);//Text size is 100.
  fill(255);//The text color is white.
  text("YOU DIED", 0, height * 0.25, width, 50);//Display textBox with the string "YOU DIED".
  text("Click to continue.", 0, height * 0.5, width, 50);//Display textBox with the string "YOU DIED".
}

void printScore(int score){
  //Record Score
  String printScore = "User survived " + str(score) + " seconds in the Meteor Shower at " + str(hour()) + ":" + (str(minute())) + " on " + str(month()) + "/" + str(day()) + "/" + str(year());//Show score, time, date.
  String[] scoreAssembler = { printScore};//Not sure if you needed an array to put it into a txt file but I thought i'd do it anyway
  File[] files = listFiles("HighScores");//count the files to use it in the name of the file we're about to make, this prevents overwriting files.
  saveStrings("HighScores/" + "Score_" + str(files.length) + ".txt", scoreAssembler);//create that bad boi >:)
}

//Set the players position to default position.
void setPlayer(){
  waveTime = millis() + waveInt;//Reset the time for wave intervals
  waves.clear();//Remove allthe waves
  player.object.x = (width/2) - (player.object.w/2);//Reset player x
  player.object.y = height - player.object.h;//Reset the player y
}
