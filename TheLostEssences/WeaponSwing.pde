class WeaponSwing extends Skill {

  public WeaponSwing(int tile) {
    super(0, 1, tile);
    dmg = p.inventory[Item.HAND_L].dmg + ((int)Math.round(p.atr*0.3));
  }

  public void use(Dynamic d) {
    if (d != null) {
      if (abs(mouseX/videoScale-p.posX) <= range && abs(mouseY/videoScale-p.posY) <= range) {
        println(dmg);
        d.attack(dmg);
      }
    }
  }
}

