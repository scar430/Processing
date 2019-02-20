//Seth Banker
//Container for Physics stuff.

//rigidbody meant to act in 2d space (ddRB = 2D RigidBody), mainly for just saving x and y
class ddRB {
  rPrimitive object;
  float velocity;
  
  ddRB(rPrimitive _object, float _velocity){
    object = _object; 
     velocity = _velocity;
  }
  
  //used for moving one vector to another
  void direction(float tX, float tY){
      float magnitude;
      float xLength;
      float yLength;
    
     xLength = tX - object.x;//Distance of target x and current x position
     yLength = tY - object.y;//Distance of target y and current y position
     PVector vec = new PVector(xLength, yLength);//This is made into a vector in order to normalize xLength and yLength
     vec.normalize();
     /*magnitude = sqrt(object.x * object.x + object.y * object.y);//finding the magnitude
     if(magnitude != 0 && magnitude != 1){
       //This is supposed to create a normalized x value but i don't know if i am doing it right since the further apart the target and current object are the faster it moves, or maybe I'm miss understanding what the point of normalizing is?
       xLength /= magnitude;
       yLength /= magnitude; 
       print(xLength);
       print(yLength);
       print(magnitude);
     }*/
     
     if((tX - object.x) > 2 || (tX - object.x) < -2){
       object.x += vec.x * velocity;
       //object.x += xLength * velocity;
     }
     if((tY - object.y) > 2 || (tY - object.y) < -2){
       object.y += vec.y * velocity;
       //object.y += yLength * velocity;
     }
  }
}
