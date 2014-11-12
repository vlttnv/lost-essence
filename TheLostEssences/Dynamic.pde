abstract class Dynamic {
  String name;
  int posX, posY;  
  int tileLeft;
  int tileRight;
  int direction_image;
  
  public Dynamic(String name, int x, int y, int tileLeft, int tileRight) {
    this.name = name;
    posX = x;
    posY = y;
    this.tileLeft = tileLeft;
    this.tileRight = tileRight;
  }

  abstract void click();
  abstract void attack(int dmg);

  String getName() {
    return name;
  }

  int getTileNumber() {
    if (direction_image == 0) {
      return  tileLeft;
    } else {
      return tileRight;
    }
  }
  
  public String getnName() { 
    return name;
  }
  public int getX() {
    return posX;
  }
  public int getY() {
   return posY; 
  }
}

