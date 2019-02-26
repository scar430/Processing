//Seth Banker
//Classes specific to this sketch

//EntityWave, the class, is used to create new waves of meteors by signalling the x range and at what y, the amount of meteors to spawn, and if the meteors can ever overlap.
//Waves move vertically.
class EntityWave{
  int amount;//amount, amount of meteors in a wave that should spawn
  ArrayList<RigidBody> meteors = new ArrayList<RigidBody>();
  
 //Constructor. 
 EntityWave(int _amount){
   amount = _amount;//Set how many will spawn.
 }
 
  //Creates a map for meteors to travel through
  void createWave(){
    //For loop used to create channels for meteors
     for(int i = 0; i < width; i += 40){
       if(random(0, amount) < 1){
         rPrimitive prim = new rPrimitive(i, -40, 40, 40, 255, 255, 255, 255, 0, meteorSprite);//Create new rPrimitive for a RigidBody
         RigidBody rb = new RigidBody(prim, 3);//Create a new RigidBody
         meteors.add(rb);//Add Rigidbody to ArrayList, meteors.
       }
    }
    
    
  }
  
  //Move all meteors in the wave
  void moveWave(){
    for(RigidBody rb : meteors){
      rb.direction(rb.object.x, (height + rb.object.h));
      rb.object.display();
      if(rb.object.y > height + rb.object.h){
        meteors.remove(rb);
        break;
      }
    }
  }
}
