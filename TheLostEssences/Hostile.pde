class Hostile extends NPC {
  int hp, dmg, armor, lvl, type, maxHP;
  int xpToGive;
  public static final int UNDEAD = 0;
  public static final int UNIQUE = 3;
  public static final int DEMON = 1;
  public static final int HUMANOID = 2;


  public Hostile(String name, 
  int x, 
  int y, 
  int type) {
    super("", x, y, 110, type);
    this.type = type;
    if (type == 0) {
      makeUndead();
    } else if (type == DEMON) {
      makeDemon();
    } else if (type == HUMANOID) {
      makeHumanoid();
    } else if (type == UNIQUE) {
      makeUnique();
    }

    dynamicsPositionMap.register(this, posX, posY);
    hosts.add(this);
  }


  void click() {
    println("I am hostile");
  }

  void attack(int dm) {
    int trueDamage = dm-armor;
    if (trueDamage<=0) {
      trueDamage = 0;
    }
    hp = hp - trueDamage;

    println("hp: " + hp);
    if (hp <= 0) {
      kill();
    }
  }

  private void kill() {
    //do stuff
    dynamicsPositionMap.deregister(posX, posY);
    hosts.remove(this);
    p.giveXP(xpToGive);
    dropLoot();
  }

  private void dropLoot() {
    Item im = null;
    if (type == UNIQUE) {
    } else {
      int roll = (int)Math.round(random(100));

      if (roll>=0) {
        // head, left, right, chest
        if (p.charClass == 0) {
          int slot = (int)Math.round(random(100));
          if (slot < 25) {
            im = new Item("Sword", posX, posY, 305, Item.HAND_L, 4, 0, 0);
          } else if (slot < 50 && slot >=25) {
            im = new Item("Shield", posX, posY, 304, Item.HAND_R, 0, 4, 1);
          } else if (slot < 75 && slot >=50) {
            im = new Item("Armor", posX, posY, 300, Item.CHEST, 0, 3, 3);
          } else if (slot < 100 && slot >=75) {
            im = new Item("Helm", posX, posY, 306, Item.HEAD, 0, 1, 2);
          }
        } else {
        }
      }
      if (im != null) {
        drops.add(im);
      }
      println("dopped some lewt");
    }
  }

  private void makeUndead() {
    name = "Skeleton Bat";
    xpToGive = lvl * 2;
    tile = 111;
    lvl = p.level;
    hp = maxHP = 10;
    dmg = 1;
    armor = 1;

    for (int i=lvl; i>=0; i--) {
      hp = hp + i*10;
    }

    hp *= lvl*0.5;
    maxHP = hp;
    armor += armor*lvl;
    dmg += p.hp/10;
    for (int i=lvl; i>=0; i-=2) {
      dmg = dmg + i;
    }
  }

  private void makeDemon() {
    name = "Soul Eater";
    xpToGive = lvl * 2;
    tile = 114;
    lvl = p.level;
    hp = maxHP = 15;
    dmg = 2;
    armor = 1;

    for (int i=lvl; i>=0; i--) {
      hp = hp + i*10;
    }

    hp *= lvl*0.5;
    maxHP = hp;
    armor += armor*lvl;
    dmg += p.hp/10;
    for (int i=lvl; i>=0; i-=2) {
      dmg = dmg + i;
    }
  }

  private void makeHumanoid() {
    name = "Gnoll";
    xpToGive = lvl * 2;
    tile = 117;
    lvl = p.level;
    hp = maxHP = 20;
    dmg = 1;
    armor = 2;

    for (int i=lvl; i>=0; i--) {
      hp = hp + i*10;
    }

    hp *= lvl*0.5;
    maxHP = hp;
    armor += armor*lvl;
    dmg += p.hp/10;
    for (int i=lvl; i>=0; i-=2) {
      dmg = dmg + i;
    }
  }

  private void makeUnique() {
    int which = (int)Math.round(random(120, 123));
    if (which == 120) {
      xpToGive = lvl * 2;
      name = "Azmodeus";
      tile = 120;

      lvl = p.level+4;
      hp = maxHP = 35;
      dmg = 4;
      armor = 4;

      for (int i=lvl; i>=0; i--) {
        hp = hp + i*10;
      }

      hp *= lvl*0.5;
      maxHP = hp;
      armor += armor*lvl;
      dmg += p.hp/10;
      for (int i=lvl; i>=0; i-=2) {
        dmg = dmg + i;
      }
    } else if (which == 121) {
      name = "Skeleton King";
      xpToGive = lvl * 2;
      tile = 121;

      lvl = p.level;
      hp = maxHP = 35;
      dmg = 3;
      armor = 3;

      for (int i=lvl; i>=0; i--) {
        hp = hp + i*10;
      }

      hp *= lvl*0.5;
      maxHP = hp;
      armor += armor*lvl;
      dmg += p.hp/10;
      for (int i=lvl; i>=0; i-=2) {
        dmg = dmg + i;
      }
    } else if (which == 122) {
      name = "Hellios";
      tile = 122;
      xpToGive = lvl * 2;

      lvl = p.level;
      hp = maxHP = 50;
      dmg = 6;
      armor = 0;

      for (int i=lvl; i>=0; i--) {
        hp = hp + i*10;
      }

      hp *= lvl*0.5;
      maxHP = hp;
      armor += armor*lvl;
      dmg += p.hp/10;
      for (int i=lvl; i>=0; i-=2) {
        dmg = dmg + i;
      }
    } else if (which == 123) {
      name = "The Lost Prince";
      tile = 123;
      xpToGive = lvl * 2;

      lvl = p.level;
      hp = maxHP = 50;
      dmg = 22;
      armor = 10;

      for (int i=lvl; i>=0; i--) {
        hp = hp + i*10;
      }

      hp *= lvl*0.5;
      maxHP = hp;
      armor += armor*lvl;
      dmg += p.hp/10;
      for (int i=lvl; i>=0; i-=2) {
        dmg = dmg + i;
      }
      int ran_x = (int)random(0, cols-1);
      int ran_y = (int)random(0, rows-1);
      while (!terrainMap.isStepable (ran_x, ran_y)) {
        ran_x = (int)random(0, cols-1);
        ran_y = (int)random(0, rows-1);
      }
      new Chest(ran_x, ran_y, 401,true);
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
        start = new PVector((posX*videoScale)+16, (posY*videoScale)+14);
        end = new PVector((p.posX*videoScale)+14, (p.posY*videoScale)+14);
        middle = PVector.lerp(start, end, 0.3);

        int moveToX = (int)Math.round(middle.x)/videoScale;
        int moveToY = (int)Math.round(middle.y)/videoScale;

        if (abs(posY - p.posY) <= 1 && abs(posX - p.posX) <= 1) {
          p.attack(this.dmg);
        }

        if (moveToX != p.posX ||  moveToY != p.posY) {
          println(terrainMap.isStepable(moveToX, moveToY));
          if (terrainMap.isStepable(moveToX, moveToY)) {

            dynamicsPositionMap.update(posX, posY, moveToX, moveToY);

            posX = moveToX;
            posY = moveToY;
          }
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


  private void makeBoss() {
  }
}

