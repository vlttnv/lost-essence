class Friendly extends NPC {

  public Friendly(String name, 
  int x, 
  int y, 
  int tileLeft,
  int tileRigjt
    ) {
    super(name, x, y, tileLeft, tileRigjt);
  }

  void click() {
    println("I am friendly");
  }

  void attack(int dmg) {
    click();
  }
}

