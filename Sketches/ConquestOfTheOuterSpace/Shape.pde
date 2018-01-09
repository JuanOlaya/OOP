class Shape
{
  float radius1;
  float radius2;
  float a;
  float index;
  PVector[] vertices;
  color col;
  float size;
  float distance;
  float diameterButton;
  float countRadius;
  boolean growinUp;

  Shape(float i, float rad1)
  {
    radius1=rad1;  
    a= 70;
    index=i;
    radius2=107;
    vertices = new PVector[4];
    col=color(126);
    size=1.2;
    distance=90;
    diameterButton=70;
    growinUp=true;
    
    vertices[0] = new PVector( (radius1)*cos(index*2*PI/a), (radius1)*sin(index*2*PI/a) );
    vertices[1] = new PVector( (radius1)*cos((index+size)*2*PI/a), (radius1)*sin((index+size)*2*PI/a));
    vertices[2] = new PVector( (radius1 + radius2)*cos((index+size)*2*PI/a), (radius1 + radius2)*sin((index+size)*2*PI/a));
    vertices[3] = new PVector( (radius1 + radius2)*cos(index*2*PI/a), (radius1 + radius2)*sin(index*2*PI/a));
  }
  
  void spin()
  {
    size= size+0.03;
    
    if(countRadius>350)
      growinUp=false;
      
    if(countRadius<5)
      growinUp=true;
      
    if(growinUp==true) 
    {
      countRadius=countRadius+0.2;
    }
    else
    {
      countRadius=countRadius-0.2;
    }
    println(countRadius);
    
    index = index + 0.04;
    vertices[0].x =  (/*radius1+*/countRadius)*cos(index*2*PI/a);
    vertices[0].y =  (/*radius1+*/countRadius)*sin(index*2*PI/a);
    vertices[1].x =  (/*radius1+*/countRadius)*cos((index+size)*2*PI/a);
    vertices[1].y =  (/*radius1+*/countRadius)*sin((index+size)*2*PI/a);
    vertices[2].x =  (radius1 + radius2 /*+countRadius*/)*cos((index+size)*2*PI/a);
    vertices[2].y =  (radius1 + radius2 /*+countRadius*/)*sin((index+size)*2*PI/a);
    vertices[3].x =  (radius1 + radius2 /*+countRadius*/)*cos(index*2*PI/a);
    vertices[3].y =  (radius1 + radius2 /*+countRadius*/)*sin(index*2*PI/a);
  }

  void display()
  {
    col=color(0);
    noFill();
    stroke(253,106,2);
    strokeWeight(2);

    //     x1        y1        x2        y2         x3        y3        x4      y4
    quad(vertices[0].x, vertices[0].y, vertices[1].x, vertices[1].y, vertices[2].x, vertices[2].y, vertices[3].x, vertices[3].y);
  }
}