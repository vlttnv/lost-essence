/*-----------------
 Screen Variables
 -------------------*/
static final int WIDTH = 1280;
static final int HEIGHT = 704;
int videoScale = 32;
int rows, cols;

/*-----------------
 Maps
 -------------------*/
Map terrainMap;
PositionMap dynamicsPositionMap;
ArrayList<Map> mapStack;

/*-----------------
 Player and NPCs
 -------------------*/
Player p;
Hostile h;
Friendly f;
Entrance entr;
Dynamic[] hosts;

Tiles loadedTiles;

/*-----------------
 UI Components
 -------------------*/
UI ui;
boolean drawCharStats = false;
boolean mainMenu = true;
PFont font;
String typing = "";
String playerName = "";

/*-----------------
 Skills
 -------------------*/
Particle particle;

// Setup call
void setup() {
  font = createFont("Arial", 16, true);
  frameRate(120);
  // Screen
  size(WIDTH, HEIGHT);
  cols = WIDTH/videoScale;
  rows = HEIGHT/videoScale;

  // UI
  ui = new UI();

  // Tiles
  loadedTiles = new Tiles();

  // Maps
  mapStack = new ArrayList<Map>();
  dynamicsPositionMap =  new PositionMap();
  terrainMap = new Map("starting.map");
  mapStack.add(terrainMap);


  //Dynamic test = new Hostile("a", 1, 1, 1, 1, 1, 1, 1, 1);
  //Dynamic test2 = new Friendly("b", 2, 2, 3);
  //println(test.getName());
  //println(test2.getName());

  p = new Player("Bob", 5, 5, 100, 0);
  h = new Hostile("Zombie", 10, 10, 100, 5, 10, 1, 1, 100);
  entr = new Entrance("Portal", 27, 9, 150, 11, 12, "dungeon.map");
  hosts = new Dynamic[10];
  //f = new Friendly("mob2", 20, 20, 100, 100);
}

// Draw loop
void draw() {
  if (mainMenu) {
    ui.drawMainMenu();
  } else {
    //println(frameRate);
    background(0, 0, 0);
    terrainMap.drawMap();
    dynamicsPositionMap.drawMap();
    p.drawItems();
    //p.drawPlayer();
    if (drawCharStats) {
      ui.drawCharStats(p);
    }
    if (particle != null) {
      particle.integrate();
      PVector position = particle.position;
      image(loadedTiles.get(151), position.x, position.y);
    }
    ui.drawMainUI();
  }
}

void keyPressed() {
  if (mainMenu) {
    // If the return key is pressed, save the String and clear it
    if (key == '\n' ) {
      playerName = typing;
      mainMenu = false;
      // A String can be cleared by setting it equal to ""
      typing = "";
    } else {
      // Otherwise, concatenate the String
      // Each character typed by the user is added to the end of the String variable.
      typing = typing + key;
    }
  } else {

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
    if (key == '1') {
      Skill s = p.skills[0];
      Dynamic d = dynamicsPositionMap.get(mouseX/videoScale, mouseY/videoScale);
      s.use(d);
    }
    if (key == '2') {
      Skill s = p.skills[1];
      Dynamic d = dynamicsPositionMap.get(mouseX/videoScale, mouseY/videoScale);
      s.use(d);
    }



    if (key == 'z') {
      if (drawCharStats) {
        drawCharStats = false;
      } else {
        drawCharStats = true;
      }
    }
  }
}

void mouseClicked() {

  if (mainMenu) {
    if ((mouseX>25 && mouseX<122) && (mouseY>100 && mouseY<154)) {
      p.setUpWarrior();
      
    }
    if ((mouseX>28 && mouseX<123) && (mouseY>220 && mouseY<272)) {
      p.setOrc();
      mainMenu = false;
      
    }
  } else {
    //p.teleportPlayer(mouseX, mouseY);
    Dynamic temp = dynamicsPositionMap.get(mouseX / videoScale, mouseY / videoScale);

    if (temp != null) {
      if (abs(mouseX/videoScale-p.posX) <=1 && abs(mouseY/videoScale-p.posY) <= 1) {
        if (mouseButton == LEFT) {
          temp.click();
        } else if (mouseButton == RIGHT) {
          temp.attack(5);
          println(p.posX);
          particle = new Particle(p.posX * videoScale, p.posY  * videoScale, (mouseX-p.posX* videoScale), (mouseY - p.posY* videoScale), 0f, 0f) ;
        }
      }
    }
  }
}

