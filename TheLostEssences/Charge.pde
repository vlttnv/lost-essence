/**
 Charge to the target Dynamic with a 
 chance to heal the player for a small amount.
 A charge can be made from a certain rane and not
 when close to the target. The cooldown is 3 seconds.
 */
class Charge extends Skill {

  public Charge(int tile) {
    super(10, 10, tile);
    dmg = p.inventory[Item.HAND_L].dmg;
  }

  /*
  Checks if the target is in ragne or not too close.
  Chargin through walls is intended!
   */
  public void use(Dynamic d) {
    if (coolDown1 == 0) {
      int newx = mouseX/videoScale;
      int newy = mouseY/videoScale;
      if (d != null) {
        if ((abs(mouseX/videoScale-p.posX) <= range) && (abs(mouseY/videoScale-p.posY) <= range )) {
          // Move player to a legal place
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
          
          // Roll for heal
          int gain = (int)Math.round(p.hp*0.2);
          if (p.hp+gain <=p.maxHP) {
            p.hp += gain;
          } else {
            p.hp = p.maxHP;
          }
        }
      }
      
      // Start timer and change skill tile to indicate cooldown
      coolDown1 += 1;
      this.tile = 463;
    }
  }
}

