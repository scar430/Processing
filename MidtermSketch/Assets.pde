//Seth Banker
//Classes specific to this sketch

//EntityWave, the class, is used to create new waves of meteors by signalling the x range and at what y the meteors to spawn.
//***NOTE*** the meteors are known to have a margin of error that ranges between 1 less than and 1 greater than the specified amount.
class EntityWave{
  int amount;//amount, amount of meteors in a wave that should spawn
  HashMap<Vector, RigidBody> channel = new HashMap<Vector, RigidBody>();//Hasmap used to pair a channel with a meteor
  
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
       vectors.add(vector);//This will be used later when creating the HashMap
    }
    
    //for loop used to generate a meteor in a random channel
    for(int i = 0; i < amount; i++){
      
      //Create a meteor
      rPrimitive prim = new rPrimitive(i, -40, 40, 40, 255, 255, 255, 255, 0, meteorSprite);//Create new rPrimitive for a RigidBody
      RigidBody rb = new RigidBody(prim, 3);//Create a new RigidBody
      
      //Choose a random channel
      int num = int(random(int(0), int(vectors.size() - 1)));
      rb.object.x = vectors.get(num).x;
      channel.put(vectors.get(num), rb);//Store the channel with the meteor
    }
  }
  
  //Move all meteors in the wave
  void moveWave(){
    for(RigidBody rb : channel.values()){
      rb.direction(rb.object.x, (height + rb.object.h));//direction(float, float) is a function found in the physics engine and is part of the RigidBody class
      rb.object.display();//show the object after the movement has happened
      
      //This doesn't work.
      if(rb.object.y > height + rb.object.h){
        print("Channel Cleared");
        channel.clear();
        break;
      }
    } 
  }
}
