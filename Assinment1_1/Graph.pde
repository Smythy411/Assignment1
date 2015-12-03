class Graph
{
  Table table;
  float border;
  float horizontalRange, lineWidth;
  float dataRange;
  float verticleRange, verticleScale;
  String rowHeader;

  Graph(Table t, float dR, String s)
  {
    table = t;
    dataRange = dR;
    rowHeader = s;
    border = height * 0.1f;
    horizontalRange = width - (border * 2.0f);
    lineWidth = horizontalRange / (table.getRowCount());
    verticleRange = height - (border * 2.0f);
    verticleScale = verticleRange / dataRange;
  }

  void drawGraph()
  {
    for (int i = 0; i < table.getRowCount () - 1; i++)
    {
      float x1 = border + (i * lineWidth);
      float y1 = (height - border) - table.getInt(i, rowHeader) * verticleScale;

      float x2 = border + (i + 1) * lineWidth;
      float y2 = (height - border) - table.getInt(i +1, rowHeader) * verticleScale;

      line(x1, y1, x2, y2);
    }//End for

    line(border, height - border, width - border, height - border);
    line(border, height - border, border, border);

    for (int i = 0; i < table.getRowCount (); i += 5)
    {
      float x = border + (i * lineWidth);
      float y = height - border;
      float tick = border * 0.1f;
      line(x, y, x, y + tick);
      textAlign(CENTER, CENTER);
      text((int)map(i, 0, 55, 1960, 2015), x, y + (border * 0.5));
    }//End for

    for (int i = 0; i < table.getRowCount (); i += 5)
    {
      float x = border;
      float y = height - (border + (i * lineWidth));
      float tick = border * 0.1f;
      line(x, y, x - tick, y);
      textAlign(RIGHT, BOTTOM);
      textSize(10);
      text((int)map(i, 0, 56, 0, 5535002), x - (border * 0.2), y + (border * 0.15));
    }//End for
  }
}

