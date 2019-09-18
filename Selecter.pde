class Selecter {
  PVector start;
  
  Selecter() {
    setStart(new PVector(mouseX, mouseY));
  }
  
  void update() {
    if(mousePressed && mouseButton == LEFT) {
      
    }
  }
  
  void display() {
    stroke(80, 170, 260);
    fill(66, 158, 245, 50);
    rectMode(CORNERS);
    rect(start.x, start.y, mouseX, mouseY);
  }
  
  void setStart(PVector _start) {
    start = _start;
  }
  
  void setUnitsActive(ArrayList<Unit> _units) {
    for(Unit i : _units) {
      if() {
        
      }
    }
  }
}
