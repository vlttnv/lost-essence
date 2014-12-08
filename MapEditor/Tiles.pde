class Tiles {

  private PImage[] tiles;

  public Tiles() {

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

