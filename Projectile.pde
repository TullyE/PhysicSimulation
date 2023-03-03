class Projectile extends Object {
  Projectile(double x, double y, double mass_, double xComp, double yComp) {
    super(x, y, mass_);
    velX = xComp;
    velY = yComp;
    live = false;
  }
}
