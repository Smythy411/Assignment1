void setup()
{
  size(800, 800);
  background(0);
  stroke(255, 0, 255);

  Table table = loadTable("PopByRegion.csv", "header");

  println(table.getRowCount() + " total rows in table"); 


  /* for (TableRow row : table.rows ()) 
   {
   
   int year = row.getInt("year");
   float northAmerica = row.getFloat("North America");
   float centralAmerica = row.getFloat("Central America");
   float southAmerica = row.getFloat("South America");
   float africa = row.getFloat("Africa");
   float aurope = row.getFloat("Europe");
   float Russia = row.getFloat("Russia & Central-Asia");
   
   println(northAmerica + " at year " + year);
   }*/

  float border = height * 0.1f;
  float horizontalRange = width - (border * 2.0f);
  float lineWidth = horizontalRange / (table.getRowCount());

  float dataRange = map(table.getRowCount(), 0, table.getRowCount(), 0, 2767);
  float verticaleRange = height - (border * 2.0f);
  float verticleScale = verticaleRange / dataRange; 

  for (int i = 0; i < table.getRowCount() - 1; i++)
  {
    float x1 = border + (i * lineWidth);
    float y1_1 = (height - border) - table.getInt(i, "North America") * verticleScale;
    float y1_2 = (height - border) - table.getInt(i, "Central America") * verticleScale;
    float y1_3 = (height - border) - table.getInt(i, "South America") * verticleScale;
    float y1_4 = (height - border) - table.getInt(i, "Africa") * verticleScale;
    float y1_5 = (height - border) - table.getInt(i, "Europe") * verticleScale;
    float y1_6 = (height - border) - table.getInt(i, "Russia & Central-Asia") * verticleScale;
    float y1_7 = (height - border) - table.getInt(i, "Middle East") * verticleScale;
    float y1_8 = (height - border) - table.getInt(i, "India") * verticleScale;
    float y1_9 = (height - border) - table.getInt(i, "China") * verticleScale;
    float y1_10 = (height - border) - table.getInt(i, "Southeastern Asia") * verticleScale;
    float y1_11 = (height - border) - table.getInt(i, "Korea & Japan") * verticleScale;
    float y1_12 = (height - border) - table.getInt(i, "Oceania") * verticleScale;


    float x2 = border + (i + 1) * lineWidth;
    float y2_1 = (height - border) - table.getInt(i +1, "North America") * verticleScale;
    float y2_2 = (height - border) - table.getInt(i +1, "Central America") * verticleScale;
    float y2_3 = (height - border) - table.getInt(i +1, "South America") * verticleScale;
    float y2_4 = (height - border) - table.getInt(i +1, "Africa") * verticleScale;
    float y2_5 = (height - border) - table.getInt(i +1, "Europe") * verticleScale;
    float y2_6 = (height - border) - table.getInt(i +1, "Russia & Central-Asia") * verticleScale;
    float y2_7 = (height - border) - table.getInt(i +1, "Middle East") * verticleScale;
    float y2_8 = (height - border) - table.getInt(i +1, "India") * verticleScale;
    float y2_9 = (height - border) - table.getInt(i +1, "China") * verticleScale;
    float y2_10 = (height - border) - table.getInt(i +1, "Southeastern Asia") * verticleScale;
    float y2_11 = (height - border) - table.getInt(i +1, "Korea & Japan") * verticleScale;
    float y2_12 = (height - border) - table.getInt(i +1, "Oceania") * verticleScale;

    stroke(0, 0, 255);
    line(x1, y1_1, x2, y2_1);
    stroke(255, 0, 0);
    line(x1, y1_2, x2, y2_2);
    stroke(125, 255, 125);
    line(x1, y1_3, x2, y2_3);
    stroke(125, 125, 125);
    line(x1, y1_4, x2, y2_4);
    stroke(255, 160, 122);
    line(x1, y1_5, x2, y2_5);
    stroke(147, 112, 216);
    line(x1, y1_6, x2, y2_6);
    stroke(255, 140, 0);
    line(x1, y1_7, x2, y2_7);
    stroke(128, 0, 0);
    line(x1, y1_8, x2, y2_8);
    stroke(30, 144, 255);
    line(x1, y1_9, x2, y2_9);
    stroke(255, 105, 180);
    line(x1, y1_10, x2, y2_10);
    stroke(189, 183, 107);
    line(x1, y1_11, x2, y2_11);
    stroke(95, 158, 160);
    line(x1, y1_12, x2, y2_12);
    stroke(248, 248, 255);
  }//End for
  
  println(border, width - border);


  line(border, height - border, width - border, height - border);
  line(border, height - border, border, border);

  for (float i = 0; i < table.getRowCount(); i += 5)
  {
    float x = border + (i * lineWidth);
    float y = height - border;
    float tick = border * 0.1f;
    line(x, y, x, y + tick);
    textAlign(CENTER, CENTER);
    text((int)map(i, 0, table.getRowCount() - 1, 1700, 2100), x, y + (border * 0.5));
  }//End for

  for (int i = 0; i < table.getRowCount() + 1; i += 1)
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

