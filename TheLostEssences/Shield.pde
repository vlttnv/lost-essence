class Shield extends Skill {

  public Shield(int tile) {
    super(0, 0, tile);
    //dmg = p.inventory[Item.HAND_L].dmg;
  }
  
  public void use(Dynamic d) {
    if (coolDown3 == 0) {
      p.armor += 9000;
      coolDown3 += 1;
      timer3 += 1;
      this.tile = 463;
    }
  }
}
