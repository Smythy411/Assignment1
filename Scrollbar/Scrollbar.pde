SBar s;

void setup()
{
  size(500, 500);
  noStroke();
  
  s = new SBar(0, height - 50, width, height - 20);
}

void draw()
{
  background(0);
  rect(30, 20, 55, 20);
  s.display();
  s.update();
}
