class Car {
  
  color colour;
  float xpos;
  float ypos;
  float xspeed; // velocidad en x
  
  Car() {
    colour = color(#FE9601);
    xpos = width/2-100;
    ypos = height/2-40;
    xspeed = 3;
  }
  void display() {
    // El carro es sólo un rectángulo
    noStroke();
    fill(colour);
    rect(xpos, ypos, 100, 50);
  }
  void moveRight() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = -100;
    }
  }
  void moveLeft() {
    // Implementar el algoritmo
    // para mover el rectángulo
    // hacia la izquierda.
  }
}