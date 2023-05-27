Bird b = new Bird();
Pillar[] p = new Pillar[3];
PImage bird;
ArrayList<TextBox> textboxes = new ArrayList<TextBox>();
boolean end=false;
boolean intro=true;
int score=0;
boolean hasUser = false;

void setup() {
  size(500, 800);
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
}

void draw() {
  background(0);

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
    rect(150, 200, 200, 100);
    fill(255);
    if (intro) {
      text("User", (width - textWidth("User")) / 2, 60);
      textSize(15);

      for (TextBox t : textboxes) {
        t.DRAW();
      }
      fill(255);
      text("Enter your name\n and press enter", 155, 240);
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
    b.jump();
    if (end) {
      intro = false;
    }
    if (end==false && hasUser) {
      reset();
    }
  }
}
