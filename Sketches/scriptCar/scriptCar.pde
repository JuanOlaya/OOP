// Script that operates an instance 
// of the class Car
Car car1;

void setup() 
{
  size(550,300);
  // Initialize Car object
  car1 = new Car();
}

void draw() 
{
  background(140);
  // Operate Car object.
  car1.move();
  car1.display();
}