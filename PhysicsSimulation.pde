public static double GRAVITY = 9.81;
public static boolean GRAVITY_ON = true;

//All Objects
Object a;
Object b;
Object c;
Line l;


void setup() {
  frameRate(60);
  size(500, 500);
  //ZeroGravityObject,Projectil both extend Object so they can both be of type Object
  a = new Object(width/2, 0, 100);
  b = new ZeroGravityObject( width/2, height/2, 100, false);
  c = new Projectile(0, 0, 0, 0, 0);
  
  //create our guidelines
  l = new Line();
}

void draw() {
  //show and update all of our objects
  background(0);
  a.move();
  a.show();
  b.show();
  b.move();
  l.update();
  c.show();
  c.move();
}

void keyPressed() {
  //move object b
  if (key == 'd') {
    b.addForceX(4);
  } else if (key == 'a') {
    b.addForceX(-4);
  } else if (key == 's') {
    b.addForceY(4);
  } else if (key == 'w') {
    b.addForceY(-4);
  }
}

void keyReleased() {
  //make it so object b doesn't infinity accelerate
  if (key == 'd' || key == 'a') {
    b.addForceX(0);
  } else if (key == 'w' || key == 's') {
    b.addForceY(0);
  }
}

void mousePressed() {
  //start drawing the guidelines
  l.beg = new Location(mouseX, mouseY);
  l.drawing = true;
}

void mouseReleased() {
  //stop drawing the guidelines and create a projectile
  //with the proper velocities
  l.drawing = false;
  c = new Projectile(l.beg.x, l.beg.y, 100, (l.beg.x - l.end.x) * -0.1, (l.beg.y - l.end.y) * -0.1);
  c.live = true;
}
