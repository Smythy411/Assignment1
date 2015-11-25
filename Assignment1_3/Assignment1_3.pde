PShape world;
PShape russia;

void setup()
{
  size(950, 620);
  shapeMode(CORNER);
  world = loadShape("worldLow.svg");
  russia = world.getChild("RU");
  println(world.getChildCount());
}

void draw()
{
  shape(world, 0, 0, 950, 620);
  
  russia.disableStyle();
  fill(0, 51, 102);
  noStroke();
  shape(russia, 0, 0, 950, 620);
  
}

