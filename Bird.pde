class Bird {
  float xPos, yPos, ySpeed;
  Bird() {
    xPos = 200;
    yPos = 400;
  }
  void drawBird() {
    image(bird, xPos, yPos, 80, 80);
  }
  void jump() {
    ySpeed=-7;
  }
  void drag() {
    ySpeed+=0.4;
  }
  void move() {
    yPos+=ySpeed;
    for (int i = 0; i<3; i++) {
      p[i].xPos-=3;
    }
  }
  
  void checkCollisions() {
    if (yPos>800) {
      end=false;
    }
    for (int i = 0; i<3; i++) {
      if ((xPos<p[i].xPos+35&&xPos>p[i].xPos-35)&&(yPos<p[i].opening-147||yPos>p[i].opening+60)) {
        end=false;
      }
    }
  }
  boolean validateCollisionPilar(int x, int y, float px, float py) {
    return (x < px+35 && x > px-35) && (y < py-147 || y > py+60);
  }
}
