
void setup(){
  size(400,400);
}

void Recursive(int x1, int x2){
  ellipse(x1, height/2, 10, 10);
  ellipse(x2, height/2, 10, 10);
  
  x1 = int((x2 - x1) * 0.25);
  x2 = int((x2 - x1) * 0.75);
  
  Recursive(x1, x2);
}

void draw(){
  background(255);
  Recursive(0, width);
}
