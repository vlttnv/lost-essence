class UI {

  public void drawCharStats(Player p) {
    rect(20, 20, 400, 600);
  }

  public void drawMainMenu() {
    background(255);
    int indent = 25;

    // Set the font and fill for text
    textFont(font);
    fill(0);

    // Display everything
    text("Click in this applet and type. \nHit return to save what you typed. ", indent, 40);
    text(typing, indent, 90);
  }
}

