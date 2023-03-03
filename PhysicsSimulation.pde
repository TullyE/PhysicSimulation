import g4p_controls.*;

ArrayList<Object> particles = new ArrayList<Object>();
Line l;
Vector translation = new Vector(0, 0);
Vector mouseStart;
Vector translationMouseEnd;

Hud hud = new Hud();

boolean movingScreen = false;

void setup() {
  surface.setResizable(true);
  frameRate(60);
  size(500, 500);
  l = new Line();
}

void draw() {

  background(0);
  pushMatrix();
  translate(translation.x, translation.y);
  fill(255, 0, 0);
  ellipse(0, 0, 10, 10);
  fill(255);

  l.update();

  if (movingScreen) {
    translationMouseEnd = new Vector(mouseStart.x - mouseX, mouseStart.y - mouseY);
    translation.subtractVector(translationMouseEnd);
  }

  for (Object p : particles) {
    p.move();
    p.show();
  }
  popMatrix();
}

void keyPressed() {
  if (keyCode == 17 && mousePressed && !l.drawing) {
    movingScreen = true;
    mouseStart = new Vector(mouseX, mouseY);
  }
}

void keyReleased() {
  if (keyCode == 17 && !l.drawing && movingScreen) {
    movingScreen = false;
  }
}

void mousePressed() {
  //start drawing the guidelines
  if (!keyPressed) {
    l.beg = new Vector(mouseX - translation.x, mouseY - translation.y);
    l.drawing = true;
  }
}

void mouseReleased() {
  if (l.drawing && !keyPressed) {
    Vector objLoc = l.end;
    Vector objVel = new Vector((l.end.x - l.beg.x)/50, (l.end.y - l.beg.y)/50);
    Vector objAcc = new Vector(0, 0);
    particles.add(new Object(objLoc, objVel, objAcc, 10));
    l.drawing = false;
  } else {
    movingScreen = false;
  }
}

//only start drawing a line if there is no key pressed
//only create an object if there is no key pressed

//only move the screen if there isn't a line being drawn
//only finish moving the screen if there isn't a line being drawn
