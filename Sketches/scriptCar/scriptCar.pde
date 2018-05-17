/*
  Este Script ejecuta un objeto de la clase Car
*/

// SIGA LOS PASOS DE car1 PARA EJECUTAR EL OBJETO car2
Car car1; // 1. Declara el objeto car1 de la clase Car
//Car car2; 

void setup() {
  size(550, 300, P2D);
  car1 = new Car();  // 2. Inicialiaza una instancia de la clase Car 
}

void draw() {
  background(#E0E4CC); 

  car1.moveRight();  // 3. Invoca el método moveRight() -> Para mover el rectángulo a la derecha
  car1.display();    // 4. Invoca el método display() -> Para mostrar el rectángulo en el sketch  
}
