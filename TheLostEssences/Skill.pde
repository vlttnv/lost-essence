abstract class Skill {
  int dmg;
  int range;

  public Skill(int dmg, int range) {
    this.dmg = dmg;
    this.range = range;
  }

  abstract void use(Dynamic d);
}

