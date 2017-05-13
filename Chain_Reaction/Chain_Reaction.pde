ball[] balls;

boolean reactionStarted;
ball walee;

void setup() {
  walee = new ball(0.0, 0.0, 0.0);
  size(512, 512);
  reactionStarted = false;
  balls = new ball[25];
  background(51);
  for ( int i = 0; i < balls.length; i++ ) {
    balls[i] = new ball();
  }
}

void draw() {
  background(51);
  for ( int i = 0; i < balls.length; i++ ) {
    balls[i].move();
    balls[i].show();
  }
  if (walee.getSize() < 50 && reactionStarted) {
    walee.grow();
  }
  walee.show();
}


void mouseClicked() {
  if (!reactionStarted) {
    walee.setxyrad(mouseX, mouseY, 1);
    reactionStarted = true;
  }
}

//boolean colliding(ball b1, ball b2) {
//  return dist(b1.getX(), b1.getY(), b2.getX(), b2.getY()) < b1.getSize() + b2.getSize();
//}