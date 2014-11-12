class Charge extends Skill {

  public Charge() {
    super(10, 10);
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

