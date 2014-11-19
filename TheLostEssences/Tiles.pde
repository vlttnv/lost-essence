class Tiles {
  PImage stone;
  PImage water;
  PImage water_t_l;
  PImage water_t;
  PImage water_t_r;
  PImage water_r;
  PImage water_b_r;
  PImage water_b;
  PImage water_b_l;
  PImage water_l;
  PImage water_c_b_l;
  PImage water_c_b_r;
  PImage water_c_t_l;
  PImage water_c_t_r;
  PImage grass;
  PImage sword;
  PImage fireball;
  public PImage warrior_l;
  public PImage warrior_r;

  private PImage[] tiles;

  public Tiles() {

    // x<100 are static map tiles
    // 100<x<200 player, NPCs and dynamic items
    // x>200 other
    tiles = new PImage[400];
    try {
      for (int i=0; i<400; i++) {
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

