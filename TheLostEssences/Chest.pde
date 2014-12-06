class Chest extends Dynamic {
  int newX;
  int newY;
  String map;

  public Chest( 
  int x, 
  int y, 
  int tile) {
    super("", x, y, tile, -1);
    dynamicsPositionMap.register(this, posX, posY);
  }

  public void click() {
    dynamicsPositionMap.deregister(posX, posY);
    Item im = null;
    if (p.charClass == 0) {
      int slot = (int)Math.round(random(100));
      if (slot < 25) {
        im = new Item("Sword", posX, posY, 305, Item.HAND_L, 4, 0, 0);
      } else if (slot < 50 && slot >=25) {
        im = new Item("Shield", posX, posY, 304, Item.HAND_R, 0, 4, 1);
      } else if (slot < 75 && slot >=50) {
        im = new Item("Armor", posX, posY, 300, Item.CHEST, 0, 3, 3);
      } else if (slot < 100 && slot >=75) {
        im = new Item("Helm", posX, posY, 306, Item.HEAD, 0, 1, 2);
      }
    }
  }

  public void attack(int dmg) {
  }
}

