/**
 Represent decoration tiles that are not map tiles.
 */
class Prop extends Dynamic {
  int newX;
  int newY;
  String map;

  public Prop( 
  int x, 
  int y, 
  int tile) {
    super("", x, y, tile, -1);
    dynamicsPositionMap.register(this, posX, posY);
  }

  public void click() {
  }

  public void attack(int dmg) {
  }
}

