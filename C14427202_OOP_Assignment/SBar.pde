class SBar
{
  int barXPos, barYPos;
  int barHeight, barWidth;
  int sliderXPos, sliderYPos;
  int sliderHeight, sliderWidth;

  SBar(int bxp, int byp, int bw, int bh)
  {
    this.barXPos = bxp;
    this.barYPos = byp;
    this.barWidth = bw;
    this.barHeight = bh;
    sliderXPos = bxp;
    sliderYPos = byp;
    sliderWidth = sliderXPos + 10;
    sliderHeight = bh;
  }
  void update()
  {
    if (mousePressed && mouseButton == LEFT)
    {
      sliderXPos = constrain(mouseX - (sliderWidth / 2), 0, width);
    }
    if (sliderXPos == barXPos)
    {
      sliderXPos = barXPos;
    }
  }

  int display()
  {
    noStroke();
    textSize(32);
    textAlign(CENTER);
    fill(0, 255, 255);
    rect(barXPos, barYPos, barWidth, barYPos - barHeight);
    fill(255, 0, 255);
    rect(sliderXPos, sliderYPos, sliderWidth, sliderYPos - barHeight);
    int temp = (int)map(sliderXPos, 0, width, 1700, 2100);
    temp = floored(temp);
    text(temp, barWidth / 2, barYPos - 30);
    return temp;
  }

  int floored(int n)
  {
    for (int i = 0; i < 10; i++)
    {
      if ( (n - i) % 10 == 0)
      {
        n = n - i;
      }
    }
    return n;
  }
}

