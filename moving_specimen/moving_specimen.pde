class Butterfly{
  void Butterfly(){
  }
  PImage img;
  PVector posi;
  PVector size;
  float crrw = 1;
  float dstw = 1;
  void show(){
    image(img,
          posi.x + (size.x - size.x / crrw) / 2,
          posi.y,
          size.x / crrw,
          size.y);
  }
  void step(){
    if( 1 > random(50)){
      dstw = random(1.0, 2.0);
    }
    crrw += (dstw - crrw) / 8;
  }
}

ArrayList<Butterfly> buts =
new ArrayList<Butterfly>();
void setup(){
  size(600, 600);
  File[] files = new File(sketchPath("data")).listFiles();
  for(File file : files){
    if(match(file.getPath(), ".jpg$") == null){
      continue;
    }
    Butterfly b = new Butterfly();
    b.img = loadImage(file.getPath());
    buts.add(b);
  }
  int div = (int)sqrt(buts.size()) + 1;
  for(int i = 0; i < buts.size(); i++){
    Butterfly b = buts.get(i);
    b.posi = new PVector(width / div * (i % div),
                         height / div * (int)(i / div));
    b.size = new PVector(width / div, height / div);
  }
}

void draw(){
  background(255);
  for(Butterfly b : buts){
    b.step();
    b.show();
  }
}
