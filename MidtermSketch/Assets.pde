//Seth Banker
//Classes specific to this sketch

//EntityWave, the class, is used to create new waves of meteors by signalling the x range and at what y, the amount of meteors to spawn, and if the meteors can ever overlap.
//Waves move vertically.
class EntityWave{
  int amount;//amount, amount of meteors in a wave that should spawn
  HashMap<Vector, RigidBody> channel = new HashMap<Vector, RigidBody>();
  
 //Constructor. 
 EntityWave(int _amount){
   amount = _amount;//Set how many will spawn.
 }
 
  //Creates a map for meteors to travel through
  void createWave(){
    ArrayList<Vector> vectors = new ArrayList<Vector>();
    //For loop used to create channels for meteors
     for(int i = 0; i <= width; i += 40){
       Vector vector = new Vector(i, -40);
       vectors.add(vector);
    }
    for(int i = 0; i < amount; i++){
      rPrimitive prim = new rPrimitive(i, -40, 40, 40, 255, 255, 255, 255, 0, meteorSprite);//Create new rPrimitive for a RigidBody
      RigidBody rb = new RigidBody(prim, 3);//Create a new RigidBody
      int num = int(random(int(0), int(vectors.size() - 1)));
      rb.object.x = vectors.get(num).x;
      channel.put(vectors.get(num), rb);
    }
  }
  
  //Move all meteors in the wave
  void moveWave(){
    for(RigidBody rb : channel.values()){
      rb.direction(rb.object.x, (height + rb.object.h));
      rb.object.display();
      if(rb.object.y > height + rb.object.h){
        print("Channel Cleared");
        channel.clear();
        break;
      }
    } 
  }
}
