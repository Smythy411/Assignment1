void setup()
{
  size(600, 600);
}

int option = 0;

void draw()
{
  switch(option)
  {
  case 0:
    println("Zero");
    break;
  case 1:
    println("One");
    break;
  case 2:
    println("Two");
    break;
  default:
    println("None");
    break;
  }
}

void keyPressed()
{
  if (key >= '0' && key <='9')
  {
    option = key - '0';
  }
  //println(option);
}

