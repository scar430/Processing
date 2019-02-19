//Seth Banker
//Container for Physics stuff.

//2d vector, mainly for just saving x and y
class ddVector {
  float x;
  float y;
  
  ddVector(){
   x = 0;
   y = 0;
  }
  
  //Draw 2d Vector
  void createDDV(float _x, float _y){
    x = _x;
    y = _y;
  }
}
