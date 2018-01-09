ArrayList<Paddle> paddleList = new ArrayList<Paddle>();
float a= 69;
float r = 0;

void setup()
{
  
  size(320, 568);
  for (int i = 0; i < a; i=i+3) 
  {
    r=r+3;
    Paddle paddle = new Paddle(i,r);
    paddleList.add(paddle);
  }
}

void draw()
{
  translate((width/2), height/2);
  background(255);
  for (int i = 0 ; i < paddleList.size(); i++)
  {
    paddleList.get(i).display();
    paddleList.get(i).setButton();
    paddleList.get(i).isOver();
  }
  println(mouseX+" "+mouseY);
}