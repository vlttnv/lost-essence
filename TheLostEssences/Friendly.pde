class Friendly extends NPC {

  public Friendly(String name, 
  int x, 
  int y, 
  int tile
    ) {
    super(name, x, y, tile, 10);
  }

  void click() {
    println("I am friendly");
  }

  void attack(int dmg) {
    click();
  }
}

