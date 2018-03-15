// Script que opera una instancia
// de la clase Car
Car car1;
//Car car2; Seguir los pasos para operar la instancia car2

void setup() 
{
  size(550,300);
  // Inicialiaza una instancia de la clase Car 
  car1 = new Car();
}

void draw() 
{
  background(140);
  car1.display();  // Muestra el rectángulo
  car1.moveRight();// Mueve el rectángulo a la derecha
}