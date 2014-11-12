class WeaponSwing extends Skill {

  public WeaponSwing() {
    super(5, 1);
  }

  public void use(Dynamic d) {
    if (d != null) {
      if (abs(mouseX/videoScale-p.posX) <= range && abs(mouseY/videoScale-p.posY) <= range) {
        d.attack(dmg);
      }
    }
  }
}

