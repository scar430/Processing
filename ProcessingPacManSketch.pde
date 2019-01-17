//Entity width/height
public float eSize = 90.0;
//Entity eyeball width/height
public float eEyeSize = 15.0;

//Initial Horizontal offset, prevents sticking to edge
public float pmHOffset = 50.0; //This is gonna be added

//Where PacMan's eyeball is positioned.
public float pmEyeOffset = 25.0; //This is gonna be subtracted

//Primary color
public float pColor = 255.0;
//Secondary color
public float sColor = 50.0;

//Ghost1's width/height
public float g1Size = 80.0;
//Ghost1's color
public float g1Color = 255;


void setup()
{
  //background size
  size(800, 400);
  //background color
  background(0, 0, sColor);
  
  //Color PacMan's body.
  fill(pColor, pColor, 0);
  //Draw PacMan's body
  arc(pmHOffset, height/2, eSize, eSize, QUARTER_PI, PI+HALF_PI+QUARTER_PI, PIE);
  
  //Color PacMan's Eyes
  fill(0, 0, sColor);
  //Draw PacMan's Eyes
  ellipse(pmHOffset/2 + pmEyeOffset, height/2 - pmEyeOffset, eEyeSize, eEyeSize);
  
  //QUANTITY OF GHOSTS
  float[] ghosts = new float[4];
  
  //Draw Ghost bodies
  for(int i = 0; i < (ghosts.length); i++){
    float ghHOffset = (eSize*2) + ((eSize*i)*2);
  
    //Color Ghost feet
    fill(0,0,255);
    //Draw Ghost Head
    arc(ghHOffset, (height/2) + (eSize/2), eSize, eSize*2, PI,PI+PI, PIE);
    
    //Number of Ghost feet
    float[] feet = new float[3];
    //Width of feet
    float fWidth = (eSize/feet.length);
    //Height of feet
    float fHeight = ((eSize/feet.length) /2);
  }
  
  //Draw ghost eyes
  float[] gEyes = new float[(ghosts.length*2)];
  for(int i = 0; i < gEyes.length; i++){
    float ghHOffset = (eSize*2) + ((eSize*i)*2);
    fill(255);
    ellipse(ghHOffset-10, height/2 - pmEyeOffset, eEyeSize, eEyeSize);
    ellipse(ghHOffset+10, height/2 - pmEyeOffset, eEyeSize, eEyeSize);
  }
}
