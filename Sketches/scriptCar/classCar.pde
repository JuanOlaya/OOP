class Car {

  color colour;
  float xpos;
  float ypos;
  float widthCar;
  float heightCar;
  float xspeed;  // velocidad en x

  Car() {
    colour = color(#FE9601);
    xpos = width/2;
    ypos = height/2-40;
    widthCar=100;
    heightCar=50;

    xspeed = 3;
  }

  void display() {
    // El carro es sólo un rectángulo
    noStroke();
    fill(colour);
    rect(xpos, ypos, widthCar, heightCar);
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
