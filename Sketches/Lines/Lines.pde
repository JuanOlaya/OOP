/*
1. Volver las lines intermitentes
2. Poner sonido de laser espacial :)
https://freesound.org/people/cydon/sounds/127706/
*/

ArrayList<Point> pointList = new ArrayList<Point>();

void setup() 
{
  //size(800, 400);
  size(320, 568);
  background(50);

  for (int i=0; i<10; i++)
  {
    pointList.add(new Point(random(width-20), random(height-20), random(-0.01, 0.01), 
      random(-0.01, 0.01), random(-0.01, 0.01), random(-0.01, 0.01) ));
  }
}

void draw() 
{
  background(50); 

  for (int i=0; i<pointList.size(); i++) 
  {
    pointList.get(i).mover();

    strokeWeight(2);
    //stroke(155, 155, 155);
    stroke(253,106,2);
    line( pointList.get(i).location.x, pointList.get(i).location.y, 1, height/2 );
    line( pointList.get(i).location.x, pointList.get(i).location.y, width-1, height/2 );
  }
}