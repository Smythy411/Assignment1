PShape world;

String[] Regions = {
  "North America", "Central America", "South America", "Africa", 
  "Europe", "Russia & Central-Asia", "Middle East", "India", "China", 
  "Southeastern Asia", "Korea & Japan", "Oceania"
};

SBar s;

void setup()
{
  size(600, 600);
  fill(255);

  noStroke();
  shapeMode(CORNER);
  world = loadShape("worldLow.svg");

  s = new SBar(0, height - 50, width, height - 20);
}

int option = 0;

void draw()
{
  background(0);

  Table singaporePop = loadTable("singaporePopulation.csv", "header");
  Table regionPop = loadTable("PopByRegion.csv", "header");
  Table regions = loadTable("Regions.csv", "header");

  float border = height * 0.1f;
  float horizontalRange = width - (border * 2.0f);

  switch(option)
  {
  case 0:
    println("Zero");

    textSize(32);
    textAlign(CENTER);

    stroke(255, 0, 255);
    rect(0, 0, width / 2, height / 2);
    fill(0, 255, 0);
    text("Option 1", width / 4, height / 4);
    fill(0);
    rect(width / 2, 0, width, height / 2);
    fill(0, 255, 0);
    text("Option 2", width - width / 4, height / 4);
    fill(0);
    rect(0, height / 2, width / 2, height);
    fill(0, 255, 0);
    text("Option 3", width / 4, height - height / 4);
    fill(0);
    rect(width / 2, height / 2, width, height);
    fill(0, 255, 0);
    text("Press '0' to return", width - width / 4, height - height / 4);
    fill(0);
    break;
  case 1:
    println("One");

    stroke(255, 0, 255);

    float singaporeLineWidth = horizontalRange / (singaporePop.getRowCount() - 1);

    float singaporeDataRange = map(56, 0, 56, 0, 5535002);
    float singaporeVerticaleRange = height - (border * 2.0f);
    float singaporeVerticleScale = singaporeVerticaleRange / singaporeDataRange; 

    for (int i = 0; i < singaporePop.getRowCount () - 1; i++)
    {
      float x1 = border + (i * singaporeLineWidth);
      float y1 = (height - border) - singaporePop.getInt(i, "total_population") * singaporeVerticleScale;

      float x2 = border + (i + 1) * singaporeLineWidth;
      float y2 = (height - border) - singaporePop.getInt(i +1, "total_population") * singaporeVerticleScale;

      stroke(0, 255, 0);
      line(x1, y1, x2, y2);
      stroke(255, 0, 255);
    }//End for

    line(border, height - border, width - border, height - border);
    line(border, height - border, border, border);

    for (int i = 0; i < singaporePop.getRowCount (); i += 5)
    {
      float x = border + (i * singaporeLineWidth);
      float y = height - border;
      float tick = border * 0.1f;
      line(x, y, x, y + tick);
      textAlign(CENTER, CENTER);
      text((int)map(i, 0, 55, 1960, 2015), x, y + (border * 0.5));
    }//End for

    for (int i = 0; i < singaporePop.getRowCount (); i += 5)
    {
      float x = border;
      float y = height - (border + (i * singaporeLineWidth));
      float tick = border * 0.1f;
      line(x, y, x - tick, y);
      fill(255);
      textAlign(RIGHT, BOTTOM);
      textSize(10);
      text((int)map(i, 0, 56, 0, 5535002), x - (border * 0.2), y + (border * 0.15));
    }//End for

    break;
  case 2:
    println("Two");

    float regionLineWidth = horizontalRange / (regionPop.getRowCount());

    float regionDataRange = map(regionPop.getRowCount(), 0, regionPop.getRowCount(), 0, 2767);
    float regionVerticaleRange = height - (border * 2.0f);
    float regionVerticleScale = regionVerticaleRange / regionDataRange; 

    for (int j = 0; j < Regions.length; j++)
    {
      color c = color(random(0, 255), random(0, 255), random(0, 255));
      for (int i = 0; i < regionPop.getRowCount () - 1; i++)
      {
        float x1 = border + (i * regionLineWidth);
        float y1_1 = (height - border) - regionPop.getInt(i, Regions[j]) * regionVerticleScale;

        float x2 = border + (i + 1) * regionLineWidth;
        float y2_1 = (height - border) - regionPop.getInt(i +1, Regions[j]) * regionVerticleScale;

        stroke(c);
        line(x1, y1_1, x2, y2_1);
        stroke(255, 0, 0);
      }//End for
    }

    line(border, height - border, width - border, height - border);
    line(border, height - border, border, border);

    for (float i = 0; i < regionPop.getRowCount (); i += 5)
    {
      float x = border + (i * regionLineWidth);
      float y = height - border;
      float tick = border * 0.1f;
      line(x, y, x, y + tick);
      textAlign(CENTER, CENTER);
      text((int)map(i, 0, regionPop.getRowCount() - 1, 1700, 2100), x, y + (border * 0.5));
    }//End for

    for (int i = 0; i < regionPop.getRowCount () + 1; i += 1)
    {
      float x = border;
      float y = height - (border + (i * regionLineWidth));
      float tick = border * 0.1f;
      line(x, y, x - tick, y);
      fill(255);
      textAlign(RIGHT, BOTTOM);
      textSize(10);
      text((int)map(i, 0, regionPop.getRowCount() - 1, 0, 2700), x - (border * 0.2), y + (border * 0.15));
    }//End for

    break;
  case 3:
    println("Three");

    shape(world, 0, 0, 750, 600);

    s.display();
    s.update();
    int sPos = s.sliderXPos;

    for (int i = 0; i < Regions.length; i++)
    {
      tableRegionColouring(regions, Regions[i], sPos);
    }


    break;
  default:
    println("None");
    break;
  }
}

void keyPressed()
{
  if (key >= '0' && key <='9')
  {
    option = key - '0';
  }
  //println(option);
}

void tableRegionColouring(Table table, String region, int sPos)
{
  for (int i = 0; i < table.getRowCount (); i++)
  {
    PShape country = world.getChild(table.getString(i, region));
    country.disableStyle();
    fill(0.5 * sPos, 0, 0);
    stroke(0, 255, 255);
    shape(country, 0, 0, 750, 600);
  }
}

