//Seth Banker
//Container for Physics stuff.

//rigidbody meant to act in 2d space (ddRB = 2D RigidBody), mainly for just saving x and y
class ddRB {
  float x;
  float y;
  float velocity;
  
  ddRB(float _x, float _y, float _velocity){
     x = _x;
     y = _y;
     velocity = _velocity;
  }
  
  //used for moving one vector to another
  void direction(float tX, float tY){
    float magnitude;
    float xLength;
    float yLength;
    
     xLength = tX - x;//Distance of target x and current x position
     yLength = tY - y;//Distance of target y and current y position
     magnitude = sqrt(x * x + y * y);//finding the magnitude
     if(magnitude != 0){
       //This is supposed to create a normalized x value but i don't know if i am doing it right since the further apart the target and current object are the faster it moves, or maybe I'm miss understanding what the point of normalizing is?
       xLength /= magnitude;
       yLength /= magnitude; 
     }
  }
  
  void moveTo(float tX, float tY, float xLength, float yLength){
    if((tX - x) > 2 || (tX - x) < -2){
       x += xLength * velocity;
     }
     if((tY - y) > 2 || (tY - y) < -2){
       y += yLength * velocity;
     }
  }
}
