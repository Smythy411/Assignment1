class Graph
{
  Table table;
  float border;
  float horizontalRange, lineWidth;
  float dataRange;
  float verticleRange, verticleScale;

  Graph(Table t, float dR)
  {
    table = t;
    dataRange = dR;
    border = height * 0.1f;
    horizontalRange = width - (border * 2.0f);
    lineWidth = horizontalRange / (table.getRowCount());
    verticleRange = height - (border * 2.0f);
    verticleScale = verticleRange / dataRange;
  }

  void drawGraph(String s, color c)
  {
    int counter = 0;

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
  }

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
      text((int)map(i, 0, table.getRowCount(), leftXExtreme, rightXExtreme), x, y + (border * 0.5));
    }//End for

    for (int i = 0; i < table.getRowCount (); i += 5)
    {
      float x = border;
      float y = height - (border + (i * lineWidth));
      float tick = border * 0.1f;
      line(x, y, x - tick, y);
      fill(255);
      textAlign(RIGHT, BOTTOM);
      textSize(10);
      text((int)map(i, 0, table.getRowCount(), bottomYExtreme, topYExtreme), x - (border * 0.2), y + (border * 0.15));
    }//End for
  }
}

