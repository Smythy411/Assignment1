/*
  OOP Assignment 1 - Visualisation of Population Growth data
 Author: Eoin Smyth
 c14427202
 Date Started: 29/10/2015
 Date Finished: 07/12/2015
 */

//Creates a pShape for the world map
PShape world;

//String Array for the regions used in the dataset
String[] Regions = {
  "North America", "Central America", "South America", "Africa", 
  "Europe", "Russia & Central-Asia", "Middle East", "India", "China", 
  "Southeastern Asia", "Korea & Japan", "Oceania"
};

//Corresponding colours for the regions
color[] regionColours = {
  color(164, 196, 0), color(0, 138, 0), color(0, 171, 169), color(27, 161, 226), 
  color(106, 0, 255), color(170, 0, 255), color(216, 0, 115), color(250, 104, 0), 
  color(229, 20, 0), color(227, 200, 0), color(130, 90, 44), color(100, 118, 135)
};

//Declaring instances of classes
Menu m;
SBar s;
Graph singaporeGraph, regionGraph;

void setup()
{
  size(600, 600);
  fill(255);

  noStroke();
  shapeMode(CORNER);

  //Loads in the world map into the pShape
  world = loadShape("worldLow.svg");

  //Constructing menu and scrollbar objects
  s = new SBar(0, height - 50, width, height - 20);
  m = new Menu();
}// End setup()

int option = 0;

void draw()
{
  background(0);

  //Loading in tables. Must be done in draw in order to be accessed respectively
  Table singaporePop = loadTable("singaporePopulation.csv", "header");
  Table regionPop = loadTable("PopByRegion.csv", "header");
  Table regions = loadTable("Regions.csv", "header");

  //Constructing graph objects
  singaporeGraph = new Graph(singaporePop, map(56, 0, 56, 0, 5535002));
  regionGraph = new Graph(regionPop, map(regionPop.getRowCount(), 0, regionPop.getRowCount(), 0, 2767));

  switch(option)
  {
  case 0: // Menu
    println("Zero");

    //Calling the menu method to display the menu
    m.displayMenu();

    break;
  case 1: //Singapore (Localized data)
    println("One");

    color c = color(0, 255, 0);

    //Calling methods to draw Singapore graph
    singaporeGraph.drawGraph("Singapore (Localized data)", "total_population", c);
    singaporeGraph.drawBorders(56, 5535002, 1960, 2015);

    break;
  case 2: // World Population Growth
    println("Two");

    for (int i = 0; i < Regions.length; i++)
    {
      //Colour coding regions for reference
      fill(regionColours[i]);
      textSize(10);
      textAlign(CENTER);
      text(Regions[i], width / 4, (width * 0.2f) + 10 * i);

      //Calling method to draw the region graphs
      regionGraph.drawGraph("World Population Growth", Regions[i], regionColours[i]);
    }// End for
    regionGraph.drawBorders(0, 2700, 1700, 2100);

    break;
  case 3: // World Map
    println("Three");
    
    int year = s.display();
    
    //Draws world map
    shape(world, 0, 0, 750, 600);
    
    //Calling scrollbar update method to update it to mouse location
    s.update();
    
    //Calling function to colour the different regions
    for (int i = 0; i < Regions.length; i++)
    {
      tableRegionColouring(regions, regionPop, Regions[i], regionColours[i], year);
    }//End for

    break;
  default:
    println("None");

    break;
  }
}//End draw()

//Key presses change whats displayed on the screen
void keyPressed()
{
  if (key >= '0' && key <='3')
  {
    option = key - '0';
  }//End if
}//End keyPressed()

//Function to colour the countries to scale of their population at a given year
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
  }//End for
}//End tableRegionColouring()

