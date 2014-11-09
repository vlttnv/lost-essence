// Screen variables
static final int WIDTH = 1280;
static final int HEIGHT = 704;
int videoScale = 32;
int rows, cols;

// Maps
Map terrainMap;
PositionMap dynamicsPositionMap;

// Player and NPCs
Player p;
Hostile h;
Friendly f;

Tiles loadedTiles;



// Setup call
void setup() {
  // Screen
  size(WIDTH, HEIGHT);
  cols = WIDTH/videoScale;
  rows = HEIGHT/videoScale;

  // Tiles
  loadedTiles = new Tiles();

  // Maps
  dynamicsPositionMap =  new PositionMap();
  terrainMap = new Map(loadedTiles, "simple.map");


  //Dynamic test = new Hostile("a", 1, 1, 1, 1, 1, 1, 1, 1);
  //Dynamic test2 = new Friendly("b", 2, 2, 3);
  //println(test.getName());
  //println(test2.getName());

  p = new Player("Lolo", 5, 5, 100, 101);
  h = new Hostile("Mob", 10, 10, 10, 5, 10, 1, 1, 100, 100);
  //f = new Friendly("mob2", 20, 20, 100, 100);
}

// Draw loop
void draw() {
  //println(frameRate);
  background(30, 140, 30);
  terrainMap.drawMap();
  dynamicsPositionMap.drawMap();
  //p.drawPlayer();
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
  //p.teleportPlayer(mouseX, mouseY);
  Dynamic temp = dynamicsPositionMap.get(mouseX / videoScale, mouseY / videoScale);

  if (temp != null) {
    if (mouseButton == LEFT) {
      temp.click();
    } else if (mouseButton == RIGHT) {
      temp.attack(5);
    }
  }
}

