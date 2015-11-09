//OOP Assignment 1 - Visualisation of Population Growth data
//Author: Eoin Smyth
//Date: 29/10/2015
//3888602

void setup()
{
  size(600, 600);
  background(0);
  stroke(255, 0, 255);

  Table table = loadTable("population.csv", "header");

  println(table.getRowCount() + " total rows in table"); 


  for (TableRow row : table.rows ()) 
  {

    int year = row.getInt("year");
    int totalPopulation = row.getInt("total_population");

    println(totalPopulation + " at year " + year);
  }

  float border = height * 0.1f;
  float horizontalRange = width - (border * 2.0f);
  float lineWidth = horizontalRange / (table.getRowCount() - 1);

  float dataRange = map(56, 0, 56, 0, 5535002);
  float verticaleRange = height - (border * 2.0f);
  float verticleScale = verticaleRange / dataRange; 

  for (int i = 0; i < table.getRowCount() - 1; i++)
  {
    float x1 = border + (i * lineWidth);
    float y1 = (height - border) - table.getInt(i, "total_population") * verticleScale;

    float x2 = border + (i + 1) * lineWidth;
    float y2 = (height - border) - table.getInt(i +1, "total_population") * verticleScale;
    
    line(x1, y1, x2, y2);
  }//End for
  
  line(border, height - border, width - border, height - border);
  line(border, height - border, border, border);
  
  for (int i = 0; i < table.getRowCount(); i += 5)
  {
    float x = border + (i * lineWidth);
    float y = height - border;
    float tick = border * 0.1f;
    line(x, y, x, y + tick);
    textAlign(CENTER, CENTER);
    text((int)map(i, 0, 55, 1960, 2015), x, y + (border * 0.5));
  }//End for
  
   for (int i = 0; i < table.getRowCount(); i += 5)
  {
    float x = border;
    float y = height - (border + (i * lineWidth));
    float tick = border * 0.1f;
    line(x, y, x - tick, y);
    textAlign(RIGHT, BOTTOM);
    textSize(10);
    text((int)map(i, 0, 56, 0, 5535002), x - (border * 0.2), y + (border * 0.15));
  }//End for
}//End setup()

