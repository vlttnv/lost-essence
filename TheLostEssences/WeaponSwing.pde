class WeaponSwing extends Skill {

  public WeaponSwing(int tile) {
    super(0, 1, tile);
    //TODO FIX DMG
    dmg = p.inventory[Item.HAND_L].dmg + ((int)Math.round(p.atr*0.3));
  }

  public void use(Dynamic d) {
    if (d != null) {
      if (abs(mouseX/videoScale-p.posX) <= range && abs(mouseY/videoScale-p.posY) <= range) {
        if (d.type != 100) {
          d.attack(dmg);
          int healChance = (int)Math.round(random(100));
          if (healChance >= 60) {
            int gain = (int)Math.round(p.hp*0.2);
            if (p.hp+gain <=p.maxHP) {
              p.hp += gain;
            } else {
              p.hp = p.maxHP;
            }
          }
        }
      }
    }
  }
}

