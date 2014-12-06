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
    super(name, x, y, tile, 102);
    dynamicsPositionMap.register(this, posX, posY);
    this.newX = newX;
    this.newY = newY;
    this.map = map;
    this.direction = direction;
    println("creating portal with " + map);
  }

  public void click() {
    hosts.clear();
    if (map.equals("random_dungeon")) {

      if (direction == D_UP) {
        p.dunLevel -= 1;
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

        int ran_x = (int)random(0, cols-1);
        int ran_y = (int)random(0, rows-1);
        while (!terrainMap.isStepable (ran_x, ran_y)) {
          ran_x = (int)random(0, cols-1);
          ran_y = (int)random(0, rows-1);
        }
        new Entrance("Exit to " + (p.dunLevel-1), ran_x, ran_y, 152, 11, 12, terMapName, D_UP);
        //new Entrance("Entrance", p.posX,p.posY+2, 150, 11, 12, "random_dungeon", D_DOWN);

        // Teleport player
        dynamicsPositionMap.register(p, newX, newY);
        p.teleportPlayer(newX, newY);
      } else if (direction == D_DOWN) {
        p.dunLevel += 1;
        boolean finalLevel = false;

        int rollLevel = (int)Math.round(random(p.dunLevel-3, p.dunLevel+3));

        if (p.dunLevel == rollLevel) {
          finalLevel = true;
          println("FINAAAAAL");
        }
        String terMapName = terrainMap.getMapName();
        if (terMapName == null) {
          terMapName = "random_dungeon";
        }

        // Add map to stack
        mapStack.add(terrainMap);

        dynamicsPositionMap =  new PositionMap();
        terrainMap = new Map(1);


        // New entrances
        int ran_x = (int)random(0, cols-1);
        int ran_y = (int)random(0, rows-1);
        while (!terrainMap.isStepable (ran_x, ran_y)) {
          ran_x = (int)random(0, cols-1);
          ran_y = (int)random(0, rows-1);
        }
        new Entrance("Exit to " + (p.dunLevel-1), ran_x, ran_y, 152, this.posX, this.posY, terMapName, D_UP);
        newX = ran_x;
        newY = ran_y;
        if (terrainMap.isStepable(ran_x+1, ran_y)) {
          newX += 1;
        } else if (terrainMap.isStepable(ran_x-1, ran_y)) {
          newX -= 1;
        } else if (terrainMap.isStepable(ran_x, ran_y+1)) {
          newY += 1;
        } else if (terrainMap.isStepable(ran_x, ran_y-1)) {
          newY -= 1;
        }
        p.posX = newX;
        p.posY = newY;



        if (!finalLevel) {
          ran_x = (int)random(0, cols-1);
          ran_y = (int)random(0, rows-1);
          while (!terrainMap.isStepable (ran_x, ran_y)) {
            ran_x = (int)random(0, cols-1);
            ran_y = (int)random(0, rows-1);
          }
          new Entrance("Entrance to " + (p.dunLevel+1), ran_x, ran_y, 153, ran_x, ran_y, "random_dungeon", D_DOWN);
        }


        dynamicsPositionMap.register(p, newX, newY);

        /*
        GENERATE NPCs
         */
        generateNPC(finalLevel);
        p.teleportPlayer(newX, newY);
      }
    } else {
      p.dunLevel = 0;
      dynamicsPositionMap =  new PositionMap();
      terrainMap = new Map(map);
      if (terrainMap.isStepable(newX+1, newY)) {
        newX += 1;
      } else if (terrainMap.isStepable(newX-1, newY)) {
        newX -= 1;
      } else if (terrainMap.isStepable(newX, newY+1)) {
        newY += 1;
      } else if (terrainMap.isStepable(newX, newY-1)) {
        newY -= 1;
      }

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


  public void generateNPC(boolean finalLevel) {
    int amount = (int)Math.round(random(5, 15));
    for (int i=0; i<amount; i++) {
      // Generate a bunch or normal monsters
      // generate 1-2 bosses
      int t = (int)Math.round(random(2));
      int ran_x = (int)random(0, cols-1);
      int ran_y = (int)random(0, rows-1);
      while (!terrainMap.isStepable (ran_x, ran_y)) {
        ran_x = (int)random(0, cols-1);
        ran_y = (int)random(0, rows-1);
      }
      if (t == Hostile.UNDEAD) {
        new Hostile("", ran_x, ran_y, Hostile.UNDEAD);
      } else if (t == Hostile.DEMON) {
        new Hostile("", ran_x, ran_y, Hostile.DEMON);
      } else if (t == Hostile.HUMANOID) {
        new Hostile("", ran_x, ran_y, Hostile.HUMANOID);
      }
    }
    int spawnUnique = (int)Math.round(random(100));
    int ran_x = (int)random(0, cols-1);
    int ran_y = (int)random(0, rows-1);
    while (!terrainMap.isStepable (ran_x, ran_y)) {
      ran_x = (int)random(0, cols-1);
      ran_y = (int)random(0, rows-1);
    }
    if (!finalLevel && spawnUnique >=90) {
      new Hostile("", ran_x, ran_y, Hostile.UNIQUE);
    } else if (finalLevel) {

      new Hostile("", ran_x, ran_y, Hostile.UNIQUE);
      ran_x = (int)random(0, cols-1);
      ran_y = (int)random(0, rows-1);
      while (!terrainMap.isStepable (ran_x, ran_y)) {
        ran_x = (int)random(0, cols-1);
        ran_y = (int)random(0, rows-1);
      }
      new Chest(ran_x, ran_y, 401);
    }
  }

  public void attack(int dmg) {
    println("You cannot attack me");
  }
}

