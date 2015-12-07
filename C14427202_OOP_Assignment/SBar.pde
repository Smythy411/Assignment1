class SBar
{
  int barXPos, barYPos;
  int barHeight, barWidth;
  int sliderXPos, sliderYPos;
  int sliderHeight, sliderWidth;
  
  //Scrollbar Constructor
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
  }//End SBar Constructor
  
  //update() updates the scrollbar position to the mouseX position
  //if the left mouse button is pressed
  void update()
  {
    if (mousePressed && mouseButton == LEFT)
    {
      //constrain() ensures that the scrollbar doesn't leave the screens borders
      sliderXPos = constrain(mouseX - (sliderWidth / 2), 0, width);
    }//End if
  }//End update()
  
  //display() Draws the scrollbar to the screen
  //Returns the year at the position it's at so the regions
  //can be coloured appropriately
  int display()
  {
    noStroke();
    textSize(32);
    textAlign(CENTER);
    
    fill(0, 255, 255);
    rect(barXPos, barYPos, barWidth, barYPos - barHeight);
    
    fill(255, 0, 255);
    rect(sliderXPos, sliderYPos, sliderWidth, sliderYPos - barHeight);
    
    int year = (int)map(sliderXPos, 0, width, 1700, 2100);
    year = floored(year);
    text(year, barWidth / 2, barYPos - 30);
    return year;
  }//End display()
  
  //floored() rounds a number down to a given modulus
  //In this case it rounds the years to be divisable by ten
  //Returns the floored number
  int floored(int n)
  {
    for (int i = 0; i < 10; i++)
    {
      if ( (n - i) % 10 == 0)
      {
        n = n - i;
      }//End if
    }//End for
    return n;
  }//End floored()
}//End SBar

