class Selecter {
  PVector start;
  
  Selecter() {
    setStart(new PVector(mouseX, mouseY));
  }
  
  void display() {
    if(mousePressed) {
      stroke(80, 170, 260);
      fill(66, 158, 245, 50);
      rectMode(CORNERS);
      rect(start.x, start.y, mouseX, mouseY);
    }
  }
  
  void setStart(PVector _start) {
    start = _start;
  }
}
