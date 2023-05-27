class Pillar {
  float xPos, opening;
  boolean crashed = false;
  PImage pillar;
  Pillar(int i) {
    xPos = 100+(i*200);
    opening = random(600)+100;
    pillar = loadImage("pillar.png");
  }
  void drawPillar() {
    line(xPos + 40, 0, xPos + 40, opening-100);
    line(xPos + 40, opening+100, xPos + 40, 800);
  }
  void checkPosition() {
    if (xPos<0) {
      xPos+=(200*3);
      opening = random(600)+100;
      crashed=false;
    }
    if (xPos<250&&crashed==false) {
      crashed=true;
      score++;
    }
  }
}
