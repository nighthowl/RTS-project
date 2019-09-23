class Unit {
  PVector location, target, velocity;
  public int speed, size;
  public boolean selected;
  
  Unit(PVector _loc) {
    location = _loc;
    target = location;
    selected = false;
    speed = 5;
    size = 50;
  }
  
  void update() {
    velocity = PVector.sub(target, location);
    if(velocity.mag() > 3) {
      velocity.normalize();
      velocity.mult(speed);
      location.add(velocity);
    }
  }
  
  void display() {
    fill(0);
    if(selected) fill(37, 89, 36);
    noStroke();
    ellipse(location.x, location.y, size, size);
  }
  
  void setTarget(PVector _target) {
    target = _target;
  }
  
  public PVector getLoc() {
    return location;
  }
  
}
