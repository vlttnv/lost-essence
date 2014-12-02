class Player extends Dynamic {
  final int D_LEFT = 0;
  final int D_UP = 1;
  final int D_RIGHT = 2;
  final int D_DOWN = 3;
  //public int posX, posY;
  public int level;
  int charClass;
  int race;
  int xp;
  int hp;
  int maxHP;
  int dmg;
  int armor;
  int atr;

  Skill[] skills;
  Item[] inventory;




  public Player(String name, int posX, int posY, int tile, int charClass) {
    super(name, posX, posY, tile);
    skills = new Skill[4];
    inventory = new Item[10];
    //inventory[0] = 302; //LEFT
    //inventory[1] = 304; //RIGHT
    //inventory[2] = 300; //CHEST 
    //inventory[3] = 300; //HEAD
    //inventory[4] = 301; //LEGS
    //inventory[5] = 303; //FEET
    if (charClass == 0) {
    }
    dynamicsPositionMap.register(this, posX, posY);
    //dynamicsRenderMap.set(posX, posY, 100);
    direction_image = 0;
  }



  public void movePlayer(int direction) {

    switch (direction) {
    case D_UP:
      if (terrainMap.isStepable(posX, posY -1)) {
        dynamicsPositionMap.update(posX, posY, posX, posY-1);
        posY -= 1;
      } else {
        String dir = terrainMap.getMapDirection(Map.NORTH);
        if (dir != null) {
          if (!dir.equals("0") && posY == 0) {
            posY = rows - 1;
            dynamicsPositionMap =  new PositionMap();
            dynamicsPositionMap.register(p, posX, posY);
            terrainMap = new Map(dir);
          }
        }
      }
      break;
    case D_DOWN: 
      if (terrainMap.isStepable(posX, posY+1)) {
        dynamicsPositionMap.update(posX, posY, posX, posY+1);
        posY += 1;
      } else {
        String dir = terrainMap.getMapDirection(Map.SOUTH);
        if (dir != null) {
          if (!dir.equals("0") && posY == rows-1) {
            posY = 0;
            dynamicsPositionMap =  new PositionMap();
            dynamicsPositionMap.register(p, posX, posY);
            terrainMap = new Map(dir);
          }
        }
      }

      break;
    case D_LEFT: 
      if (terrainMap.isStepable(posX-1, posY)) {
        direction_image = 0;
        dynamicsPositionMap.update(posX, posY, posX-1, posY);
        posX -= 1;
      }
      break;
    case D_RIGHT:  
      if (terrainMap.isStepable(posX+1, posY)) {
        direction_image = 1;
        dynamicsPositionMap.update(posX, posY, posX+1, posY);
        posX += 1;
      }
      break;
    }
  }

  public void teleportPlayer(int x, int y) {
    if (x != posX || y != posY) {
      dynamicsPositionMap.update(posX, posY, x, y);
      posX = x;
      posY = y;
    }
  }

  public void shoot(int x, int y) {
    line(posX*32, posY*32, x, y);
  }

  public void click() {
  }

  public void attack(int dmg) {
    hp = hp - (abs(dmg-armor));
    if (hp <0) {
      //p = null;
    }
  }

  public void drawItems() {
    for (int i=0; i<inventory.length; i++) {
      if (inventory[i] != null) {
        image(loadedTiles.get(inventory[i].tile), posX*videoScale, posY*videoScale);
      }
    }
  }

  public String getCharClass() {
    if (charClass == 0) {
      return "Warrior";
    } else if (charClass == 1) {
      return "Wizard";
    } else {
      return "peasant";
    }
  }

  public void setUpWarrior() {
    // starting base 10 hp, 4str, 4armor


      charClass = 0;
    level = 1;
    armor = 2;
    atr = 4;
    hp = maxHP = 12 + atr;
    this.equip(new Item("Sword", -10, - 10, 302, Item.HAND_L, 4));
    skills[0] = new WeaponSwing(451);
    skills[1] = new Charge(452);
  }

  public void setOrc() {
    tile = 101;
  }
  public void giveXP(int i) {
    xp += i;
  }

  public void equip(Item item) {
    inventory[item.slot] = item;
  }
}

