class Item extends Dynamic {
  static public final int HAND_L = 0;
  static public final int HAND_R = 1;
  static public final int CHEST = 2;
  static public final int HEAD = 3;
  static public final int LEGS = 4;
  static public final int FEET = 5;

  int dmg;
  int def;
  int slot;

  public Item(String name, int x, int y, int tile, int slot) {
    super(name, x, y, tile);
    this.slot= slot;
    dynamicsPositionMap.register(this, posX, posY);
  }

  public void click() {
    dynamicsPositionMap.deregister(posX, posY);
    p.equip(tile,slot);
    drops.remove(this);
  }
  
  public void attack(int i) {
    
  }
}

