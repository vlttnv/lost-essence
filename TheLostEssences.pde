static final int WIDTH = 1280;
static final int HEIGHT = 704;
int videoScale = 32;
int rows, cols;

Map terrainMap;
Player p;


// Setup call
void setup() {
  size(WIDTH, HEIGHT);


  cols = WIDTH/videoScale;
  rows = HEIGHT/videoScale;

  Tiles loadedTiles = new Tiles();
  terrainMap = new Map(loadedTiles, "simple.map");
  p = new Player(loadedTiles);
}

// Draw loop
void draw() {
  println(frameRate);
  background(30, 140, 30);
  terrainMap.drawMap();
  p.drawPlayer();
}

void keyPressed() {
  if (key == 'a') {
    p.movePlayer(0);
  }
  if (key == 'w') {
    p.movePlayer(1);
  } 
  if (key == 'd') {
    p.movePlayer(2);
  } 
  if (key == 's') {
    p.movePlayer(3);
  }
}

void mouseClicked() {
  p.teleportPlayer(mouseX, mouseY);
}

