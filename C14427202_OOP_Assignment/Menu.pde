class Menu
{
  void displayMenu()
  {
    textSize(32);
    textAlign(CENTER);
    
    drawOption(0, 0, width / 2, height / 2, 1);
    text("Option 1", width / 4, height / 4);
    
    drawOption(width / 2, 0, width, height / 2, 2);
    text("Option 2", width - width / 4, height / 4);
    
    drawOption(0, height / 2, width / 2, height, 3);
    text("Option 3", width / 4, height - height / 4);

    fill(0);
    rect(width / 2, height / 2, width, height);
    fill(0, 255, 0);
    text("Press '0' to return", width - width / 4, height - height / 4);
    fill(0);
  }

  void drawOption(float x, float y, float xWidth, float yWidth, int o)
  {
    fill(0);
    stroke(255, 0, 255);
    rect(x, y, xWidth, yWidth);
    fill(0, 255, 0);
    if ((mouseX > x) && (mouseX < xWidth) && (mouseY > y) && (mouseY < yWidth))
    {
      mouseOver(random(x, xWidth), random(y, yWidth), random(x, xWidth), random(y, yWidth));
      if (mousePressed && mouseButton == LEFT)
      {
        option = o;
      }
    }
  }

  void mouseOver(float a, float b, float c, float d)
  {
    fill(0, 0, 255);
    line(a, b, c, d);
  }
}

