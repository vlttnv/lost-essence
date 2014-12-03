abstract class Dynamic {
  String name;
  int posX, posY;  
  int tile;
  int direction_image;
  int type;

  public Dynamic(String name, int x, int y, int tile, int type) {
    this.name = name;
    posX = x;
    posY = y;
    this.tile = tile;
    this.type = type;
  }

  abstract void click();
  abstract void attack(int dmg);

  String getName() {
    return name;
  }

  int getTileNumber() {
    return tile;
  }

  public String getDName() { 
    return name;
  }
  public int getX() {
    return posX;
  }
  public int getY() {
    return posY;
  }
  public static final int UNDEAD = 0;
  public static final int UNIQUE = 1;
  public static final int DEMON = 2;
  public static final int HUMANOID = 3;

  public String toType() {
    if (type == Hostile.UNDEAD) {
      return "Undead";
    } else if (type == Hostile.UNIQUE) {
      return "Unique";
    } else if (type == Hostile.DEMON) {
      return "Demon";
    } else if (type == Hostile.HUMANOID) {
      return "Humanoid";
    } else if (type == -1) {
      return "Prop";
    } else if (type == 100) {
      return "Player";
    }
    return "Unknown";
  }
}

