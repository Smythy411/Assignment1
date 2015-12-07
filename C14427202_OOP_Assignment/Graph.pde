class Graph
{
  Table table;
  float border;
  float horizontalRange, lineWidth;
  float dataRange;
  float verticleRange, verticleScale;
  
  //Graph Constructor
  Graph(Table t, float dR)
  {
    this.table = t;
    this.dataRange = dR;
    border = height * 0.1f;
    horizontalRange = width - (border * 2.0f);
    lineWidth = horizontalRange / (table.getRowCount());
    verticleRange = height - (border * 2.0f);
    verticleScale = verticleRange / dataRange;
  }// End Graph Constructor
  
  //drawGraph() Draws a line graph, passes in a string for the header at the top of the screen,
  //a string to access the table column of a region
  //and a colour variable to colour the line graph
  void drawGraph(String header, String s, color c)
  {
    textAlign(CENTER);
    textSize(32);
    fill(255);
    text(header, width / 2, border - 10);

    for (int i = 0; i < table.getRowCount () - 1; i++)
    {
      float x1 = border + (i * lineWidth);
      float y1 = (height - border) - table.getInt(i, s) * verticleScale;

      float x2 = border + (i + 1) * lineWidth;
      float y2 = (height - border) - table.getInt(i +1, s) * verticleScale;

      stroke(c);
      line(x1, y1, x2, y2);
      stroke(255, 0, 255);
    }//End for
  }//End drawGraph()
  
  //drawBorders() Draws the borders (or axis) of the graph.
  //Paramaters define the range by which to map them to.
  void drawBorders(int bottomYExtreme, int topYExtreme, int leftXExtreme, int rightXExtreme)
  {

    line(border, height - border, width - border, height - border);
    line(border, height - border, border, border);

    for (int i = 0; i < table.getRowCount (); i += 5)
    {
      float x = border + (i * lineWidth);
      float y = height - border;
      float tick = border * 0.1f;
      line(x, y, x, y + tick);
      textAlign(CENTER, CENTER);
      textSize(10);
      text((int)map(i, 0, table.getRowCount() -1, leftXExtreme, rightXExtreme), x, y + (border * 0.5));
      
      //Fixes a problem I had where the borders would extend to far
      if (i == table.getRowCount() - 1)
      {
        stroke(0);
        line(x, y, x + border, y);
        stroke(255, 0, 255);
      }//End if
    }//End for

    for (int i = 0; i < table.getRowCount (); i += 5)
    {
      float x = border;
      float y = height - (border + (i * lineWidth));
      float tick = border * 0.1f;
      line(x, y, x - tick, y);
      fill(255);
      textAlign(RIGHT, BOTTOM);
      text((int)map(i, 0, table.getRowCount() -1, bottomYExtreme, topYExtreme), x - (border * 0.2), y + (border * 0.15));
    }//End for
  }//End drawBorders()
}//End Graph

