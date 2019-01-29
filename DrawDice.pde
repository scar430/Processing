//Whole number dice equipped with a debug window for testing alignment and the capabillity to adjust how many dice there are (these dice outputs will automatically format themselves) and change the range of these outputs

//Horizontal and Vertical align of text box.
float h;//no touch, horizontal
float v;// no touch, vertical

//Width and Height of text box
float wi = 200;//width
float he = 40;//height

//Used to display the dice output
String display;

//debug string
String debug;

int diceNum = 6;

//Number of dice
int[] dice = new int[diceNum]; //ASSIGNMENT REQUIREMENT : User can change size.


void setup(){
  background(255,255,255);
  //Size of window
  size(400,400);
  
  //Create Debug String
  debug = ("Height: " + str(he) + ", " + "Width: " + str(wi) + ", " + "Horizontal: " + str(h) + ", " + "Vertical: " + str(v) + ".");
  
  fill(0);
  //Create Debug Window
  debug(debug, 0, 0, wi, he);
  
  //Greeter Message
  greeter("Click to Start!");
}

void mouseReleased(){
  //Roll dice, Amount and Range included
  roll(dice.length, 10);
  
  //Redraw debug window
  debug(debug, 0, 0, wi, he);
}

//Function to roll number of dice and align them
void roll(int length_, float maxRange){
  //Horizontal position of the output window (x)
  h = ((width/2) - (wi/2));
  
  //Vertical position of the output window (y)
  v = ((height/2) - (he*(dice.length/2)) - (he/2));
  background(255);
  for(int i = 0; i < length_; i++){
    float curRoll = round(random(0,maxRange));
    display = str(curRoll);
    //Draw Text Box
    fill(0);
    textAlign(CENTER, CENTER);
    //Output box
    text(display, h, ((i*he)+v), wi, he);
  }
}

void debug(String text, float start, float end, float wi, float he){
  textAlign(LEFT, CENTER);
  text(text, start, end, wi, he);
}

void greeter(String greeting){
  textAlign(CENTER, CENTER);
  text(greeting, ((width/2) - (wi/2)), ((height/2) - (he/2)), wi, he);
}

void draw(){
  /*textAlign(LEFT, CENTER);
    text(debug, 0, 0, wi, he);*/
}
