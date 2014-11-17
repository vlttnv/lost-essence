class Hostile extends NPC {
  int hp, dmg, armor, lvl, type;

  public Hostile(String name, 
  int x, 
  int y,
  int hp, 
  int dmg, 
  int armor, 
  int lvl, 
  int type,
  int tile
    ) {
    super(name, x, y, tile);
    this.hp = hp;
    this.armor = armor;
    this.dmg = dmg;
    this.lvl = lvl;
    this.type = type;
    dynamicsPositionMap.register(this, posX, posY);
  }


  void click() {
    println("I am hostile");
  }

  void attack(int dmg) {
    println("dmg");
    hp = hp - dmg;
    if (hp <= 0) {
      kill();
    }
  }

  private void kill() {
    //do stuff
    dynamicsPositionMap.deregister(posX, posY);
    dropLoot();
  }

  private void dropLoot() {
    println("dopped some lewt");
  }
}

