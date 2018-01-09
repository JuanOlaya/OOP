class Point 
{
  
  PVector location= new PVector();
  PVector velocity= new PVector();
  PVector gravity = new PVector();
  float diameter;
  float radius;

  Point(float xposi, float yposi, float velX,float velY, float gravX,float gravY) 
  {
    location.x = xposi;
    location.y = yposi;
    velocity.x=velX;
    velocity.y=velY;
    gravity.x=gravX;
    gravity.y=gravY;
    diameter = 1;
    radius = 0.5;
  }

  void mover() 
  {
    location.add(velocity);  
    velocity.add(gravity);   

    if (location.x > width-radius)
    {
      velocity.x = velocity.x*(-1);
      location.x = width-radius;
    }
    if ( location.x < radius) 
    {
      velocity.x = velocity.x*(-1);
      location.x = radius;
    }
    if (location.y > height -radius) 
    {
      velocity.y = velocity.y *(-1);
      location.y = height-radius;
    }
    if (location.y < radius) 
    {
      velocity.y = velocity.y *(-1);
      location.y = radius;
    }
  }
}