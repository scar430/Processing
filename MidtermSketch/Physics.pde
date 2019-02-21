//Seth Banker
//Chris and Ethan helped fix movement and made it less janky.
//Container for Physics stuff.

//rigidbody meant to act in 2d space (ddRB = 2D RigidBody), mainly for just saving x and y
class ddRB {
  rPrimitive object;//Primitive this rigidbody is being added to
  float velocity;//speed
  
  //Constructor
  ddRB(rPrimitive _object, float _velocity){
    object = _object; 
    velocity = _velocity;
  }
  
  //Used for moving an object in a direction with an option to stop at the target
  void direction(float tX, float tY){
      float magnitude;
      float xLength;
      float yLength;
    
     xLength = tX - object.x;//Distance of target x and current x position
     yLength = tY - object.y;//Distance of target y and current y position
     magnitude = sqrt(xLength * xLength + yLength * yLength);//finding the magnitude
     
     if((tX - object.x) > 2 || (tX - object.x) < -2){
       //Move the object.x towards the target x, with an error of 2
       object.x += xLength * velocity/magnitude;
     }
     if((tY - object.y) > 2 || (tY - object.y) < -2){
       //Move the object.y towards the target y, with an error of 2
       object.y += yLength * velocity/magnitude;
     }
  }
}
