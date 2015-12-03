Graph g;

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

  g = new Graph(table, map(table.getRowCount(), 0, table.getRowCount(), 0, 2767));
  for (int i = 0; i < Regions.length; i++)
  {
    color c = color(random(0, 255), random(0, 255), random(0, 255));
    g.drawGraph(Regions[i], c);
  }
  g.drawBorders();

  println(table.getRowCount() + " total rows in table"); 
}//End setup()

