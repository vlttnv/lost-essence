static final int WIDTH = 1280;
static final int HEIGHT = 704;
int videoScale = 32;
int rows, cols;

Map terrainMap;
Map dynamicsMap;
Player p;


// Setup call
void setup() {
  size(WIDTH, HEIGHT);


  cols = WIDTH/videoScale;
  rows = HEIGHT/videoScale;

  Tiles loadedTiles = new Tiles();
  terrainMap = new Map(loadedTiles, "simple.map");
  dynamicsMap = new Map(loadedTiles, "dynamics.map");
  p = new Player(loadedTiles, dynamicsMap);
}

// Draw loop
void draw() {
  //println(frameRate);
  background(30, 140, 30);
  terrainMap.drawMap();
  dynamicsMap.drawMap();
  //p.drawPlayer();
}

void keyPressed() {
  if (key == 'a') {
    p.movePlayer(0, terrainMap);
  }
  if (key == 'w') {
    p.movePlayer(1, terrainMap);
  } 
  if (key == 'd') {
    p.movePlayer(2, terrainMap);
  } 
  if (key == 's') {
    p.movePlayer(3, terrainMap);
  }
}

void mouseClicked() {
  //p.teleportPlayer(mouseX, mouseY);
  p.shoot(mouseX, mouseY);
}

