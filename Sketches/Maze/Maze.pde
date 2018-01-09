ArrayList<Wall> listWall = new ArrayList<Wall>(); 
Player player;
Wall wallGoal;

static status currentStatus;
enum status
{
  INTRO, 
  GAMEPLAY, 
  GAMEOVER, 
  WIN
};

void setup()
{
  size(1366, 768, P3D);
  background(37, 34, 81);

  currentStatus = status.GAMEPLAY;

  player = new Player();

  Wall wallTemp = new Wall(86, 0, 1280, 25);
  listWall.add(wallTemp);
  wallTemp = new Wall(0, 0, 25, 774);
  listWall.add(wallTemp);
  wallTemp = new Wall(22, 743, 1260, 25);
  listWall.add(wallTemp);
  wallTemp = new Wall(1341, 15, 25, 753);
  listWall.add(wallTemp);
  wallTemp = new Wall(15, 400, 753, 25);
  listWall.add(wallTemp);
  wallTemp = new Wall(200, 23, 25, 93);
  listWall.add(wallTemp);
  wallTemp = new Wall(87, 91, 120, 25);
  listWall.add(wallTemp); 
  wallTemp = new Wall(87, 96, 25, 250);
  listWall.add(wallTemp);
  wallTemp = new Wall(200, 170, 25, 176);
  listWall.add(wallTemp);
  wallTemp = new Wall(215, 170, 475, 25);
  listWall.add(wallTemp);
  wallTemp = new Wall(743, 80, 25, 427);
  listWall.add(wallTemp);
  wallTemp = new Wall(275, 245, 640, 25);
  listWall.add(wallTemp);
  wallTemp = new Wall(218, 321, 471, 25);
  listWall.add(wallTemp);
  wallTemp = new Wall(316, 80, 25, 100);
  listWall.add(wallTemp);
  wallTemp = new Wall(424, 23, 25, 100);
  listWall.add(wallTemp);
  wallTemp = new Wall(532, 80, 25, 100);
  listWall.add(wallTemp);
  wallTemp = new Wall(640, 23, 25, 100);
  listWall.add(wallTemp);
  wallTemp = new Wall(856, 80, 25, 115);
  listWall.add(wallTemp);
  wallTemp = new Wall(874, 170, 132, 25);
  listWall.add(wallTemp);
  wallTemp = new Wall(981, 186, 25, 160);
  listWall.add(wallTemp);
  wallTemp = new Wall(854, 321, 136, 25);
  listWall.add(wallTemp);
  wallTemp = new Wall(854, 338, 25, 187);
  listWall.add(wallTemp);
  wallTemp = new Wall(545, 500, 223, 25);
  listWall.add(wallTemp);
  wallTemp = new Wall(545, 590, 338, 25);
  listWall.add(wallTemp);
  wallTemp = new Wall(545, 607, 25, 82);
  listWall.add(wallTemp);
  wallTemp = new Wall(87, 664, 482, 25);
  listWall.add(wallTemp);
  wallTemp = new Wall(434, 422, 25, 180);
  listWall.add(wallTemp);
  wallTemp = new Wall(330, 489, 25, 180);
  listWall.add(wallTemp);
  wallTemp = new Wall(230, 420, 25, 180);
  listWall.add(wallTemp);
  wallTemp = new Wall(140, 489, 25, 180);
  listWall.add(wallTemp);
  wallTemp = new Wall(87, 489, 65, 25 );
  listWall.add(wallTemp);
  wallTemp = new Wall(23, 569, 65, 25 );
  listWall.add(wallTemp);
  wallTemp = new Wall(645, 675, 25, 85);
  listWall.add(wallTemp);
  wallTemp = new Wall(758, 675, 25, 85);
  listWall.add(wallTemp);
  wallTemp = new Wall(858, 607, 25, 82);
  listWall.add(wallTemp);
  wallTemp = new Wall(874, 664, 472, 25);
  listWall.add(wallTemp);
  wallTemp = new Wall(981, 20, 25, 100);
  listWall.add(wallTemp);
  wallTemp = new Wall(1003, 245, 60, 25);
  listWall.add(wallTemp);
  wallTemp = new Wall(1111, 77, 25, 348);
  listWall.add(wallTemp);
  wallTemp = new Wall(943, 400, 176, 25);
  listWall.add(wallTemp);
  wallTemp = new Wall(1220, 20, 25, 180);
  listWall.add(wallTemp);
  wallTemp = new Wall(1220, 263, 25, 163);
  listWall.add(wallTemp);
  wallTemp = new Wall(1240, 330, 123, 25);
  listWall.add(wallTemp);
  wallTemp = new Wall(871, 500, 265, 25);
  listWall.add(wallTemp);
  wallTemp = new Wall(1111, 517, 25, 100);
  listWall.add(wallTemp);
  wallTemp = new Wall(980, 580, 25, 100);
  listWall.add(wallTemp);
  wallTemp = new Wall(1220, 486, 25, 130);
  listWall.add(wallTemp);
  wallTemp = new Wall(1240, 537, 123, 25);
  listWall.add(wallTemp);

  wallGoal = new Wall(1287, 755, 25, 25);
}

void draw()
{
  println(mouseX+"  "+ mouseY);

  if (currentStatus== status.INTRO)
  {
    background(37, 34, 81);
    fill(255);
    textSize(122);
    text("OOP Maze", 385, 340);

    fill(26, 164, 218);
    textSize(30);
    text("Press SPACEBAR to start", 500, 440);

    if (keyPressed)
    {
      if (key == 32)
      {
        currentStatus=status.GAMEPLAY;
      }
    }
  }

  if (currentStatus==status.GAMEPLAY)
  {
    background(254, 220, 50);

    player.display();
    player.mover();

    boolean isGoal = player.collisionDetection(wallGoal.xpos, wallGoal.ypos, wallGoal.widthW, wallGoal.heightW);
    if (isGoal)
    {
      currentStatus=status.WIN;
    } 
    else 
    {
      for (int i=0; i<listWall.size(); i++)
      {
        Wall wallTemp = listWall.get(i);
        wallTemp.display();
        boolean isCollision = player.collisionDetection(wallTemp.xpos, wallTemp.ypos, wallTemp.widthW, wallTemp.heightW);
        //println(isCollision);
        if (isCollision)
        {
          currentStatus=status.GAMEOVER;
        }
      }
    }
  }

  if (currentStatus==status.GAMEOVER)
  {
    background(254, 220, 50);
    player.display();
    player.biggerPlayer(); 

    //background(37, 34, 81);
    fill(91, 136, 195);
    textSize(122);
    text("GAME OVER", 355, 340);

    fill(26, 164, 218);
    textSize(30);
    text("Press SPACEBAR to try again", 500, 440);

    if (keyPressed)
    {
      if (key == 32)
      {
        //println("ENTRA");
        player.initialize();
        currentStatus=status.GAMEPLAY;
      }
    }
  }

  if (currentStatus==status.WIN)
  {
    background(37, 34, 81);
    fill(255);
    textSize(122);
    text("YOU WIN!", 385, 340);
    fill(26, 164, 218);
    textSize(30);
    text("Press SPACEBAR to try again", 500, 440);

    if (keyPressed)
    {
      if (key == 32)
      {
        //println("ENTRA");
        player.initialize();
        currentStatus=status.GAMEPLAY;
      }
    }
  }
  //println(currentStatus);
}