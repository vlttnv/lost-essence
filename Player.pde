class Player {
  final int D_LEFT = 0;
  final int D_UP = 1;
  final int D_RIGHT = 2;
  final int D_DOWN = 3;
  int posX, posY;

  String name;
  int level;
  int charClass;
  int race;
  int xp;
  int hp;
  int dmg;
  
  int direction_image;
  
  Tiles tiles;

  public Player(Tiles tiles) {
    this.tiles = tiles;
    this.posX = 0;
    this.posY = 0;
    direction_image = 0;
  }

  public void drawPlayer() {
    //rect((posX * 32) +2, (posY * 32) +2, 28, 28);
    if (direction_image == 0) {
      image(tiles.warrior_l, (posX * 32), (posY * 32));
    } else if (direction_image == 1) {
      image(tiles.warrior_r, (posX * 32), (posY * 32));
    }
    
  }

  public void movePlayer(int direction) {
    switch (direction) {
    case D_UP:    
      posY -= 1;
      break;
    case D_DOWN:  
      posY += 1;
      break;
    case D_LEFT:  
      posX -= 1;
      direction_image = 0;
      break;
    case D_RIGHT:  
      posX += 1;
      direction_image = 1;
      break;
    }
  }
  
  public void teleportPlayer(int x, int y) {
    posX = x / 32;
    posY = y/ 32;
  }
}

