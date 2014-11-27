class Player extends Dynamic {
  final int D_LEFT = 0;
  final int D_UP = 1;
  final int D_RIGHT = 2;
  final int D_DOWN = 3;
  //public int posX, posY;
  int level;
  int charClass;
  int race;
  int xp;
  int hp;
  int dmg;

  Skill[] skills;
  int[] inventory;




  public Player(String name, int posX, int posY, int tile, int charClass) {
    super(name, posX, posY, tile);
    skills = new Skill[4];
    inventory = new int[10];
    inventory[0] = 302; //LEFT
    inventory[1] = 304; //RIGHT
    inventory[2] = 300; //CHEST 
    inventory[3] = 300; //HEAD
    inventory[4] = 301; //LEGS
    inventory[5] = 303; //FEET
    if (charClass == 0) {
      skills[0] = new WeaponSwing();
      skills[1] = new Charge();
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
      }
      break;
    case D_DOWN: 
      if (terrainMap.isStepable(posX, posY+1)) {
        dynamicsPositionMap.update(posX, posY, posX, posY+1);
        posY += 1;
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
  }

  public void drawItems() {
    for (int i=0; i<inventory.length; i++) {
      if (inventory[i] != 0) {
        image(loadedTiles.get(inventory[i]), posX*videoScale, posY*videoScale);
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
    charClass = 0;
    hp = 12;
    level = 1;
  }
  
  public void setOrc() {
    tile = 101;
  }
  public void giveXP(int i) {
    xp += i;
  }
  
  public void equip(int item, int slot) {
    inventory[slot] = item;
  }
}

