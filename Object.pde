class Object {
  double terminalVelocity;
  boolean affectedByGravity;

  double mass;
  double x, y;


  //Verticle Logic;
  double velY, accY;

  //Horizontal Logic
  double velX, accX;

  boolean live;
  Object(double x, double y, double mass) {
    this.x = x;
    this.y = y;
    this.mass = mass;
    velX = 0;
    velY = 0;
    terminalVelocity = mass/GRAVITY;
    affectedByGravity = true;
    live = true;
  }

  void move() {
    if (live) {
      //Verticle Movement
      velY += accY;
      y += velY;
      //Horizonatal Movement
      velX += accX;
      x += velX;
      //Gravity
      if (GRAVITY_ON && affectedByGravity) {
        gravAcc();
      }
    }
  }

  void show() {
    if (live) {
      ellipse((float) x, (float) y, 10, 10);
    }
  }

  void addForceX(double dir) {
    double PWR = 1;
    accX = (dir * PWR)/mass;
  }
  //add verticle force
  void addForceY(double dir) {
    double PWR = 1;
    accY = (dir * PWR) / mass;
  }

  void setX(int x_) {
    this.x = x_;
  }

  void setY(int y_) {
    this.y = y_;
  }

  //Acceleration due to gravity
  //Only run this if gravity is turned on
  void gravAcc() {
    if (velY < terminalVelocity) {
      addForceY(9.81);
    } else
    {
      addForceY(0);
      velY = terminalVelocity;
    }
  }
}
