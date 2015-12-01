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
  noStroke();
  shapeMode(CORNER);
  world = loadShape("worldLow.svg");

  s = new SBar(0, height - 50, width, height - 20);
}

void draw()
{
  background(0);
  shape(world, 0, 0, 750, 600);

  s.display();
  s.update();
  int sPos = s.sliderXPos;

  Table regions = loadTable("Regions.csv", "header");
  Table regionData = loadTable("PopByRegion.csv", "header");


  for (int i = 0; i < Regions.length; i++)
  {
    tableRegionColouring(regions, Regions[i], sPos);
  }
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

