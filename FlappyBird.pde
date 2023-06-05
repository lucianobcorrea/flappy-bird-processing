Bird b = new Bird();
Pillar[] p = new Pillar[3];
PImage bird;
ArrayList<TextBox> textboxes = new ArrayList<TextBox>();
boolean end=false;
boolean intro=true;
int score=0;
boolean hasUser = false;
PImage bg;
int bgx;
int bgy;

void setup() {
  size(500, 750);
  TextBox userTB = new TextBox();
  userTB.X = 160;
  userTB.Y = 103;
  userTB.W = 200;
  userTB.H = 35;

  bird = loadImage("bird.png");
  for (int i = 0; i<3; i++) {
    p[i]= new Pillar(i);
  }
  textboxes.add(userTB);
  bg = loadImage("bg.jpg");
}

void draw() {
  background(0);
  tint(255, 100);
  image(bg, 0, 0, width, height);
  noTint();

  if (hasUser && end) {
    setBackground();
  }

  if (end) {
    b.move();
  }
  b.drawBird();
  if (end) {
    b.drag();
  }
  b.checkCollisions();
  for (int i = 0; i<3; i++) {
    p[i].drawPillar();
    p[i].checkPosition();
  }
  fill(0);
  stroke(255);
  textSize(32);
  if (end) {
    rect(20, 20, 100, 50);
    fill(255);
    text(score, 30, 58);
  } else {
    rect(160, 200, 200, 100, 5);
    fill(255);
    if (intro) {
      text("User", (width - textWidth("User")) / 2, 80);
      textSize(15);

      for (TextBox t : textboxes) {
        t.DRAW();
      }

      fill(255);
      text("Enter your name\n and press enter", 175, 240);
    } else {
      text("Game Over", 170, 140);
      text("Score", 180, 240);
      text(textboxes.get(0).Text, 180, 280);
      text(score, 280, 240);
    }
  }
}

void reset() {
  end=true;
  score=0;
  b.yPos=400;
  for (int i = 0; i<3; i++) {
    p[i].xPos+=550;
    p[i].crashed = false;
  }
}

void Submit() {
  if (textboxes.get(0).TextLength > 0) {
    hasUser = true;
  } else {
    hasUser = false;
  }
}

void setBackground() {
  image(bg, bgx, bgy);
    image(bg, bgx + bg.width, bgy);
    bgx = bgx - 1;
    if(bgx < -bg.width) {
      bgx = 0;
    }
}

void mousePressed() {
  for (TextBox t : textboxes) {
    t.PRESSED(mouseX, mouseY);
  }
  b.jump();
  if (end) {
    intro = false;
  }
  if (end==false && hasUser) {
    reset();
  }
}

void keyPressed() {
  for (TextBox t : textboxes) {
    if (t.KEYPRESSED(key, (int)keyCode)) {
      Submit();
    }
    
    if(keyCode == BACKSPACE) {
      hasUser = false;
      end = false;
      intro = true;
    }
    
    b.jump();
    if (end) {
      intro = false;
    }
    if (end==false && hasUser) {
      reset();
    }
  }
}
