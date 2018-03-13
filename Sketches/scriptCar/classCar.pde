class Car {
  color colour;
  float xpos;
  float ypos;
  float xspeed;
  Car() {
    colour = color(#FE9601);
    xpos = width/2-100;
    ypos = height/2-40;
    xspeed = 3;
  }
  void display() {
    // The car is just a square
    noStroke();
    fill(colour);
    rect(xpos, ypos, 100, 50);
  }
  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = -100;
    }
  }
}