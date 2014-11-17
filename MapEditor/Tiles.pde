class Tiles {

  private PImage[] tiles;

  public Tiles() {

    // x<100 are static map tiles
    // 100<x<200 player, NPCs and dynamic items
    // x>200 other
    tiles = new PImage[300];
    try {
      for (int i=0; i<300; i++) {
        tiles[i] = loadImage(i + ".png");
      }
    } 
    catch (Exception e) {
    }
  }
  public PImage get(int i) {
    return tiles[i];
  }
}

