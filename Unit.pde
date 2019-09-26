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
  
  void checkCollision(Unit other) {
    PVector dist = PVector.sub(other.location, location);
    if(dist.mag() < size) {
      if(isGroupTouchingTarget(new ArrayList<Unit>())) {
        target = location;
      } else if(other.location != other.target) {
        PVector correction = dist.normalize().mult(min(speed, speed/dist.mag()));
        location.sub(correction);
        other.location.add(correction);
      } else {
        PVector correction = dist.normalize().mult(min(speed, speed/dist.mag()));
        location.sub(correction.mult(2));
      }
    }
  }
  
  boolean isGroupTouchingTarget(ArrayList<Unit> _parents) {
    boolean output = false;
    ArrayList<Unit> parents = new ArrayList<Unit>();
    parents.addAll(_parents);
    if(abs(PVector.sub(location, target).mag()) < size/2 + 5) {
      output = true;
    } else {
      for(Unit i : units) {
        if(this != i && parents.contains(i)) {
          System.out.println(this);
          if(abs(PVector.sub(location, i.location).mag()) < size + 5) {
            parents.add(this);
            if(i.isGroupTouchingTarget(parents)) {
              output = true;
            }
          }
        }
      }
    }
    System.out.println(output);
    return output;
  }
  
}
