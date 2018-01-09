ArrayList<Shape> shapeList = new ArrayList<Shape>();
float a= 70;
float r = 0;
float count;


void setup()
{
  
  size(320, 568);
  for (int i = 0; i < a; i=i+6) 
  {
    r=10;
    Shape shape = new Shape(i,r);
    shapeList.add(shape);
  }
}

void draw()
{
  translate((width/2), height/2);
  background(50);
  for (int i = 0 ; i < shapeList.size(); i++)
  {
    shapeList.get(i).spin();
    shapeList.get(i).display();
  }
}