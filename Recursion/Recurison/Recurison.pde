//Seth Banker

int factor = 500;

void drawShape(float x, float y, float radius){
  stroke(5);
  fill(255);
  ellipse(x, y, 2*radius, 2*radius);
}

void setup(){
  size(900, 600);
  background(255);
  generateShapes();
}

void generateShapes(){
  if(factor > 0){
  circle(width/2, height/2, 400);
    factor--;
  }
}
