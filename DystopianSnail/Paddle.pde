class Paddle
{
  float radius1;
  float radius2;
  float a;
  float index;
  PVector[] vertices;
  color col;
  float size;
  float distance;
  boolean isOverF;
  float diameterButton;

  Paddle(float i, float rad1)
  {
    radius1=rad1;  
    a= 70;
    index=i;
    radius2=90;
    vertices = new PVector[4];
    col=color(126);
    size=2.3;
    distance=90;
    isOverF=false;
    diameterButton=72;
  }

  void display()
  {
    index= index-0.01;

    vertices[0] = new PVector( (radius1)*cos(index*2*PI/a), (radius1)*sin(index*2*PI/a) );
    vertices[1] = new PVector( (radius1)*cos((index+size)*2*PI/a), (radius1)*sin((index+size)*2*PI/a));
    vertices[2] = new PVector( (radius1 + radius2)*cos((index+size)*2*PI/a), (radius1 + radius2)*sin((index+size)*2*PI/a));
    vertices[3] = new PVector( (radius1 + radius2)*cos(index*2*PI/a), (radius1 + radius2)*sin(index*2*PI/a));



    col=color(0);
    //noStroke();
    fill(col);
    if (!isOverF)
    {
      //     x1        y1        x2        y2         x3        y3        x4      y4
      quad(vertices[0].x, vertices[0].y, vertices[1].x, vertices[1].y, vertices[2].x, vertices[2].y, vertices[3].x, vertices[3].y);
    }
    if (isOverF)
    {
      quad((radius1)*cos(index*2*PI/a), (radius1)*sin(index*2*PI/a), 
        (radius1)*cos((index+size)*2*PI/a), (radius1)*sin((index+size)*2*PI/a), 
        (radius1 + radius2+distance)*cos((index+size)*2*PI/a), (radius1 + radius2+distance)*sin((index+size)*2*PI/a), 
        (radius1 + radius2+distance)*cos(index*2*PI/a), (radius1 + radius2+distance)*sin(index*2*PI/a));
    }
  }

  void setButton()
  {
    float radiusEllipse = diameterButton/2;
    noFill();
    noStroke();
    ellipse((radius1 + radius2 -radiusEllipse-10)*cos((index+(size/2))*2*PI/a), 
      (radius1 + radius2 -radiusEllipse-10)*sin((index+(size/2))*2*PI/a), diameterButton, diameterButton);
  }

  // isOver method is based on Jeff Thompson's algorithm of Collision Detection  
  // http://www.jeffreythompson.org/collision-detection/
  void isOver( /*float cx, float cy, float r*/) 
  {

    // get distance between the point and circle's center
    // using the Pythagorean Theorem

    float px;
    float py;
    if (mouseX==0 && mouseY==0)
    {
      px=170- ((width/2));
      py=180- height/2;
    } else
    {
      px = mouseX - ((width/2));
      py= mouseY - height/2;
    }


    float radiusEllipse = diameterButton/2;
    float cx = (radius1 + radius2 -radiusEllipse-10)*cos((index+(size/2))*2*PI/a);
    float cy = (radius1 + radius2 -radiusEllipse-10)*sin((index+(size/2))*2*PI/a);
    float distX = px - cx;
    float distY = py - cy;
    float distance = sqrt( (distX*distX) + (distY*distY) );



    // if the distance is less than the circle's 
    // radius the point is inside!
    if (distance <= radiusEllipse) 
    {
      isOverF= true;
    } else 
    {
      isOverF = false;
    }
  }
}