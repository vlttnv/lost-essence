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
    int indent = 25;

    // Set the font and fill for text
    textFont(font);
    //fill(0);

    // Display everything
    fill(255, 255, 255);
    text(mouseX + " " + mouseY, indent, 20);
    text("Click in this applet and type. \nHit return to save what you typed. ", indent, 40);
    //text(typing, indent, 90);
    fill(204, 102, 0);
    rect(indent, 100, 100, 55, 7);
    fill(255, 255, 255);
    text("Warior", indent*2, 134);
    fill(204, 102, 0);
    rect(indent, 160, 100, 55, 7);
    fill(255, 255, 255);
    text("Wizard", indent*2, 194);
    rect(indent, 220, 100, 55, 7);
  }

  public void drawMainUI() {
    textSize(22);
    textAlign(LEFT);
    text(p.name + " the " + p.getCharClass(), 10, 30); 
    text("HP: " + p.hp, 10, 60);
    text("XP: " + p.xp, 10, 90);
    text("Level: " + p.level, 10, 120);
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
    if (d.type >=0 && d.type <=100) {
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
    }
  }
}

