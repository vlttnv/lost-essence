class Friendly extends NPC {

  public Friendly(String name, 
  int x, 
  int y, 
  int tile
    ) {
    super(name, x, y, tile);
  }

  void click() {
    println("I am friendly");
  }

  void attack(int dmg) {
    click();
  }
}

