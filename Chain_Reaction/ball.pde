class ball {
  float x;
  float y;
  float rad;
  color c;
  float dx;
  float dy;
  int state;

  ball() {
    float r = random(255);
    float g = random(255);
    float b = random(255);
    rad = 10;
    c = color(r, g, b);
    x = random((width - rad) + rad/2);
    y = random((height - rad) + rad/2);
    dx = random(10) - 5;
    dy = random(10) - 5;
  }
  
  ball(float mx, float my, float r){
  x = mx;
  y = my;
  rad = r;
  };
  
  float getSize(){
    return rad; 
  }
  
  void grow(){
   rad += .25; 
  }
  
  void setxyrad(float mx, float my, float r){
  x = mx;
  y = my;
  rad = r;
  };
  
  
  void show() {
    fill(c);
    ellipse(x, y, rad, rad);
    
  }
  void move() {
    x = x + dx;
    y = y + dy;
    bounce();
  }

  void bounce() {
    if ( x >= width || x <= 0 ) {
      dx *= -1; 
    }
    if ( y >= height || y <= 0 ) {
       dy *= -1; 
    }
  }
}