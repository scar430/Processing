PImage tree;
PImage loadedTrees[] = new PImage[10];
float horizon = 200;
float treeLimit = 10;
float treeSize = 200;

void setup(){
 size(700,700);
 tree = loadImage("Tree.png"); 
 drawDisplay();
}

void drawDisplay(){
  noStroke();
  fill(0,0,255);
  rect(0,0, width, horizon);
  fill(0,255,0);
  rect(0, horizon, width, height);
  stroke(5);
  fill(0);
  line(0, horizon, width, horizon);
  for(int i = 0; i < loadedTrees.length; i++){
    image(tree, random(0, width), random(horizon, height), treeSize, treeSize);
  }
}
