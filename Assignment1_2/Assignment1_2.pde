void setup()
{
  size(600, 600);
  background(0);
  stroke(255, 0, 255);

  Table table = loadTable("PopByRegion.csv", "header");

  String[] Regions = {
    "North America", "Central America", "South America", "Africa", 
    "Europe", "Russia & Central-Asia", "Middle East", "India", "China", 
    "Southeastern Asia", "Korea & Japan", "Oceania"
  };

  println(table.getRowCount() + " total rows in table"); 

  float border = height * 0.1f;
  float horizontalRange = width - (border * 2.0f);
  float lineWidth = horizontalRange / (table.getRowCount());

  float dataRange = map(table.getRowCount(), 0, table.getRowCount(), 0, 2767);
  float verticaleRange = height - (border * 2.0f);
  float verticleScale = verticaleRange / dataRange; 

  for (int j = 0; j < Regions.length; j++)
  {
    color c = color(random(0, 255), random(0, 255), random(0, 255));
    for (int i = 0; i < table.getRowCount () - 1; i++)
    {
      float x1 = border + (i * lineWidth);
      float y1_1 = (height - border) - table.getInt(i, Regions[j]) * verticleScale;

      float x2 = border + (i + 1) * lineWidth;
      float y2_1 = (height - border) - table.getInt(i +1, Regions[j]) * verticleScale;

      stroke(c);
      line(x1, y1_1, x2, y2_1);
      stroke(255, 0, 0);
    }//End for
  }

  println(border, width - border);


  line(border, height - border, width - border, height - border);
  line(border, height - border, border, border);

  for (float i = 0; i < table.getRowCount (); i += 5)
  {
    float x = border + (i * lineWidth);
    float y = height - border;
    float tick = border * 0.1f;
    line(x, y, x, y + tick);
    textAlign(CENTER, CENTER);
    text((int)map(i, 0, table.getRowCount() - 1, 1700, 2100), x, y + (border * 0.5));
  }//End for

  for (int i = 0; i < table.getRowCount () + 1; i += 1)
  {
    float x = border;
    float y = height - (border + (i * lineWidth));
    float tick = border * 0.1f;
    line(x, y, x - tick, y);
    textAlign(RIGHT, BOTTOM);
    textSize(10);
    text((int)map(i, 0, table.getRowCount() - 1, 0, 2700), x - (border * 0.2), y + (border * 0.15));
  }//End for
}//End setup()

