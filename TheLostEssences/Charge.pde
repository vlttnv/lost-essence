class Charge extends Skill {

  public Charge(int tile) {
    super(10, 10, tile);
    dmg = p.inventory[Item.HAND_L].dmg;
  }

  public void use(Dynamic d) {
    if (coolDown1 == 0) {
      int newx = mouseX/videoScale;
      int newy = mouseY/videoScale;
      if (d != null) {
        if ((abs(mouseX/videoScale-p.posX) <= range && abs(mouseX/videoScale-p.posX)>0) && (abs(mouseY/videoScale-p.posY) <= range && abs(mouseY/videoScale-p.posY)>0 )) {
          if (terrainMap.isStepable(mouseX/videoScale+1, mouseY/videoScale)) {
            newx += 1;
          } else if (terrainMap.isStepable(mouseX/videoScale-1, mouseY/videoScale)) {
            newx -= 1;
          } else if (terrainMap.isStepable(mouseX/videoScale, mouseY/videoScale+1)) {
            newy += 1;
          } else if (terrainMap.isStepable(mouseX/videoScale, mouseY/videoScale-1)) {
            newy -= 1;
          }
          p.teleportPlayer(newx, newy);
          d.attack(dmg);
          int gain = (int)Math.round(p.hp*0.2);
          if (p.hp+gain <=p.maxHP) {
            p.hp += gain;
          } else {
            p.hp = p.maxHP;
          }
        }
      }
      coolDown1 += 1;
      this.tile = 463;
    }
  }
}

