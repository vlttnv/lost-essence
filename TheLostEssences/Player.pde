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
    inventory[0] = 300;
    inventory[1] = 301;
    inventory[2] = 302;
    inventory[3] = 303;
    inventory[4] = 304;
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
}

