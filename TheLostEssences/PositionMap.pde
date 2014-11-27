class PositionMap {

  Dynamic[][] map;

  public PositionMap() {
    map = new Dynamic[rows][cols];
    println("ROWS " + rows);
    println("COLS " + cols);
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

  public void drawMap() {
    // Begin loop for columns
    for (int i = 0; i < cols; i++) {
      // Begin loop for rows
      for (int j = 0; j < rows; j++) {
        // Scaling up to draw a rectangle at (x,y)
        int x = i*videoScale;
        int y = j*videoScale;

        // For every column and row, a rectangle is drawn at an (x,y) location scaled and sized by videoScale.
        if (map[j][i] != null) {
          if (abs(j - p.posY) < 4 && abs(i - p.posX) < 4) {


            boolean dr = true;
            PVector start = new PVector(i, j);
            PVector end = new PVector(p.posX, p.posY);
            PVector middle;
            for (float z=0.0; z<=1; z=z+0.1) {
              middle = PVector.lerp(start, end, z);
              if (((int)middle.y>=0 && (int)middle.y<rows) && ((int)middle.x>=0 && (int)middle.x<cols)) {
                if (terrainMap.get((int)middle.x,(int)middle.y) > 100 && dr) {
                  dr = false;
                }
              }
            }




            Dynamic d = map[j][i];


            if (dr) {

              image(loadedTiles.get(d.getTileNumber()), x, y);
              textSize(12);
              textAlign(CENTER);
              text(d.getName(), d.getX()*videoScale + 16, d.getY()*videoScale);
            }
          }
        }
      }
    }
  }

  public Dynamic get(int x, int y) {
    println("X " + x);
    println("Y " + y);
    return map[y][x];
  }
}

