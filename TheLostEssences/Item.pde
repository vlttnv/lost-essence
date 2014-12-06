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
  int atr;

  public Item(String name, int x, int y, int tile, int slot, int dmg, int def, int atr) {
    super(name, x, y, tile, 101);
    this.slot= slot;
    this.dmg = dmg;
    this.atr = atr;
    this.def = def;
    if (x >0 || y>0) {
      dynamicsPositionMap.register(this, posX, posY);
    }
    
  }

  public void click() {
    dynamicsPositionMap.deregister(posX, posY);
    p.equip(this);
    drops.remove(this);
  }

  public void attack(int i) {
  }
}

