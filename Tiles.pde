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
  public PImage warrior_l;
  public PImage warrior_r;

  private PImage[] tiles;

  public Tiles() {
    stone = loadImage("stone.png");
    grass = loadImage("grass.png");
    sword = loadImage("sword.png");
    warrior_l = loadImage("warrior_l.png");
    warrior_r = loadImage("warrior_r.png");

    water = loadImage("water.png");
    water_t_l = loadImage("sand_water_top_left.png");
    water_t = loadImage("water_sand_top.png");
    water_t_r = loadImage("sand_water_top_right.png");
    water_r = loadImage("water_sand_right.png");
    water_b_r = loadImage("water_sand_bottom_right.png");
    water_b = loadImage("water_sand_bottom.png");
    water_b_l = loadImage("water_sand_bottom_left.png");
    water_l = loadImage("water_sand_left.png");
    water_c_b_l = loadImage("water_c_b_l.png");
    water_c_b_r = loadImage("water_c_b_r.png");
    water_c_t_l = loadImage("water_c_t_l.png");
    water_c_t_r = loadImage("water_c_t_r.png");

    tiles = new PImage[20];

    tiles[1] = stone;
    tiles[0] = grass;
    tiles[2] = water;
    tiles[3] = water_t_l;
    tiles[4] = water_t;
    tiles[5] = water_t_r;
    tiles[6] = water_r;
    tiles[7] = water_b_r;
    tiles[8] = water_b;
    tiles[9] = water_b_l;
    tiles[10] = water_l;
    tiles[11] = water_c_b_l;
    tiles[12] = water_c_b_r;
    tiles[13] = water_c_t_l;
    tiles[14] = water_c_t_r;
  }

  public PImage get(int i) {
    return tiles[i];
  }
}

