PShape world;
PShape russia;

ArrayList<ArrayList<PShape>> countries = new ArrayList<ArrayList<PShape>>();

void setup()
{
  size(600, 600);
  shapeMode(CORNER);
  world = loadShape("worldLow.svg");
  russia = world.getChild("RU");
  println(world.getChildCount());
}

void draw()
{
  shape(world, 0, 0, 750, 600);
  
  russia.disableStyle();
  fill(0, 51, 102);
  noStroke();
  shape(russia, 0, 0, 750, 600);
  
}

