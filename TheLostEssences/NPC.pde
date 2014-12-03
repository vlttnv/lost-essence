abstract class NPC extends Dynamic {
  public NPC(String name, int x, int y, int tile, int type) {
        super(name, x, y, tile, type);
  }

  void click() {
    println("non");
  }
  
  abstract void attack(int dmg);
}

