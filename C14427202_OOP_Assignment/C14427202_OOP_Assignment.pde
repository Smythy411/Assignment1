PShape world;

String[] Regions = {
  "North America", "Central America", "South America", "Africa", 
  "Europe", "Russia & Central-Asia", "Middle East", "India", "China", 
  "Southeastern Asia", "Korea & Japan", "Oceania"
};

color[] regionColours = {
  color(164, 196, 0), color(0, 138, 0), color(0, 171, 169), color(27, 161, 226), 
  color(106, 0, 255), color(170, 0, 255), color(216, 0, 115), color(250, 104, 0), 
  color(229, 20, 0), color(227, 200, 0), color(130, 90, 44), color(100, 118, 135)
};

Menu m;
SBar s;
Graph singaporeGraph, regionGraph;

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

  m = new Menu();
  singaporeGraph = new Graph(singaporePop, map(56, 0, 56, 0, 5535002));
  regionGraph = new Graph(regionPop, map(regionPop.getRowCount(), 0, regionPop.getRowCount(), 0, 2767));

  switch(option)
  {
  case 0:
    println("Zero");

    m.displayMenu();

    break;
  case 1:
    println("One");

    color c = color(0, 255, 0);
    singaporeGraph.drawGraph("Singapore (Localized data)", "total_population", c);
    singaporeGraph.drawBorders(56, 5535002, 1960, 2015);

    break;
  case 2:
    println("Two");



    for (int i = 0; i < Regions.length; i++)
    {
      fill(regionColours[i]);
      textSize(10);
      textAlign(CENTER);
      text(Regions[i], width / 4, (width * 0.2f) + 10 * i);
      regionGraph.drawGraph("World Population Growth", Regions[i], regionColours[i]);
    }
    regionGraph.drawBorders(0, 2700, 1700, 2100);

    break;
  case 3:
    println("Three");

    int year = s.display();
    shape(world, 0, 0, 750, 600);

    s.update();

    for (int i = 0; i < Regions.length; i++)
    {
      tableRegionColouring(regions, regionPop, Regions[i], regionColours[i], year);
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
}

void tableRegionColouring(Table table, Table regionTable, String region, color c, int year)
{
  for (int i = 0; i < table.getRowCount (); i++)
  {
    int rowLocation = (int)map(year, 1700, 2100, 0, regionTable.getRowCount() - 1);
    PShape country = world.getChild(table.getString(i, region));

    country.disableStyle();
    fill(c, map(regionTable.getInt(rowLocation, region), 0, 2700, 50, 255));
    stroke(0, 255, 255);
    shape(country, 0, 0, 750, 600);
  }
}

