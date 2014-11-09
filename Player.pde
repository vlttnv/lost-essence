class Player extends Dynamic {
  final int D_LEFT = 0;
  final int D_UP = 1;
  final int D_RIGHT = 2;
  final int D_DOWN = 3;
  //public int posX, posY;

  String name;
  int level;
  int charClass;
  int race;
  int xp;
  int hp;
  int dmg;




  public Player(String name, int posX, int posY, int tileLeft, int tileRight) {
    this.name = name;
    this.posX = posX;
    this.posY = posY;
    this.tileLeft = tileLeft;
    this.tileRight = tileRight;
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

      direction_image = 0;
      break;
    case D_RIGHT:  
      if (terrainMap.isStepable(posX+1, posY)) {
        direction_image = 1;
        dynamicsPositionMap.update(posX, posY, posX+1, posY);
        posX += 1;
      }

      direction_image = 1;
      break;
    }
  }

  public void teleportPlayer(int x, int y) {
    posX = x / 32;
    posY = y / 32;
  }

  public void shoot(int x, int y) {
    line(posX*32, posY*32, x, y);
  }

  public void click() {
  }
  
  public void attack(int dmg) {
    
  }
}

