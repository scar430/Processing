void setup() {
  size(1920, 1080);
}

void draw() {
  if (mousePressed) {
    fill(25);
  } else {
    fill(400);
  }
  ellipse(mouseX, mouseY, 80, 80);
}
