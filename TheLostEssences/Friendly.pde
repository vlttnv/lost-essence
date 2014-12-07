class Friendly extends NPC {


  public Friendly(String name, 
  int x, 
  int y, 
  int tile
    ) {
    super(name, x, y, tile, -1);
    makeFriendly();
    dynamicsPositionMap.register(this, posX, posY);
    friends.add(this);
  }

  void click() {
  }

  void attack(int dmg) {
    click();
  }

  private void makeFriendly() {
    int which = (int)Math.round(random(124, 128));
    if (which == 124) {
      this.tile = 124;
    } else if (which == 125) {
      this.tile = 125;
    } else if (which == 126) {
      this.tile = 126;
    } else if (which == 127) {
      this.tile = 127;
    } else if (which == 128) {
      this.tile = 128;
    }
  }

  public void moveRandom() {
    int toMove = (int)Math.round(random(100));

    if (toMove >75) {
      int dir = (int)random(100);
      if (dir <= 25) {
        if (terrainMap.isStepable(posX, posY -1)) {
          dynamicsPositionMap.update(posX, posY, posX, posY-1);
          posY -= 1;
        }
      } else if (dir <= 50 && dir > 25) {
        if (terrainMap.isStepable(posX, posY+1)) {
          dynamicsPositionMap.update(posX, posY, posX, posY+1);
          posY += 1;
        }
      } else if (dir <= 75 && dir > 50) {
        if (terrainMap.isStepable(posX-1, posY)) {
          dynamicsPositionMap.update(posX, posY, posX-1, posY);
          posX -= 1;
        }
      } else if (dir <= 100 && dir >75) {
        if (terrainMap.isStepable(posX+1, posY)) {
          dynamicsPositionMap.update(posX, posY, posX+1, posY);
          posX += 1;
        }
      }
    }
  }
}

