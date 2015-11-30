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

  Table regions = loadTable("Regions.csv", "header");

  for (int i = 0; i < Regions.length; i++)
  {
    tableRegionColouring(regions, Regions[i], color(i + 1, (i + 1) * 10, (i + 1) * 20));
  }

  s.display();
  s.update();
}

void tableRegionColouring(Table table, String region, int c)
{
  for (int i = 0; i < table.getRowCount (); i++)
  {
    PShape country = world.getChild(table.getString(i, region));
    country.disableStyle();
    fill(c);
    noStroke();
    shape(country, 0, 0, 750, 600);
  }
}

