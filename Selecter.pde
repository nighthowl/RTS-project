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
  
  void setActiveUnits(ArrayList<Unit> _units) {
    for(Unit i : _units) {
      if(Math.pow(i.getLoc().x - constrain(i.getLoc().x, min(start.x, mouseX), max(start.x, mouseX)), 2)
      + Math.pow(i.getLoc().y - constrain(i.getLoc().y, min(start.y, mouseY), max(start.y, mouseY)), 2) < Math.pow(i.size/2, 2)) {
        i.selected = true;
      } else i.selected = false;
    }
  }
}
