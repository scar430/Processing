//Seth Banker
float x;//target x
float y;//target y

//where the object is now
float curX;//x value
float curY;//y value

float velocity = 5;

float xLength;
float yLength;

float magnitude;//magnitude of current position and target position

void setup(){
  size(400,400);
  curX =1;
  curY = 1;
}

void draw(){
 if((x - curX) > 2 || (x - curX) < -2){
   curX += xLength * velocity;
 }
 if((y - curY) > 2 || (y - curY) < -2){
   curY += yLength * velocity;
 }
 background(255);
 stroke(5);
 fill(255,0,255);
 rect(curX, curY, 10,10);
}

void mouseReleased(){
  x = mouseX;
  y = mouseY;
  newTarget();
}

void newTarget(){
 xLength = x - curX;//Distance of target x and current x position
 yLength = y - curY;//Distance of target y and current y position
   magnitude = sqrt(x * x + y * y);//finding the magnitude
   if(magnitude != 0){
     //This is supposed to create a normalized x value but i don't know if i am doing it right since the further apart the target and current object are the faster it moves, or maybe I'm miss understanding what the point of normalizing is?
     xLength /= magnitude;
     yLength /= magnitude; 
   } 
}
