public ArrayList<Unit> units = new ArrayList<Unit>();
Selecter selecter;

void setup() {
  size(800, 800);
  background(255);
  for(int i = 0; i < 5; i++)
    units.add(new Unit(new PVector(random(0, width), random(0, height))));
  selecter = new Selecter();
}

void draw() {
  background(255);
  for(Unit i : units) {
    i.update();
    i.display();
    for(Unit j : units) {
      if(i != j) {
        i.checkCollision(j);
      }
    }
  }
  if(mousePressed && mouseButton == LEFT) {
    selecter.display();
  }
}

void mouseReleased() {
  if(mouseButton == LEFT) {
    selecter.setActiveUnits(units);
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
