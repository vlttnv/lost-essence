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
          image(loadedTiles.get(map[j][i].getTileNumber()), x, y);
        }
      }
    }
  }

  public Dynamic get(int x, int y) {
    return map[y][x];
  }
}

