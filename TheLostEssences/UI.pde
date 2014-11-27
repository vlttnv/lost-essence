class UI {

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
    fill(255, 255,255);
    text(mouseX + " " + mouseY, indent, 20);
    text("Click in this applet and type. \nHit return to save what you typed. ", indent, 40);
    //text(typing, indent, 90);
    fill(204, 102, 0);
    rect(indent, 100, 100, 55, 7);
    fill(255, 255,255);
    text("Warior", indent*2, 134);
    fill(204, 102, 0);
    rect(indent, 160, 100, 55, 7);
    fill(255, 255,255);
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
  }
}

