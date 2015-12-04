class SBar
{
  int barXPos, barYPos;
  int barHeight, barWidth;
  int sliderXPos, sliderYPos;
  int sliderHeight, sliderWidth;

  SBar(int bxp, int byp, int bw, int bh)
  {
    barXPos = bxp;
    barYPos = byp;
    barWidth = bw;
    barHeight = bh;
    sliderXPos = bxp;
    sliderYPos = byp;
    sliderWidth = sliderXPos + 10;
    sliderHeight = bh;
  }
  void update()
  {

    if (mousePressed && mouseButton == LEFT)
    {
      sliderXPos = mouseX - (sliderWidth / 2);
    }
    if (sliderXPos == barXPos)
    {
      sliderXPos = barXPos;
    }
  }

  void display()
  {
    noStroke();
    fill(0, 255, 255);
    rect(barXPos, barYPos, barWidth, barYPos - barHeight);
    fill(255, 0, 255);
    rect(sliderXPos, sliderYPos, sliderWidth, sliderYPos - barHeight);
    text((int)map(sliderXPos, 0, width, 1700, 2100), barWidth / 2, barYPos - 30);
  }
}
