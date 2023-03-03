class ZeroGravityObject extends Object { 
  ZeroGravityObject(double x, double y, double mass_, boolean affectedByGravity_) {
    super(x, y, mass_);
    this.affectedByGravity = affectedByGravity_;
  } 
}
