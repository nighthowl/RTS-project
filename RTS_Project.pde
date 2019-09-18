import shiffman.box2d.*;

ArrayList<Unit> units = new ArrayList<Unit>();
Selecter selecter;

void setup() {
  size(500, 800);
  background(255);
  units.add(new Unit(new PVector(height/2, width/2)));
  selecter = new Selecter();
}

void draw() {
  background(255);
  units.get(0).update();
  units.get(0).display();
  if(mousePressed && mouseButton == LEFT) {
    selecter.display();
    selecter.setUnitsActive(units);
  }
}

void mousePressed() {
  if(mouseButton == LEFT) {
    selecter.setStart(new PVector(mouseX, mouseY));
  }
}

void mouseClicked() {
  if(mouseButton == RIGHT) {
    for(Unit i : units) {
      if(i.selected) {
        i.setTarget(new PVector(mouseX, mouseY));
      }
    }
  }
}
