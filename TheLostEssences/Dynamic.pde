abstract class Dynamic {
  String name;
  int posX, posY;  
  int tile;
  int direction_image;
  
  public Dynamic(String name, int x, int y, int tile) {
    this.name = name;
    posX = x;
    posY = y;
    this.tile = tile;
  }

  abstract void click();
  abstract void attack(int dmg);

  String getName() {
    return name;
  }

  int getTileNumber() {
      return tile;

  }
  
  public String getnName() { 
    return name;
  }
  public int getX() {
    return posX;
  }
  public int getY() {
   return posY; 
  }
}

