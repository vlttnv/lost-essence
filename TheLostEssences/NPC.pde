abstract class NPC extends Dynamic {
  public NPC(String name, int x, int y, int tile) {
        super(name, x, y, tile);
  }

  void click() {
    println("non");
  }
  
  abstract void attack(int dmg);
}

