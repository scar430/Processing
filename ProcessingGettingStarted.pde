void setup() {
  size(1920, 1080);
}

void draw() {
  if (mousePressed) {
    fill(20);
    rect(mouseX, mouseY, 20, 20);
  }
}
