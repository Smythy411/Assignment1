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
    sliderWidth = sliderXPos + 20;
    sliderHeight = bh;
  }
  void update()
  {

    if (mousePressed && mouseButton == LEFT)
    {
      sliderXPos = mouseX - 10;
    }
   /*if (mouseX > sliderXPos && mouseX < sliderXPos + sliderWidth &&
      mouseY > sliderYPos && mouseY < sliderYPos + sliderHeight)
    {
    }*/
  }

  void display()
  {
    noStroke();
    fill(0, 255, 255);
    rect(barXPos, barYPos, barWidth, barYPos - barHeight);
    fill(255, 0, 255);
    rect(sliderXPos, sliderYPos, sliderWidth, sliderYPos - barHeight);
  }
}
