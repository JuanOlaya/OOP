/*
  FALTA
 1. Pasarlo a p5js para que el isOver se compatible con el celular
 */

ArrayList<Ball> ballList1= new ArrayList<Ball>();
ArrayList<Ball> ballList2= new ArrayList<Ball>();
ArrayList<Ball> ballList3= new ArrayList<Ball>();
ArrayList<Ball> ballList4= new ArrayList<Ball>();
ArrayList<Ball> ballList5= new ArrayList<Ball>();
ArrayList<Ball> ballList6= new ArrayList<Ball>();
ArrayList<Ball> ballList7= new ArrayList<Ball>();
ArrayList<Ball> ballList8= new ArrayList<Ball>();

void setup()
{
  size(320, 568);
  background(0);

  float positionCountY = 20;
  float gap=40;

  while (ballList1.size()<18)
  {
    float positionX = 20;
    Ball ballTemp = new Ball(  positionX, positionCountY);
    ballList1.add(ballTemp);
    positionCountY = positionCountY + gap ;
  }
  positionCountY = 20;

  while ( ballList3.size()<18) 
  {
    float positionX = 100;
    Ball ballTemp = new Ball(  positionX, positionCountY);
    ballList3.add(ballTemp);
    positionCountY = positionCountY + gap ;
  }
  positionCountY = 20;

  while ( ballList5.size()<18) 
  {
    float positionX = 180;
    Ball ballTemp = new Ball(  positionX, positionCountY);
    ballList5.add(ballTemp);
    positionCountY = positionCountY + gap ;
  }
  positionCountY = 20;
  while ( ballList7.size()<18) 
  {
    float positionX = 260;
    Ball ballTemp = new Ball(  positionX, positionCountY);
    ballList7.add(ballTemp);
    positionCountY = positionCountY + gap ;
  }
  positionCountY = height;

  while ( ballList2.size()<18) 
  {
    float positionX = 60;
    Ball ballTemp = new Ball(  positionX, positionCountY);
    ballList2.add(ballTemp);
    positionCountY = positionCountY - gap ;
  }
  positionCountY = height;

  while ( ballList4.size()<18) 
  {
    float positionX = 140;
    Ball ballTemp = new Ball(  positionX, positionCountY);
    ballList4.add(ballTemp);
    positionCountY = positionCountY - gap ;
  }
  positionCountY = height;

  while ( ballList6.size()<18) 
  {
    float positionX = 220;
    Ball ballTemp = new Ball(  positionX, positionCountY);
    ballList6.add(ballTemp);
    positionCountY = positionCountY - gap ;
  }
  positionCountY = height;

  while ( ballList8.size()<18) 
  {
    float positionX = 300;
    Ball ballTemp = new Ball(  positionX, positionCountY);
    ballList8.add(ballTemp);
    positionCountY = positionCountY - gap ;
  }
}

void draw()
{
  background(0);

  for (int i=0; i<ballList1.size(); i++)
  {
    Ball ballTemp = ballList1.get(i);
    ballTemp.display();
    ballTemp.isOver();
    boolean gone = ballTemp.moveUp();

    if (gone)
    {
      ballList1.remove(i);
      ballTemp.initialize(  ballList1.get( ballList1.size() -1 ).location.y, "Up" );
      ballList1.add( ballTemp );
    }
  }


  for (int i=0; i<ballList3.size(); i++)
  {
    Ball ballTemp = ballList3.get(i);
    ballTemp.display();
    ballTemp.isOver();
    boolean gone = ballTemp.moveUp();

    if (gone)
    {
      ballList3.remove(i);
      ballTemp.initialize(  ballList3.get( ballList3.size() -1 ).location.y, "Up");
      ballList3.add( ballTemp );
    }
  }
  for (int i=0; i<ballList5.size(); i++)
  {
    Ball ballTemp = ballList5.get(i);
    ballTemp.display();
    ballTemp.isOver();
    boolean gone = ballTemp.moveUp();

    if (gone)
    {
      ballList5.remove(i);
      ballTemp.initialize(  ballList5.get( ballList5.size() -1 ).location.y, "Up");
      ballList5.add( ballTemp );
    }
  }
  for (int i=0; i<ballList7.size(); i++)
  {
    Ball ballTemp = ballList7.get(i);
    ballTemp.display();
    ballTemp.isOver();
    boolean gone = ballTemp.moveUp();

    if (gone)
    {
      ballList7.remove(i);
      ballTemp.initialize(  ballList7.get( ballList7.size() -1 ).location.y, "Up");
      ballList7.add( ballTemp );
    }
  }

  for (int i=0; i<ballList2.size(); i++)
  {
    Ball ballTemp = ballList2.get(i);
    ballTemp.display();
    ballTemp.isOver();
    boolean gone = ballTemp.moveDown();

    if (gone)
    {
      ballList2.remove(i);
      ballTemp.initialize(  ballList2.get( ballList2.size() -1 ).location.y, "Down");
      ballList2.add( ballTemp );
    }
  }
  for (int i=0; i<ballList4.size(); i++)
  {
    Ball ballTemp = ballList4.get(i);
    ballTemp.display();
    ballTemp.isOver();
    boolean gone = ballTemp.moveDown();

    if (gone)
    {
      ballList4.remove(i);
      ballTemp.initialize(  ballList4.get( ballList4.size() -1 ).location.y, "Down");
      ballList4.add( ballTemp );
    }
  }
  for (int i=0; i<ballList6.size(); i++)
  {
    Ball ballTemp = ballList6.get(i);
    ballTemp.display();
    ballTemp.isOver();
    boolean gone = ballTemp.moveDown();

    if (gone)
    {
      ballList6.remove(i);
      ballTemp.initialize(  ballList6.get( ballList6.size() -1 ).location.y, "Down");
      ballList6.add( ballTemp );
    }
  }
  for (int i=0; i<ballList8.size(); i++)
  {
    Ball ballTemp = ballList8.get(i);
    ballTemp.display();
    ballTemp.isOver();
    boolean gone = ballTemp.moveDown();

    if (gone)
    {
      ballList8.remove(i);
      ballTemp.initialize(  ballList8.get( ballList8.size() -1 ).location.y, "Down");
      ballList8.add( ballTemp );
    }
  }
}