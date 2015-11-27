PShape world;
PShape russia;
PShape ireland;
PShape country;
String[] Africa = {
  "DZ", "AO", "BJ", "BW", "BF", "BI", "CM", "CF", 
  "TD", "CD", "CG", "CI", "DJ", "EG", "EH", "GQ", "ER", "ET", 
  "GA", "GM", "GH", "GN", "GW", "KE", "LS", "LR", "LY", "MW", 
  "ML", "MR", "MA", "MG", "MR", "MZ", "NA", "NE", "NG", "RW", 
  "SN", "SL", "SO", "ZA", "SS", "SD", "SZ", "TZ", "TG", "TN", 
  "UG", "ZM", "ZW"
};

ArrayList<PShape> countries = new ArrayList<PShape>();

void setup()
{
  size(600, 600);
  shapeMode(CORNER);
  world = loadShape("worldLow.svg");
  russia = world.getChild("RU");
  ireland = world.getChild("IE");

  countries.add(russia);
  countries.add(ireland);
}

void draw()
{
  shape(world, 0, 0, 750, 600);


  for (int i = 0; i < countries.size (); i++)
  {
    countries.get(i).disableStyle();
    fill(0, 51, 102);
    noStroke();
    shape(countries.get(i), 0, 0, 750, 600);
    println(i);
  }

  for (int i = 0; i < Africa.length; ++i)
  {
    country = world.getChild(Africa[i]);
    country.disableStyle();
    fill(255, 0, 255);
    noStroke();
    shape(country, 0, 0, 750, 600);
    println(Africa[i]);
  }
}

