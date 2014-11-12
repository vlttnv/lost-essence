abstract class NPC extends Dynamic {
  public NPC(String name, int x, int y, int tileLeft, int tileRight) {
        super(name, x, y, tileLeft, tileRight);
  }

  void click() {
    println("non");
  }
  
  abstract void attack(int dmg);
}

