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
          if (abs(j - p.posY) < 7 && abs(i - p.posX) < 7) {




            Dynamic d = map[j][i];

            image(loadedTiles.get(d.getTileNumber()), x, y);
            textSize(12);
            textAlign(CENTER);
            text(d.getName(), d.getX()*videoScale + 16, d.getY()*videoScale);
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

