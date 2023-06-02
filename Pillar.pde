class Pillar {
  float xPos, opening;
  boolean crashed = false;
  PImage pillarTop;
  PImage pillarBotton;
  Pillar(int i) {
    xPos = 100+(i*200);
    opening = random(600)+100;
    pillarTop = loadImage("pillarTop.png");
    pillarBotton = loadImage("pillarBotton.png");
  }
  void drawPillar() {
    float x = xPos + 40;
    
    
    line(x-20, 0, x-20, opening-100);
    
    line(x+20, 0, x+20, opening-100);
    
    line(x-20, opening+100, x-20, 800);
    
    line(x+20, opening+100, x+20, 800);

    image(pillarBotton, xPos-3, opening+100, 100, height);
    
    image(pillarTop, xPos-13, 0, 100, opening-100);
    
    
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
