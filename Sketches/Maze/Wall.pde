class Wall
{
  float xpos;
  float ypos;
  float widthW;
  float heightW;
  color colour;

  Wall(float posX, float posY, float widthWall, float heightWall)
  {
    xpos = posX;
    ypos = posY;
    widthW = widthWall;
    heightW = heightWall;
    colour = color(251, 48, 52);
  }

  void display()
  {
    fill(colour);
    stroke(colour);
    rect(xpos, ypos, widthW, heightW,6);
  }
}