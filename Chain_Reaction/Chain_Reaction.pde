ball[] balls;

boolean reactionStarted;
ball walee;

void setup() {
  walee = new ball(0.0, 0.0, 0.0);
  size(512, 512);
  reactionStarted = false;
  balls = new ball[25];
  background(0);
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
  walee.die();
  if (reactionStarted) {
    for ( int i = 0; i < balls.length; i++ ) {
      for ( int x = 0; x < balls.length-1; x++ ) {
        if (colliding(balls[i], balls[x]) && balls[x].getState() == 1) {
          balls[i].setState(1);
          balls[i].grow();
          balls[i].setStop(0, 0);
        }
      }
    }
    for ( int x = 0; x < balls.length-1; x++ ) {
      if (colliding(balls[x], walee)) {
        balls[x].setState(1);
        balls[x].grow();
        balls[x].setStop(0, 0);
      }
    }
    for ( int x = 0; x < balls.length-1; x++ ) {
      if (balls[x].getState() == 1) {
        balls[x].setStop(0, 0);
        balls[x].die();
      }
    }
  }
}


void mouseClicked() {
  if (!reactionStarted) {
    walee.setxyrad(mouseX, mouseY, 1);
    walee.setState(1);
    reactionStarted = true;
  }
}

boolean colliding(ball b1, ball b2) {
  return dist(b1.getX(), b1.getY(), b2.getX(), b2.getY()) < b1.getSize() + b2.getSize();
}