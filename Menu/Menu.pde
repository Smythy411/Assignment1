PShape world;

String[] Regions = {
  "North America", "Central America", "South America", "Africa", 
  "Europe", "Russia & Central-Asia", "Middle East", "India", "China", 
  "Southeastern Asia", "Korea & Japan", "Oceania"
};

SBar s;
Graph singaporeGraph, regionGraph;

void setup()
{
  size(600, 600);
  fill(255);

  noStroke();
  shapeMode(CORNER);
  world = loadShape("worldLow.svg");

  Table singaporePop = loadTable("singaporePopulation.csv", "header");
  Table regionPop = loadTable("PopByRegion.csv", "header");

  s = new SBar(0, height - 50, width, height - 20);
  singaporeGraph = new Graph(singaporePop, map(56, 0, 56, 0, 5535002));
  regionGraph = new Graph(regionPop, map(regionPop.getRowCount(), 0, regionPop.getRowCount(), 0, 2767));
}

int option = 0;

void draw()
{
  background(0);

  Table regions = loadTable("Regions.csv", "header");

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

    color c = color(0, 255, 0);
    singaporeGraph.drawGraph("total_population", c);
    singaporeGraph.drawBorders(56, 5535002, 1960, 2015);

    break;
  case 2:
    println("Two");

    for (int i = 0; i < Regions.length; i++)
    {
      c = color(random(0, 255), random(0, 255), random(0, 255));
      regionGraph.drawGraph(Regions[i], c);
    }
    regionGraph.drawBorders(0, 2700, 1700, 2100);
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

