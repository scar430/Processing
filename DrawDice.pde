float curRoll;
//Horizontal and Vertical align of text box.
float h;//no touch
float v;// no touch
//Width and Height of text box
float wi = 200;
float he = 40;

//is equal to dice output
String display;


void setup(){
  //Background of the page
  background(255,255,255);
  
  //Size of window
  size(400,400);
  
  //Horizontal position of the output window (x)
  h = ((width/2) - (wi/2));
  
  //Vertical position of the output window (y)
  v = ((height/2) - (he/2));
  
  //Roll (Debug. Remove this) 
  roll();
}

void draw(){
  //Draw Text Box
  fill(0);
  textAlign(CENTER, CENTER);
  //Output box
  text(display, h, v, wi, he);
  
  //Input box
  text(display, h, (v+he), wi, he);
}

void mouseReleased(){
  roll();
}

void roll(){
  //Random roll and turn into string
  curRoll = random(6);
  curRoll = round(curRoll);
  display = str(curRoll);
  
  //Don't look at this, I'm sorry I failed you Joe.
  //this draws a new "canvas"
  fill(255,255,255);
  rect(0,0, width, height);
  text(display, h, v, 200, 80);
}
