class Charge extends Skill {

  public Charge(int tile) {
    super(10, 10, tile);
    }

    public void use(Dynamic d) {
      if (d != null) {
        if (abs(mouseX/videoScale-p.posX) <= range && abs(mouseY/videoScale-p.posY) <= range) {
          p.teleportPlayer(mouseX/videoScale - 1, mouseY/videoScale);
          d.attack(dmg);
        }
      }
    }
}

