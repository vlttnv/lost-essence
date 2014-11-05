class NPC {
  boolean friendly;
  final int D_LEFT = 0;
  final int D_UP = 1;
  final int D_RIGHT = 2;
  final int D_DOWN = 3;
  int posX, posY;

  String name;
  int level;
  int hp;
  int dmg;

  int direction_image;

  public NPC() {
    level = 1;
    hp = 20;
    dmg = 5;
  }
  
  
}

