class Object {
  Vector location, velocity, acceleration;
  double mass;

  Object(Vector location, Vector velocity, Vector acceleration, double mass) {
    this.location = location;
    this.velocity = velocity;
    this.acceleration = acceleration;
    this.mass = mass;
  }

  void move() {
    velocity.addVector(acceleration);
    location.addVector(velocity);
  }

  void show() {
    ellipse(location.x, location.y, 10, 10);
  }

  void addForce(Vector v) { 
    acceleration.addVector(v);
  }
  
  void setLocation(Vector loc) { 
    location = loc;
  }
}
