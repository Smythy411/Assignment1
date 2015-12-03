//OOP Assignment 1 - Visualisation of Population Growth data
//Author: Eoin Smyth
//Date: 29/10/2015
//3888602

Graph g;

void setup()
{
  size(600, 600);
  background(0);
  stroke(255, 0, 255);

  Table table = loadTable("population.csv", "header");
  
  g = new Graph(table, map(56, 0, 56, 0, 5535002));

  println(table.getRowCount() + " total rows in table"); 


  for (TableRow row : table.rows ()) 
  {

    int year = row.getInt("year");
    int totalPopulation = row.getInt("total_population");

    println(totalPopulation + " at year " + year);
  }
  
  color c = color(0, 255, 0);
  g.drawGraph("total_population", c);
  g.drawBorders();
}//End setup()

