class Entrance extends Dynamic {
  int newX;
  int newY;
  String map;

  public Entrance(String name, 
  int x, 
  int y, 
  int tile, 
  int newX, 
  int newY, 
  String map) {
    super(name, x, y, tile);
    dynamicsPositionMap.register(this, posX, posY);
    this.newX = newX;
    this.newY = newY;
    this.map = map;
  }

  public void click() {
    println("I am a " + name);



    
    terrainMap = new Map(loadedTiles, map);
    dynamicsPositionMap =  new PositionMap();
    p.posX = newX;
    p.posY = newY;
    new Entrance("Portal", p.posX,p.posY+1, 150, 11, 12, "starting.map");
    new Entrance("Portal", (int)random(0, cols-1), (int)random(0, rows-1), 150, 11, 12, "dungeon.map");
    
    dynamicsPositionMap.register(p, newX, newY);
    for (int i=0; i<15; i++) {
      new Hostile("Z" +i, (int)random(0, cols-1), (int)random(0, rows-1), 10, 5, 10, 1, 1, 110);
    }
    p.teleportPlayer(newX, newY);
  }

  public void attack(int dmg) {
    println("You cannot attack me");
  }
}

