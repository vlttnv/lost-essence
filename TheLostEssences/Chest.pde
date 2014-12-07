class Chest extends Dynamic {
  int newX;
  int newY;
  String map;
  boolean special;

  public Chest( 
  int x, 
  int y, 
  int tile, 
  boolean special) {
    super("", x, y, tile, -1);
    this.special = special;
    dynamicsPositionMap.register(this, posX, posY);
  }

  public void click() {
    if (!special) {


      dynamicsPositionMap.deregister(posX, posY);
      Item im = null;
      if (p.charClass == 0) {
        int slot = (int)Math.round(random(100));
        if (slot < 25) {
          int model = (int)Math.round(random(316, 318));
          int dmg = (int)Math.round(random(4, 8));
          im = new Item("Sword", posX, posY, model, Item.HAND_L, dmg*p.level, 0, 0);
        } else if (slot < 50 && slot >=25) {
          int model = (int)Math.round(random(319, 321));
          int def = (int)Math.round(random(4, 10));
          int atr = (int)Math.round(random(4, 10));
          im = new Item("Shield", posX, posY, model, Item.HAND_R, 0, def*p.level, atr);
        } else if (slot < 75 && slot >=50) {
          int model = (int)Math.round(random(313, 315));
          int def = (int)Math.round(random(4, 10));
          int atr = (int)Math.round(random(4, 10));
          im = new Item("Armor", posX, posY, model, Item.CHEST, 0, def*p.level, atr*p.level);
        } else if (slot < 100 && slot >=75) {
          int model = (int)Math.round(random(310, 312));
          int def = (int)Math.round(random(1, 4));
          int atr = (int)Math.round(random(1, 4));
          im = new Item("Helm", posX, posY, model, Item.HEAD, 0, def*p.level, atr*p.level);
        }
      }
    } else {
      dynamicsPositionMap.deregister(posX, posY);
      Item im = new Item("Last Essence", posX, posY, 399, Item.ES, 9000, 9000, 9000);
      ;
    }
  }

  public void attack(int dmg) {
  }
}

