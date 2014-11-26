// Screen variables
static final int WIDTH = 1280;
static final int HEIGHT = 704;
int videoScale = 32;
int rows, cols;

Map terrainMap;
Tiles loadedTiles;

PrintWriter output;
int tile = 1;

boolean typing = false;
String temp = "";

void setup() {
  frameRate(120);
  // Screen
  size(WIDTH, HEIGHT);
  cols = WIDTH/videoScale;
  rows = HEIGHT/videoScale;

  // Tiles
  loadedTiles = new Tiles();
  terrainMap = new Map(loadedTiles, "newmap.txt");

  output = createWriter("maps/newmap.txt");
}

void draw() {
  terrainMap.drawMap();
}

void mouseDragged() {
  terrainMap.set(mouseX / videoScale, mouseY / videoScale, tile);
}
void mouseClicked() {
  terrainMap.set(mouseX / videoScale, mouseY / videoScale, tile);
}

void keyPressed() {
  if (!typing && key == 'q' ) {
    typing = true;
    temp = "";
  } else if (!typing && key == 's') { 
    terrainMap.saveMap();
  } else if (typing && key == '\n') {
    tile = Integer.parseInt(temp);
    typing = false;
  } else if (!typing && key == 'g') {
    terrainMap.generateMap();
  } else {
    temp = temp + key;
  }
}

void stop() {
  terrainMap.saveMap();
}

