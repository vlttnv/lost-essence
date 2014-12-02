class Hostile extends NPC {
  int hp, dmg, armor, lvl, type;

  public Hostile(String name, 
  int x, 
  int y, 
  int type) {
    super("", x, y, 110);
    this.type = type;
    if (type == 0) {
      makeNormal();
    }

    dynamicsPositionMap.register(this, posX, posY);
    hosts.add(this);
  }


  void click() {
    println("I am hostile");
  }

  void attack(int dmg) {

    hp = hp - (abs(dmg-armor));
    println("hp: " + hp);
    p.attack(this.dmg);
    if (hp <= 0) {
      kill();
    }
  }

  private void kill() {
    //do stuff
    dynamicsPositionMap.deregister(posX, posY);
    dropLoot();
    hosts.remove(this);
    p.giveXP(lvl);
  }

  private void dropLoot() {
    drops.add(new Item("Sword", posX, posY, 305, Item.HAND_L));
    println("dopped some lewt");
  }

  private void makeNormal() {
    lvl = p.level;
    hp = 10;
    for (int i=lvl; i>=0; i--) {
      hp = hp + i;
    }
    armor = (hp * 10) / 100;
    dmg = 4;
    for (int i=lvl; i>=0; i-=2) {
      dmg = dmg + i;
    }
  }

  public void moveRandom() {
    if (abs(posY - p.posY) < 6 && abs(posX - p.posX) < 6) {


      boolean dr = true;
      PVector start = new PVector(posX, posY);
      PVector end = new PVector(p.posX, p.posY);
      PVector middle;
      for (float z=0.0; z<=1; z=z+0.1) {
        middle = PVector.lerp(start, end, z);
        if (((int)middle.y>=0 && (int)middle.y<rows) && ((int)middle.x>=0 && (int)middle.x<cols)) {
          if (terrainMap.get((int)middle.x, (int)middle.y) > 100 && dr) {
            dr = false;
          }
        }
      }
      if (dr) {
        println("lol");
        middle = PVector.lerp(start, end, 0.1);
        if ((int)middle.x != p.posX && (int)middle.y != p.posY) {
          dynamicsPositionMap.update(posX, posY, (int)middle.x, (int)middle.y);

          posX = (int)middle.x;
          posY = (int)middle.y;
          println("X " + posX);
          println("Y " + posY);
        } else {
        }
      }
    } else {

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
          direction_image = 0;
          dynamicsPositionMap.update(posX, posY, posX-1, posY);
          posX -= 1;
        }
      } else if (dir <= 100 && dir >75) {
        if (terrainMap.isStepable(posX+1, posY)) {
          direction_image = 1;
          dynamicsPositionMap.update(posX, posY, posX+1, posY);
          posX += 1;
        }
      }
    }
  }


  private void makeBoss() {
  }
}

