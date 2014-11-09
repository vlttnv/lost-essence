abstract class Dynamic {
  String name;
  int posX, posY;  
  int tileLeft;
  int tileRight;
  int direction_image;

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
}

