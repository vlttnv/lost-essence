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
        
        
        
        Map poppedMap = mapStack.get(mapStack.size()-1);
        
        mapStack.remove(mapStack.size()-1);
        for (int i=0; i<mapStack.size(); i++){
         println(">>>>>>>> " + mapStack.get(i).getMapName()); 
        }
        println("insinde up");

        dynamicsPositionMap =  new PositionMap();
        terrainMap = poppedMap;
        
        String terMapName = mapStack.get(mapStack.size()-1).getMapName();
        if (terMapName == null) {
          terMapName = "random_dungeon";
        }

        p.posX = newX;
        p.posY = newY;

        new Entrance("Exit", p.posX, p.posY+1, 150, 11, 12, terMapName, D_UP);
        //new Entrance("Entrance", p.posX,p.posY+2, 150, 11, 12, "random_dungeon", D_DOWN);

        dynamicsPositionMap.register(p, newX, newY);
        p.teleportPlayer(newX, newY);
      } else if (direction == D_DOWN) {
        println("insinde down");
        String terMapName = terrainMap.getMapName();
        if (terMapName == null) {
          terMapName = "random_dungeon";
        }
        mapStack.add(terrainMap);
        for (int i=0; i<mapStack.size(); i++){
         println(">>>>>>>> " + mapStack.get(i).getMapName()); 
        }
        println("insinde up");
        dynamicsPositionMap =  new PositionMap();
        terrainMap = new Map(1);
        p.posX = newX;
        p.posY = newY;

        // push current on stack
        new Entrance("Exit", p.posX, p.posY+1, 150, 11, 12, terMapName, D_UP);
        new Entrance("Entrance", (int)random(0, cols-1), (int)random(0, rows-1), 150, 11, 12, "random_dungeon", D_DOWN);

        dynamicsPositionMap.register(p, newX, newY);
        //    for (int i=0; i<15; i++) {
        //      new Hostile("Z" +i, (int)random(0, cols-1), (int)random(0, rows-1), 10, 5, 10, 1, 1, 110);
        //    }
        p.teleportPlayer(newX, newY);
      }
    } else {
      println("insinde else");
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

  public void attack(int dmg) {
    println("You cannot attack me");
  }
}

