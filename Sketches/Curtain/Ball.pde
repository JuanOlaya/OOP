class Ball 
{
  PVector location = new PVector();
  PVector velocity = new PVector();
  color col;
  float diameter;

  Ball(float positionX, float positionY ) 
  {
    location.x = positionX;
    location.y = positionY;
    col = color(195, 0, 0);
    diameter = 40;
    velocity.y = 1;
  }

  void display() 
  {
    fill(col);
    noStroke();
    ellipse(location.x, location.y, diameter, diameter );
  }

  boolean moveUp() 
  {
    location.y = location.y - velocity.y;

    if (location.y <= -100) 
    {
      return true;
    }
    return false;
  }

  boolean moveDown()
  {
    location.y = location.y + velocity.y;

    if (location.y >= height + 100) 
    {
      return true;
    }
    return false;
  }

  void initialize(float positionYLastPlatform, String direction)
  {
    col = color(195, 0, 0);
    float gap= 40;
    if (direction == "Up")
    {
      location.y = positionYLastPlatform +  gap;
    }
    if (direction == "Down")
    {
      location.y = positionYLastPlatform -  gap;
    }
  }

  // isOver method is based on Jeff Thompson's algorithm of Collision Detection  
  // http://www.jeffreythompson.org/collision-detection/
  void isOver(/*int px, int py,  int bx, int by, int bSize*/) 
  {
    // find distance between the two objects
    float xDist = mouseX-location.x;                                   // distance horiz
    float yDist = mouseY-location.y;                                   // distance vert
    float distance = sqrt((xDist*xDist) + (yDist*yDist));  // diagonal distance
    
    if(mousePressed)
    {
      // test for collision
      if (diameter/2 > distance ) 
      {
        col = color(0, 0, 140);
      
      } 
    }
  }
}