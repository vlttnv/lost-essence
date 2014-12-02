abstract class Skill {
  int dmg;
  int range;
  int tile;

  public Skill(int dmg, int range, int tile) {
    this.dmg = dmg;
    this.range = range;
    this.tile = tile;
  }

  abstract void use(Dynamic d);
  
  public int getTile() {
    return tile;
  }
}

