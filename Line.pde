class Line {
  Location beg, end;
  boolean drawing = false;
  //boolean showAxis = false;
  boolean showAxis = true;
  Line() {
    drawing = false;
  }

  void update() {
    if (drawing) {
      float endX = beg.x + (mouseX - beg.x) * -1;
      float endY = beg.y + (mouseY - beg.y) * -1;
      end = new Location(endX, endY);
      show();
    }
  }
  void show() {
    stroke(255);
    line(beg.x, beg.y, end.x, end.y);

    if (showAxis) {
      //X Axis
      line(beg.x, beg.y, end.x, beg.y);

      //Y Axis
      line(beg.x, beg.y, beg.x, end.y);
    }
    stroke(0);
  }
}
