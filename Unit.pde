class Unit {
  PVector location, target, velocity;
  int speed;
  boolean selected;
  
  Unit(PVector _loc) {
    location = _loc;
    target = location;
    selected = false;
    speed = 5;
  }
  
  void update() {
    velocity = PVector.sub(target, location);
    if(velocity.mag() > 5) {
      velocity.normalize();
      velocity.mult(speed);
      location.add(velocity);
    }
  }
  
  void display() {
    fill(0);
    noStroke();
    ellipse(location.x, location.y, 50, 50);
  }
  
  void setTarget(PVector _target) {
    target = _target;
  }
  
}
