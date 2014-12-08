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
ArrayList<Hostile> hosts = new ArrayList<Hostile>();
ArrayList<Friendly> friends = new ArrayList<Friendly>();
ArrayList<Item> drops = new ArrayList<Item>();
int moveClock = 0;

Tiles loadedTiles;

/*-----------------
 UI Components
 -------------------*/
UI ui;
boolean drawCharStats = false;
boolean mainMenu = true;
boolean endGame = false;
boolean foundIt = false;
PFont font;
String typing = "";
String playerName = "";

/*-----------------
 Skills
 -------------------*/
int coolDown0 = 0;
int coolDown1 = 0;
int coolDown2 = 0;
int coolDown3 = 0;
int timer0 = 0;
int timer1 = 0;
int timer2 = 0;
int timer3 = 0;

// Setup call
void setup() {
  font = createFont("Arial", 16, true);
  frameRate(120);
  // Screen
  size(WIDTH, HEIGHT+32);
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

  // PLAYER
  p = new Player("Bob", 5, 5, 100, 0);
}

// Draw loop
void draw() {
  // Switch between the states
  if (mainMenu) {
    ui.drawMainMenu();
  } else if (endGame) { 
    if (foundIt) {
      ui.drawWinMenu();
    } else {
      ui.drawDieMenu();
    }
  } else {

    background(0, 0, 0);
    // Move idle NPCs
    if (moveClock <120) {
      moveClock++;
    } else {
      for (int i=0; i<hosts.size (); i++) {
        if (hosts.size() != 0) {
          hosts.get(i).move();
        }
      }
      for (int i=0; i<friends.size (); i++) {
        friends.get(i).moveRandom();
      }
      moveClock=0;
    }
    if (terrainMap.isDungeon()) {
      // Render with "fog of war"
      terrainMap.drawMap();
      dynamicsPositionMap.drawMap();

      //terrainMap.drawOutdoors();
      //dynamicsPositionMap.drawOutdoors();
    } else {
      terrainMap.drawOutdoors();
      dynamicsPositionMap.drawOutdoors();
    }



    // Dynamic player appearance
    p.drawItems();

    // Bottom bar
    ui.drawMainUI();

    // Hover on bottom bar
    if ((mouseX >= 4*videoScale && mouseX <4*videoScale+32) && mouseY>rows*videoScale) {
      ui.tooltip2(0);
    } else if ((mouseX >= 5*videoScale && mouseX <5*videoScale+32) && mouseY>rows*videoScale) {
      ui.tooltip2(1);
    } else if ((mouseX >= 6*videoScale && mouseX <6*videoScale+32) && mouseY>rows*videoScale) {
      ui.tooltip2(2);
    } else if ((mouseX >= 7*videoScale && mouseX <7*videoScale+32) && mouseY>rows*videoScale) {
      ui.tooltip2(3);
    }

    // Dynamics Tooltip
    if ((mouseX>=0 && mouseX<WIDTH) && (mouseY>=0 && mouseY<HEIGHT)) {
      if (dynamicsPositionMap.get(mouseX/videoScale, mouseY/videoScale) != null) {
        ui.tooltip(dynamicsPositionMap.get(mouseX/videoScale, mouseY/videoScale));
      }
    }

    // Cooldowns
    if (coolDown2 > 0 && coolDown2 <= 600) {

      coolDown2 += 1;
      if (coolDown2 == 600) {
        coolDown2 = 0;
        p.skills[2].tile = 462;
      }
    }
    if (coolDown1 > 0 && coolDown1 <= 360) {

      coolDown1 += 1;
      if (coolDown1 == 360) {
        coolDown1 = 0;
        p.skills[1].tile = 452;
      }
    }
    if (coolDown3 > 0 && coolDown3 <= 1200) {

      coolDown3 += 1;
      if (coolDown3 == 1200) {
        coolDown3 = 0;
        p.skills[3].tile = 464;
      }
    }

    if (timer3 > 0 && timer3 <= 480) {

      timer3 += 1;
      if (timer3 == 480) {
        timer3 = 0;
        p.armor -= 9000;
      }
    }
  }
}

void keyPressed() {
  if (mainMenu) {
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
    if (key == '3') {
      Skill s = p.skills[2];
      s.use(null);
    }
    if (key == '4') {
      Skill s = p.skills[3];
      s.use(null);
    }
    if (key == 't') {
      // Teleport
      mapStack = new ArrayList<Map>();
      dynamicsPositionMap =  new PositionMap();
      terrainMap = new Map("starting.map");
      p.posX = 10;
      p.posY = 10;
      dynamicsPositionMap.register(p, 10, 10);
      p.teleportPlayer(10, 10);
    }
  }
}

void mouseClicked() {

  if (mainMenu) {
    if ((mouseX>490 && mouseX<790) && (mouseY>510 && mouseY<570)) {
      p.setUpWarrior();
      mainMenu = false;
    }
  } else if (endGame) {
    if (foundIt) {
      if ((mouseX>540 && mouseX<734) && (mouseY>513 && mouseY<570)) {
        endGame = false;
        foundIt = false;
        mainMenu = true;
        mapStack = new ArrayList<Map>();
        dynamicsPositionMap =  new PositionMap();
        terrainMap = new Map("starting.map");
        hosts = new ArrayList<Hostile>();
        p = new Player("Bob", 5, 5, 100, 0);
      }
    } else {
      if ((mouseX>540 && mouseX<734) && (mouseY>513 && mouseY<570)) {
        endGame = false;
        foundIt = false;
        mainMenu = true;

        mapStack = new ArrayList<Map>();
        dynamicsPositionMap =  new PositionMap();
        terrainMap = new Map("starting.map");
        hosts = new ArrayList<Hostile>();

        p = new Player("Bob", 5, 5, 100, 0);
      }
    }
  } else {
    if (mouseY<=rows*videoScale) {
      Dynamic temp = dynamicsPositionMap.get(mouseX / videoScale, mouseY / videoScale);

      if (temp != null) {
        if (abs(mouseX/videoScale-p.posX) <=1 && abs(mouseY/videoScale-p.posY) <= 1) {
          if (mouseButton == LEFT) {
            temp.click();
          } else if (mouseButton == RIGHT) {
            Skill s = p.skills[0];
            Dynamic d = dynamicsPositionMap.get(mouseX/videoScale, mouseY/videoScale);
            s.use(d);
          }
        }
      }
    }
  }
}

