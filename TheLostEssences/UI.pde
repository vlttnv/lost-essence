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
}

