class Pillar {
  float xPos, opening;
  boolean crashed = false;
  PImage pillarTop;
  PImage pillarBotton;
  
  Pillar(int i) {
    xPos = 100+(i*200);
    opening = random(400)+100;
    pillarTop = loadImage("pillarTop.png");
    pillarBotton = loadImage("pillarBotton.png");
  }
  
  void drawPillar() {
    image(pillarBotton, xPos-2, opening+120, 100, height);
    image(pillarTop, xPos-13, 0, 100, opening-120);
  }
  
  void checkPosition() {
    if (xPos<-100) {
      xPos+=(200*3);
      opening = random(400)+100;
      crashed=false;
    }
    if (xPos<250&&crashed==false) {
      crashed=true;
      score++;
    }
  }
}
