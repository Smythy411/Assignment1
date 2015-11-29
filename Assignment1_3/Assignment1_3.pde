PShape world;
Sbar s;

String[] Africa = {
  "DZ", "AO", "BJ", "BW", "BF", "BI", "CM", "CF", 
  "TD", "CD", "CG", "CI", "DJ", "EG", "EH", "GQ", "ER", "ET", 
  "GA", "GM", "GH", "GN", "GW", "KE", "LS", "LR", "LY", "MW", 
  "ML", "MR", "MA", "MG", "MR", "MZ", "NA", "NE", "NG", "RW", 
  "SN", "SL", "SO", "ZA", "SS", "SD", "SZ", "TZ", "TG", "TN", 
  "UG", "ZM", "ZW"
};
String[] Europe = {
  "AL", "AM", "AT", "AZ", "BY", "BE", "BA", "BG", "HR", "CY", 
  "CZ", "DK", "EE", "FI", "FR", "GE", "DE", "GR", "HU", "IS", 
  "IE", "IT", "XK", "LV", "LT", "LU", "MK", "MD", "ME", "NL", 
  "NO", "PL", "PL", "PT", "RO", "RS", "SK", "SI", "ES", "SE", 
  "CH", "TR", "UA", "GB", "SJ"
};
String[] China = {
  "CN"
};
String[] India = {
  "IN"
};
String[] Korea_Japan = {
  "KP", "KR", "JP"
};
String[] southeastAsia = {
  "BD", "BN", "BT", "KH", "TL", "ID", "LA", "LK", 
  "MY", "MM", "NP", "PH", "TH", "TW", "VN"
};
String[] Russia_CentralAsia = {
  "RU", "KZ", "KG", "TJ", "TM", "UZ", "MN",
};
String[] middleEast = {
  "IR", "IQ", "IL", "JO", "KW", "LB", "OM", 
  "QA", "SA", "SY", "AE", "YE", "PK", "AF"
};
String[] centralAmerica = {
  "BZ", "CR", "SV", "GT", "HN", "NI", "PA"
}; 
String[] northAmerica = {
  "CA", "US", "GL", "MX", "BS", "CU", 
  "DO", "HT", "JM", "PR"
};

String[] southAmerica = {
  "AR", "BO", "BR", "CL", "CO", "EC", "GF", "GY", 
  "FK", "PY", "PE", "SR", "TT", "UY", "VE"
};

String[] Oceania = {
  "AU", "FJ", "NZ", "PG", "SB", "VU", "NC"
};

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
  shape(world, 0, 0, 750, 600);

  regionColouring(India, color(125, 125, 125));
  regionColouring(China, color(255, 0, 0));
  regionColouring(Korea_Japan, color(0, 0, 255));
  regionColouring(southeastAsia, color(255, 125, 0));
  regionColouring(Russia_CentralAsia, color(125, 0, 255));
  regionColouring(middleEast, color(255, 0, 125));
  regionColouring(centralAmerica, color(125, 0, 0));
  regionColouring(northAmerica, color(0, 255, 0));
  regionColouring(southAmerica, color(125, 255, 125));
  regionColouring(Africa, color(255, 0, 255));
  regionColouring(Europe, color(56, 210, 100));
  regionColouring(Oceania, color(0, 125, 255));
}

void regionColouring(String region[], int c)
{
  for (int i = 0; i < region.length; ++i)
  {
    PShape country = world.getChild(region[i]);
    country.disableStyle();
    fill(c);
    noStroke();
    shape(country, 0, 0, 750, 600);
  }
}

