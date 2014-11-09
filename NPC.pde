abstract class NPC extends Dynamic {
  public NPC(String name, int x, int y, int tileLeft, int tileRight) {
    this.name = name;
    posX = x;
    posY = y;
    this.tileLeft = tileLeft;
    this.tileRight = tileRight;
  }

  void click() {
    println("non");
  }
  
  abstract void attack(int dmg);
}

