class Node 
{
  PVector location= new PVector();
  PVector velocity= new PVector();
  PVector gravity = new PVector();
  color c;
  float diameter;
  float radius;
  int nodeColor;


  Node (float xposi, float yposi, float diamet, float velX, float velY, float gravX, float gravY, int type) 
  { 
    location.x = xposi;
    location.y = yposi;
    velocity.x=velX;
    velocity.y=velY;
    gravity.x=gravX;
    gravity.y=gravY;
    diameter = diamet;
    radius = diamet/2;
    nodeColor = type;
    
    if (nodeColor==1)
    {
      c = color(0, 34,180 );
    }
    if (nodeColor==2)
    {
      c = color(#B9006E);
              
    }
    if (nodeColor==3)
    {
      c = color(#F05A28);
    }
  }

  void display() 
  {
    fill(c);
    noStroke();
    ellipse(location.x, location.y, diameter, diameter);
  }

  void mover() 
  {
    float distX = location.x-mouseX;                                  
    float distY = location.y-mouseY;                                  
    float distance = sqrt((distX*distX) + (distY*distY)); 
    if (distance<radius && mousePressed && dragging)
    {
      location.x = mouseX ;
      location.y = mouseY ;
    } else
    {
      location.add(velocity);  
      velocity.add(gravity);   

      if (location.x >= width-radius)
      {
        velocity.x = velocity.x*(-1);
        location.x = width-radius;
      }
      if ( location.x <= radius) 
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
}