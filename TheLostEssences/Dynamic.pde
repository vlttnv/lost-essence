/**
 Represents all "dynamic" entities in the game. Those include
 all the objects and NPC that the player can interact with and the player himeslf.
 Polymorphism is used to access certain dynamics, like Hostile and Item in the
 Dynamics Position Map
 */
abstract class Dynamic {
  String name;
  int posX, posY;  
  int tile;
  int type;

  public Dynamic(String name, int x, int y, int tile, int type) {
    this.name = name;
    posX = x;
    posY = y;
    this.tile = tile;
    this.type = type;
  }

  // Every Dynamic should have those
  abstract void click();
  abstract void attack(int dmg);

  int getTileNumber() {
    return tile;
  }

  public int getX() {
    return posX;
  }
  public int getY() {
    return posY;
  }

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

