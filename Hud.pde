class Hud { 
  Hud() {
    
  }
  
  void show() {
    text("looking at: (" + -1 * translation.x + ", " + -1 * translation.y + ")", width/2, height/2);
  }
}
