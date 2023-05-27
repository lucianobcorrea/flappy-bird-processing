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
    if (yPos>900) {
      end=false;
    }
    for (int i = 0; i<3; i++) {
      if ((xPos<p[i].xPos+10&&xPos>p[i].xPos-10)&&(yPos<p[i].opening-125||yPos>p[i].opening+50)) {
        end=false;
      }
    }
  }
}
