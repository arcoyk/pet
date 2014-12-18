class Fly {
  PVector posi = new PVector(width/2, height/2);
  PVector pre = new PVector(width/2, height/2);
  PVector vel = new PVector(1, 1);
  float rot = 1;
  float rad = 1;
  color c = color((int)random(100,255), (int)random(100,255), (int)random(100,255), 100);
  Fly() {
  }
  void step() {
    vel.rotate(rot);
    vel.setMag(rad);
    posi.x += vel.x;
    posi.y += vel.y;
    random_fix();
  }
  void random_fix() {
    if (random(30) < 1) {
      rot += random(-10, 10);
      rad += random(-19, 19);
    }
  }
  void show() {
    stroke(c);
    line(pre.x, pre.y, posi.x, posi.y);
    pre.x = posi.x;
    pre.y = posi.y;
  }
}

ArrayList<Fly> flys = new ArrayList<Fly>();
void setup() {
  size(800, 800);
  background(0);
  for (int i = 0; i < 10; i++) {
    Fly f = new Fly();
    flys.add(f);
  }
}

void draw() {
  for (Fly f : flys) {
    f.step();
    f.show();
  }
}

void keyPressed() {
  if (key == 's') {
    save("./" + random(1000) + ".png");
  }
}

