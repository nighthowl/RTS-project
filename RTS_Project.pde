ArrayList<Unit> units = new ArrayList<Unit>();
Selecter selecter;

void setup() {
  fullScreen();
  background(255);
  units.add(new Unit(new PVector(height/2, width/2)));
  selecter = new Selecter();
}

void draw() {
  background(255);
  units.get(0).update();
  units.get(0).display();
  if(mousePressed) {
    selecter.display();
  }
}

void mousePressed() {
  if(mouseButton == LEFT) {
    selecter.setStart(new PVector(mouseX, mouseY));
  }
}
  
void mouseClicked() {
  if(mouseButton == RIGHT) {
    units.get(0).setTarget(new PVector(mouseX, mouseY));
  }
}
