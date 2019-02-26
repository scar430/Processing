//Seth Banker

//***Chris and Ethan helped fix movement and made it less janky.***
//Collection of Physics stuff.

//Rigidbody meant to act in 2d space.
class RigidBody {
  rPrimitive object;//rPrimitive used to visualize this rigidBody.
  float velocity;//Used to set speed
  
  //Constructor
  RigidBody(rPrimitive _object, float _velocity){
    object = _object;//rPrimitive we will be using to enact forces on.
    velocity = _velocity;//How fast can this bad boy go?
  }
  
  //Used for moving an object towards a target at a set rate of speed.
  void direction(float tX, float tY){
      float magnitude;//Basically size. Kinda used as a ratio with velocity.
      
      //Rise over Run code.
      float xLength;//Used to find length between the current-x and target-x.
      float yLength;//Used to find length between the current-y and target-y.
    
     xLength = tX - object.x;//Distance between target x and current x position
     yLength = tY - object.y;//Distance between target y and current y position
     magnitude = sqrt(xLength * xLength + yLength * yLength);//Finding the magnitude by adding the run(xLength) squared and rise(yLength) squared and finding the suqare root of that.
     
     //If the object is NOT in the target x, within the error of 2, then...
     if((tX - object.x) > 2 || (tX - object.x) < -2){
       object.x += xLength * velocity/magnitude;//Move the object.x towards the target x.
     }
     //If the object is NOT in the target y, within the error of 2, then...
     if((tY - object.y) > 2 || (tY - object.y) < -2){
       object.y += yLength * velocity/magnitude;//Move the object.y towards the target y.
     }
  }
  
  //Normalized Direction Code, doesn't quite work right yet (cuz I broke it and haven't fixed it) but you probably don't need it anyway.
  void normalizedDirection(float tX, float tY){
      float magnitude;//Basically size
      
      //Rise over Run Code
      float xLength;//Length between the current-x and target-x.
      float yLength;//Used to find length between the current-y and target-y.
    
     xLength = tX - object.x;//Distance between target x and current x position.
     yLength = tY - object.y;//Distance between target y and current y position.
     magnitude = sqrt(tX * tX + tY * tY);//Finding the magnitude by adding the run(xLength) squared and rise(yLength) squared and finding the suqare root of that.
     
     //Normalizing the lengths.
     if(magnitude != 0){
      xLength /= magnitude;
      yLength /= magnitude;
     }
     
     //If the object is NOT in the target x, within the error of 2, then...
     if((tX - object.x) > 2 || (tX - object.x) < -2){
       object.x += xLength * velocity;//Move the object.x towards the target x.
     }
     
     //If the object is NOT in the target y, within the error of 2, then...
     if((tY - object.y) > 2 || (tY - object.y) < -2){
       object.y += yLength * velocity;//Move the object.y towards the target y.
     }
  }
}

//Used to save Vectors
class Vector{
  float x;
  float y;
  Vector(float _x, float _y){
    x = _x;
    y = _y;
  }
}
