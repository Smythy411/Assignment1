class Menu
{
  void displayMenu()
  {
    textSize(32);
    textAlign(CENTER);

    stroke(255, 0, 255);
    rect(0, 0, width / 2, height / 2);
    fill(0, 255, 0);
    if ((mouseX > 0) && (mouseX < width / 2) && (mouseY > 0) && (mouseY < height / 2))
    {
      mouseOver(random(0, width / 2), random(0, height / 2), random(0, width / 2), random(0, height / 2));
    }
    text("Option 1", width / 4, height / 4);

    fill(0);
    rect(width / 2, 0, width, height / 2);
    fill(0, 255, 0);
    if ((mouseX > width / 2) && (mouseX < width) && (mouseY > 0) && (mouseY < height / 2))
    {
      mouseOver(random(width / 2, width), random(0, height / 2), random(width / 2, width), random(0, height / 2));
    }
    text("Option 2", width - width / 4, height / 4);

    fill(0);
    rect(0, height / 2, width / 2, height);
    fill(0, 255, 0);
    if ((mouseX > 0) && (mouseX < width / 2) && (mouseY > height / 2) && (mouseY < height))
    {
      mouseOver(random(0, width / 2), random(height / 2, height), random(0, width / 2), random(height / 2, height));
    }
    text("Option 3", width / 4, height - height / 4);

    fill(0);
    rect(width / 2, height / 2, width, height);
    fill(0, 255, 0);
    text("Press '0' to return", width - width / 4, height - height / 4);
    fill(0);
  }

  void mouseOver(float a, float b, float c, float d)
  {
    line(a, b, c, d);
  }
}

