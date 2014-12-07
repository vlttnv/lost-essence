class UI {

  int[] bottomBar;

  public UI() {
    bottomBar = new int[cols/2];
    for (int i=0; i<bottomBar.length; i++) {
      bottomBar[i] = 450;
    }
  }



  public void drawCharStats(Player p) {
    rect(20, 20, 400, 600);
  }

  public void drawMainMenu() {
    background(0);
    textFont(font);
    int x = WIDTH/2;
    int y = HEIGHT/2;
    textSize(46);
    textAlign(CENTER);
    text("The Last Essence", x, y-200);
    textSize(36);
    text("The Quest for the Lost Prince", x, y-160);
    
    textSize(20);
    text("As a brave warrior your quest is to find The Last Essence \n which is hidden somewhere in the Kingdom of Asherus.\n" + 
    "You will encounter various monsters and creatures \n along your way and maybe even Thalius, The Lost Prince!\n"+
    "Use your expertise with the sword and the shield \n to defeat your foes and gain power and treasures.", x, y-120);
    
    image(loadedTiles.get(123), x-62, y+55);
    image(loadedTiles.get(399), x+32, y+55);
    textSize(10);
    text("The Lost Prince", x-48, y + 100);
    text("Last Essence", x+48, y + 100);
    
    textSize(26);
    fill(204, 102, 0);
    rect(x-150,y+160, 300, 60,7);
    fill(255, 255, 255);
    text("Begin quest as a Warrior", x, y + 200);
    //image(loadedTiles.get(123), x-16, y-180);

  }

  public void drawWinMenu() {
    background(0);
    textFont(font);
    int x = WIDTH/2;
    int y = HEIGHT/2;
    textSize(46);
    textAlign(CENTER);
    text("You found The Last Essence!", x, y-200);
    image(loadedTiles.get(399), x-16, y-180);
    
    textSize(26);
    text("The kingdom of Asherus is now safe\n from Thalius, the Lost Prince and his minions.", x, y-120);
    
    textSize(16);
    text("You beat the game with a level " +p.level+ " " +p.getCharClass()+ "\n with " + p.maxHP + " health, " + p.armor + " armor, " + p.atr+ " atrribute points, doing " + p.dmg+ " damage.", x, y-40);
    
    textSize(26);
    fill(204, 102, 0);
    rect(x-100,y+160, 200, 60,7);
    fill(255, 255, 255);
    text("Restart Game", x, y + 200);
    
  }
  
  public void drawDieMenu() {
    background(0);
    textFont(font);
    int x = WIDTH/2;
    int y = HEIGHT/2;
    textSize(46);
    textAlign(CENTER);
    text("You were killed by the minions of Thalius", x, y-200);
    image(loadedTiles.get(397), x-16, y-180);
    
    //textSize(26);
    //text("The kingdom of Asherus is now safe\n from Thalius, the Lost Prince and his minions.", x, y-120);
    
    textSize(16);
    text("You lost the game with a level " +p.level+ " " +p.getCharClass()+ "\n with " + p.maxHP + " health, " + p.armor + " armor, " + p.atr+ " atrribute points, doing " + p.dmg+ " damage.", x, y-40);
    
    textSize(26);
    fill(204, 102, 0);
    rect(x-100,y+160, 200, 60,7);
    fill(255, 255, 255);
    text("Restart Game", x, y + 200);
  }

  public void drawMainUI() {
    //    textSize(22);
    //    textAlign(LEFT);
    //    text(p.name + " the " + p.getCharClass(), 10, 30); 
    //    text("HP: " + p.hp, 10, 60);
    //    text("XP: " + p.xp, 10, 90);
    //    text("Level: " + p.level, 10, 120);
    for (int i=0; i<bottomBar.length; i++) {
      if (i<p.skills.length) {
        image(loadedTiles.get(453), i*videoScale, rows*videoScale);
        if (i==0) {
          if (p.skills[i] != null) {
            image(loadedTiles.get(p.skills[i].getTile()), i*videoScale, rows*videoScale);
          }
          image(loadedTiles.get(454), i*videoScale+2, rows*videoScale+16);
        } else if (i==1) {
          if (p.skills[i] != null) {
            image(loadedTiles.get(p.skills[i].getTile()), i*videoScale, rows*videoScale);
          }
          image(loadedTiles.get(455), i*videoScale+2, rows*videoScale+16);
        } else if (i==2) {
          if (p.skills[i] != null) {
            image(loadedTiles.get(p.skills[i].getTile()), i*videoScale, rows*videoScale);
          }
          image(loadedTiles.get(456), i*videoScale+2, rows*videoScale+16);
        } else if (i==3) {
          if (p.skills[i] != null) {
            image(loadedTiles.get(p.skills[i].getTile()), i*videoScale, rows*videoScale);
          }
          image(loadedTiles.get(457), i*videoScale+2, rows*videoScale+16);
        }
      } else {
        image(loadedTiles.get(450), i*videoScale, rows*videoScale);
      }
    }
    image(loadedTiles.get(458), 4*videoScale, rows*videoScale);
    image(loadedTiles.get(459), 5*videoScale, rows*videoScale);
    image(loadedTiles.get(460), 6*videoScale, rows*videoScale);
    image(loadedTiles.get(461), 7*videoScale, rows*videoScale);

    //    for (int i=0; i<p.skills.length; i++) {
    //      if (p.skills[i] != null) {
    //        image(loadedTiles.get(p.skills[i].getTile()), i*videoScale, rows*videoScale);
    //      }
    //    }
    noStroke();
    fill(250, 33, 33);
    rect(bottomBar.length*videoScale, rows*videoScale, 100, 32);
    fill(120, 180, 10);
    float php = p.hp;
    float pmaxhp = p.maxHP;
    float percentage = (php/pmaxhp)*100;

    rect(bottomBar.length*videoScale, rows*videoScale, percentage, 32);
    fill(255, 255, 255);
    textAlign(CENTER);
    text((int)Math.round(percentage), bottomBar.length*videoScale+48, rows*videoScale+24);
  }

  public void tooltip(Dynamic d) {
    if (d.type >=0 && d.type <=102) {
      fill(0, 0, 0, 191);
      rect(5, (rows-2)*videoScale, 100, 60, 6);
      fill(255, 255, 255);
      textSize(12);
      textAlign(LEFT);
      text(d.name, 10, (rows-2)*videoScale+12);

      if (d.type == 100) {
        text("Damage " + p.dmg, 10, (rows-2)*videoScale+24);
        text("Level " + p.level, 10, (rows-2)*videoScale+36);
        text("Armor " + p.armor, 10, (rows-2)*videoScale+48);
        text("Atr " + p.atr, 10, (rows-2)*videoScale+60);
      } else if (d.type == 101) {
        text("Damage " + ((Item)d).dmg, 10, (rows-2)*videoScale+24);
        text("Armor " + ((Item)d).def, 10, (rows-2)*videoScale+36);
        text("Atr " + ((Item)d).atr, 10, (rows-2)*videoScale+48);
      } else if (d.type == 102) {
        //text("Damage " + ((Entrance)d).name, 10, (rows-2)*videoScale+24);
      } else {
        text(d.toType(), 10, (rows-2)*videoScale+24);
        text("Level " + ((Hostile)d).lvl, 10, (rows-2)*videoScale+36);
      }
    }
  }
  public void tooltip2(int i) {
    String show = "";
    if (i==0) {
      Item mainWeap = p.inventory[Item.HAND_L];
      if (mainWeap != null) {
        fill(0, 0, 0, 191);
        rect(5, (rows-2)*videoScale, 100, 60, 6);
        fill(255, 255, 255);
        textSize(12);
        textAlign(LEFT);
        text(mainWeap.name, 10, (rows-2)*videoScale+12);
        text("Damage: " + Integer.toString(mainWeap.dmg), 10, (rows-2)*videoScale+24);
      }
    } else if (i==1) {
      Item armor = p.inventory[Item.CHEST];
      if (armor != null) {
        fill(0, 0, 0, 191);
        rect(5, (rows-2)*videoScale, 100, 60, 6);
        fill(255, 255, 255);
        textSize(12);
        textAlign(LEFT);
        text(armor.name, 10, (rows-2)*videoScale+12);
        text("Armor: " + Integer.toString(armor.def), 10, (rows-2)*videoScale+24);
        text("Attribute: " + Integer.toString(armor.atr), 10, (rows-2)*videoScale+36);
      }
    } else if (i==3) {
      Item shield = p.inventory[Item.HAND_R];
      if (shield != null) {
        fill(0, 0, 0, 191);
        rect(5, (rows-2)*videoScale, 100, 60, 6);
        fill(255, 255, 255);
        textSize(12);
        textAlign(LEFT);
        text(shield.name, 10, (rows-2)*videoScale+12);
        text("Armor: " + Integer.toString(shield.def), 10, (rows-2)*videoScale+24);
        text("Attribute: " + Integer.toString(shield.atr), 10, (rows-2)*videoScale+36);
      }
    } else if (i==2) {
      Item helm = p.inventory[Item.HEAD];
      if (helm != null) {
        fill(0, 0, 0, 191);
        rect(5, (rows-2)*videoScale, 100, 60, 6);
        fill(255, 255, 255);
        textSize(12);
        textAlign(LEFT);
        text(helm.name, 10, (rows-2)*videoScale+12);
        text("Armor: " + Integer.toString(helm.def), 10, (rows-2)*videoScale+24);
        text("Attribute: " + Integer.toString(helm.atr), 10, (rows-2)*videoScale+36);
      }
    }
  }
}

