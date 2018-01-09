class Player
{
  float xPosPlayer;
  float yPosPlayer;
  float diameterPlayer;
  color colour;
  float speed;
  float direction;

  Player()
  {
    xPosPlayer = 60;
    yPosPlayer = 20;
    diameterPlayer = 40;
    colour= color(0);
    speed=2;
    direction=2;
  }

  void display()
  {
    fill(colour);
    stroke(0);
    ellipse(xPosPlayer, yPosPlayer, diameterPlayer, diameterPlayer);
    noStroke();
    fill(255);
    if (direction==1)
    {
      ellipse(xPosPlayer, yPosPlayer-5, diameterPlayer/2, diameterPlayer/2);
      fill(0);
      ellipse(xPosPlayer, yPosPlayer-7, diameterPlayer/4, diameterPlayer/4);
    }
    if (direction==2)
    {
      ellipse(xPosPlayer+5, yPosPlayer, diameterPlayer/2, diameterPlayer/2);
      fill(0);
      ellipse(xPosPlayer+7, yPosPlayer, diameterPlayer/4, diameterPlayer/4);
    }

    if (direction==3)
    {
      ellipse(xPosPlayer, yPosPlayer+5, diameterPlayer/2, diameterPlayer/2);
      fill(0);
      ellipse(xPosPlayer, yPosPlayer+7, diameterPlayer/4, diameterPlayer/4);
    }
    if (direction==4)
    {
      ellipse(xPosPlayer-5, yPosPlayer, diameterPlayer/2, diameterPlayer/2);
      fill(0);
      ellipse(xPosPlayer-7, yPosPlayer, diameterPlayer/4, diameterPlayer/4);
    }
  }

  void initialize()
  {
    xPosPlayer = 50;
    yPosPlayer = 22;
    diameterPlayer = 40;
    colour= color(0);
  }

  void mover()
  {
    if (keyPressed)
    {
      if (key == CODED)
      {
        if (keyCode == UP)
        {
          yPosPlayer = yPosPlayer - speed;
          direction=1;
        }
        if (keyCode == DOWN)
        {
          yPosPlayer = yPosPlayer + speed;
          direction=3;
        }
        if (keyCode == RIGHT)
        {
          xPosPlayer = xPosPlayer + speed;
          direction=2;
        }
        if (keyCode == LEFT)
        {
          xPosPlayer = xPosPlayer - speed;
          direction=4;
        }
      }
    }
  }

  // Collision Detection method based on Jeff Thompson's algorithm  
  // http://www.jeffreythompson.org/collision-detection/
  boolean collisionDetection(float xPosWall, float yPosWall, float widthWall, float heightWall) 
  {
    // temporary variables to set edges for testing
    float testX = xPosPlayer;
    float testY = yPosPlayer;

    // which edge is closest?
    if (xPosPlayer < xPosWall)         testX = xPosWall;        // compare to left edge
    else if (xPosPlayer > xPosWall+widthWall) testX = xPosWall+widthWall;     // right edge
    if (yPosPlayer < yPosWall)         testY = yPosWall;        // top edge
    else if (yPosPlayer > yPosWall+heightWall) testY = yPosWall+heightWall;     // bottom edge

    // get distance from closest edges
    float distX = xPosPlayer-testX;
    float distY = yPosPlayer-testY;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    // if the distance is less than the radius, collision!
    if (distance <= ((diameterPlayer/2))) 
    {
      return true;
    }
    return false;
  }

  void biggerPlayer()
  {
    if (diameterPlayer<2800)
    {
      diameterPlayer = diameterPlayer +25;
    }
  }
}