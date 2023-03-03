class Vector { 
  float x, y;
  Vector(float x, float y) { 
    this.x = x;
    this.y = y;
  }
  
  void addVector(Vector b) { 
    this.x += b.x;
    this.y += b.y;
  }
  
  void subtractVector(Vector b) {
    this.x -= b.x;
    this.y -= b.y;
  }
}
