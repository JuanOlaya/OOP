ArrayList<Node > nodeList1 = new ArrayList<Node >();
ArrayList<Node > nodeList2 = new ArrayList<Node >();
ArrayList<Node > nodeList3 = new ArrayList<Node >();
boolean dragging=false;

void setup() 
{
  size(320, 500);
  background(30, 30, 30); 

  for (int i=0; i<20; i++)  // blue nodes
  {
    nodeList1.add(new Node(random(width-22), random(height-20), random(13, 35), random(-0.01, 0.01), random(-0.01, 0.01), random(-0.004, 0.004), random(-0.004, 0.004), 1));
  }
  
  for (int i=0; i<20; i++)  // fuchsia nodes
  {
    nodeList2.add(new Node(random(width-22), random(height-20), random(13, 35), random(-0.007, 0.007), random(-0.007, 0.007), random(-0.004, 0.004), random(-0.004, 0.004), 2));
  }
  for (int i=0; i<20; i++)  // orange nodes
  {
    nodeList3.add(new Node(random(width-22), random(height-20), random(13, 35), random(-0.007, 0.007), random(-0.007, 0.007), random(-0.004, 0.004), random(-0.004, 0.004), 3));
  }
}

void draw()
{
  background(30, 30, 30); 
 
  for (int i=0; i<nodeList1.size(); i++) // blue nodes
  {
    nodeList1.get(i).display();
    nodeList1.get(i).mover();

    for (int j=0; j<nodeList1.size(); j++)
    {
      if (i!=j) 
      {
        float distance = sqrt(sq(nodeList1.get(j).location.x - nodeList1.get(i).location.x)
          +sq(nodeList1.get(j).location.y - nodeList1.get(i).location.y));

        if (distance<100)
        {
          strokeWeight(0.7);
          stroke(0, 34,180);
          line( nodeList1.get(i).location.x, nodeList1.get(i).location.y, 
            nodeList1.get(j).location.x, nodeList1.get(j).location.y );
        }
      }
    }
  }

  for (int i=0; i<nodeList2.size(); i++)  // fuchsia nodes
  {
    nodeList2.get(i).display();
    nodeList2.get(i).mover();
    
    for (int j=0; j<nodeList2.size(); j++)
    {
      if (i!=j) 
      {
        float distance = sqrt(sq(nodeList2.get(j).location.x - nodeList2.get(i).location.x)
          +sq(nodeList2.get(j).location.y - nodeList2.get(i).location.y));

        if (distance<100)
        {
          strokeWeight(0.7);
          stroke(#B9006E);
          line( nodeList2.get(i).location.x, nodeList2.get(i).location.y, 
            nodeList2.get(j).location.x, nodeList2.get(j).location.y );
        }
      }
    }
  }

  for (int i=0; i<nodeList3.size(); i++)  // orange nodes
  {
    nodeList3.get(i).display();
    nodeList3.get(i).mover();
    
    for (int j=0; j<nodeList3.size(); j++)
    {
      if (i!=j) 
      {
        float distance = sqrt(sq(nodeList3.get(j).location.x - nodeList3.get(i).location.x)
          +sq(nodeList3.get(j).location.y - nodeList3.get(i).location.y));

        if (distance<100)
        {
          strokeWeight(0.7);
          stroke(#F05A28);
          line( nodeList3.get(i).location.x, nodeList3.get(i).location.y, 
            nodeList3.get(j).location.x, nodeList3.get(j).location.y );
        }
      }
    }
  }
}

void mousePressed() 
{
  dragging = true;
}

void mouseReleased()
{
  dragging=false;
}
