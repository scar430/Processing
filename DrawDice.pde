//Whole number dice equipped with a debug window for testing alignment and the capabillity to adjust how many dice there are (these dice outputs will automatically format themselves) and change the range of these



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

//Number of dice
int[] dice = new int[6];


void setup(){
  //Background of the page
  background(255,255,255);
  
  //Size of window
  size(400,400);
  
  //Horizontal position of the output window (x)
  h = ((width/2) - (wi/2));
  
  //Vertical position of the output window (y)
  v = ((height/2) - (he*(dice.length/2)) - (he/2));
  
  //Roll (Debug. Remove this) 
  roll();
  
  debug = ("Height: " + str(he) + ", " + "Width: " + str(wi) + ", " + "Horizontal " + str(h) + ", " + "Vertical" + str(v) + ".");
}

void mouseReleased(){
  roll();
}

void roll(){
  background(255);
  for(int i = 0; i < dice.length; i++){
    float curRoll = round(random(0,6));
    display = str(curRoll);
    //Draw Text Box
    fill(0);
    textAlign(CENTER, CENTER);
    //Output box
    text(display, h, ((i*he)+v), wi, he);
  }
}

void draw(){
  textAlign(LEFT, CENTER);
    text(debug, 0, 0, wi, he);
}
