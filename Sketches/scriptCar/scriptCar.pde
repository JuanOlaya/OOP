// Script que opera una instancia
// de la clase Car
Car car1;
//Car car2; Seguir los pasos para operar la instancia car2

void setup() {
  size(550, 300, P2D);
  // Inicialiaza una instancia de la clase Car 
  car1 = new Car();
}

void draw() {
  background(#E0E4CC); 

  car1.moveRight();  // Muestra el rectángulo
  car1.display();    // Mueve el rectángulo a la derecha
}
