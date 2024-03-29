/**
 A map containing all the dynamics.
 */
class PositionMap {

  Dynamic[][] map;

  public PositionMap() {
    map = new Dynamic[rows][cols];
  }

  public void register(Dynamic d, int x, int y) {
    map[y][x] = d;
  }

  public void update(int prevX, int prevY, int x, int y) {
    map[y][x] = map[prevY][prevX];
    map[prevY][prevX] = null;
  }

  public void deregister(int x, int y) {
    map[y][x] = null;
  }

  /**
   No "fog of war". Used for debugging.
   */
  public void drawOutdoors() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        int x = i*videoScale;
        int y = j*videoScale;

        if (map[j][i] != null) {
          Dynamic d = map[j][i];
          if (d.type==100 && timer3 !=0) {
            image(loadedTiles.get(398), x, y);
          }
          image(loadedTiles.get(d.getTileNumber()), x, y);

          if (d.type==100) {
            fill(250, 33, 33);
            rect(d.getX()*videoScale, d.getY()*videoScale-2, 28, 2);
            float php = p.hp;
            float pmaxhp = p.maxHP;
            float percentage = (php/pmaxhp);
            float val = 28f*percentage;

            fill(120, 180, 10);
            rect(d.getX()*videoScale, d.getY()*videoScale-2, val, 2);
          } else if (d.type >=0 && d.type<100) {
            fill(250, 33, 33);
            rect(d.getX()*videoScale, d.getY()*videoScale-2, 28, 2);
            float php = ((Hostile)d).hp;
            float pmaxhp = ((Hostile)d).maxHP;
            float percentage = (php/pmaxhp);
            float val = 28f*percentage;

            fill(120, 180, 10);
            rect(d.getX()*videoScale, d.getY()*videoScale-2, val, 2);
          }
        }
      }
    }
  }

  /**
   Draw with "fog of war"
   */
  public void drawMap() {

    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        int x = i*videoScale;
        int y = j*videoScale;

        if (map[j][i] != null) {
          if (abs(j - p.posY) < 4 && abs(i - p.posX) < 4) {


            boolean dr = true;
            PVector start = new PVector(i, j);
            PVector end = new PVector(p.posX, p.posY);
            PVector middle;
            for (float z=0.0; z<=1; z=z+0.1) {
              middle = PVector.lerp(start, end, z);
              if (((int)middle.y>=0 && (int)middle.y<rows) && ((int)middle.x>=0 && (int)middle.x<cols)) {
                if (terrainMap.get((int)middle.x, (int)middle.y) > 100 && dr) {
                  dr = false;
                }
              }
            }

            Dynamic d = map[j][i];


            if (dr) {
              if (d.type==100 && timer3 !=0) {
                image(loadedTiles.get(398), x, y);
              }

              image(loadedTiles.get(d.getTileNumber()), x, y);
              textSize(12);
              textAlign(CENTER);
              if (d.type==100) {
                fill(250, 33, 33);
                rect(d.getX()*videoScale, d.getY()*videoScale-2, 28, 2);
                float php = p.hp;
                float pmaxhp = p.maxHP;
                float percentage = (php/pmaxhp);
                float val = 28f*percentage;

                fill(120, 180, 10);
                rect(d.getX()*videoScale, d.getY()*videoScale-2, val, 2);
              } else if (d.type >=0 && d.type<100) {
                fill(250, 33, 33);
                rect(d.getX()*videoScale, d.getY()*videoScale-2, 28, 2);
                float php = ((Hostile)d).hp;
                float pmaxhp = ((Hostile)d).maxHP;
                float percentage = (php/pmaxhp);
                float val = 28f*percentage;

                fill(120, 180, 10);
                rect(d.getX()*videoScale, d.getY()*videoScale-2, val, 2);
              }
            }
          }
        }
      }
    }
  }

  public Dynamic get(int x, int y) {
    return map[y][x];
  }
}

