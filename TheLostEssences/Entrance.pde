class Entrance extends Dynamic {
  int newX;
  int newY;
  String map;
  int direction;
  public static final int D_UP = 0;
  public static final int D_DOWN = 1;

  public Entrance(String name, 
  int x, 
  int y, 
  int tile, 
  int newX, 
  int newY, 
  String map, 
  int direction) {
    super(name, x, y, tile);
    dynamicsPositionMap.register(this, posX, posY);
    this.newX = newX;
    this.newY = newY;
    this.map = map;
    this.direction = direction;
    println("creating portal with " + map);
  }

  public void click() {
    if (map.equals("random_dungeon")) {

      if (direction == D_UP) {
        // Pop the map
        Map poppedMap = mapStack.get(mapStack.size()-1);
        mapStack.remove(mapStack.size()-1);

        // Set positions
        dynamicsPositionMap =  new PositionMap();
        terrainMap = poppedMap;

        // Prepare for new entrances
        String terMapName = mapStack.get(mapStack.size()-1).getMapName();
        if (terMapName == null) {
          terMapName = "random_dungeon";
        }


        // Set player
        p.posX = newX;
        p.posY = newY;

        new Entrance("Exit", p.posX, p.posY+1, 150, 11, 12, terMapName, D_UP);
        //new Entrance("Entrance", p.posX,p.posY+2, 150, 11, 12, "random_dungeon", D_DOWN);

        // Teleport player
        dynamicsPositionMap.register(p, newX, newY);
        p.teleportPlayer(newX, newY);
      } else if (direction == D_DOWN) {
        String terMapName = terrainMap.getMapName();
        if (terMapName == null) {
          terMapName = "random_dungeon";
        }

        // Add map to stack
        mapStack.add(terrainMap);

        dynamicsPositionMap =  new PositionMap();
        terrainMap = new Map(1);
        p.posX = newX;
        p.posY = newY;

        // New entrances
        new Entrance("Exit", p.posX, p.posY+1, 150, 11, 12, terMapName, D_UP);
        new Entrance("Entrance", (int)random(0, cols-1), (int)random(0, rows-1), 150, 11, 12, "random_dungeon", D_DOWN);

        dynamicsPositionMap.register(p, newX, newY);

        /*
        GENERATE NPCs
         */
        generateNPC();
        p.teleportPlayer(newX, newY);
      }
    } else {
      dynamicsPositionMap =  new PositionMap();
      terrainMap = new Map(map);
      p.posX = newX;
      p.posY = newY;
      //new Entrance("Portal", p.posX,p.posY+1, 150, 11, 12, "starting.map");
      //new Entrance("Portal", (int)random(0, cols-1), (int)random(0, rows-1), 150, 11, 12, "dungeon.map");

      dynamicsPositionMap.register(p, newX, newY);
      //    for (int i=0; i<15; i++) {
      //      new Hostile("Z" +i, (int)random(0, cols-1), (int)random(0, rows-1), 10, 5, 10, 1, 1, 110);
      //    }
      p.teleportPlayer(newX, newY);
    }
  }

  public void generateNPC() {
    for (int i=0; i<15; i++) {
      // Generate a bunch or normal monsters
      // generate 1-2 bosses
      
      new Hostile("",(int)random(0, cols-1), (int)random(0, rows-1), 0);
    }
  }

  public void attack(int dmg) {
    println("You cannot attack me");
  }
}

