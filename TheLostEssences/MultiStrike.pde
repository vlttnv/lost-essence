/**
A strong attack, damaging the Hostiles in the 4 directions
around the player (east, west, north, south). Has a cooldown of 5 seconds
*/
class MultiStrike extends Skill {

  public MultiStrike(int tile) {
    super(0, 1, tile);
    dmg = p.inventory[Item.HAND_L].dmg * 4;
  }

  public void use(Dynamic d) {
    if (coolDown2 == 0) {
      if (terrainMap.inBounds(p.posX+1, p.posY)) {
        Dynamic temp = dynamicsPositionMap.get(p.posX+1, p.posY);
        if (temp != null) {
          if (temp.type != 100) {
            temp.attack(dmg);
          }
        }
      }

      if (terrainMap.inBounds(p.posX-1, p.posY)) {
        Dynamic temp = dynamicsPositionMap.get(p.posX-1, p.posY);
        if (temp != null) {
          if (temp.type != 100) {
            temp.attack(dmg);
          }
        }
      }

      if (terrainMap.inBounds(p.posX, p.posY+1)) {
        Dynamic temp = dynamicsPositionMap.get(p.posX, p.posY+1);
        if (temp != null) {
          if (temp.type != 100) {
            temp.attack(dmg);
          }
        }
      }

      if (terrainMap.inBounds(p.posX, p.posY-1)) {
        Dynamic temp = dynamicsPositionMap.get(p.posX, p.posY-1);
        if (temp != null) {
          if (temp.type != 100) {
            temp.attack(dmg);
          }
        }
      }
      coolDown2 += 1;
      this.tile = 463;
    }
  }
}

