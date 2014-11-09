class Map {
  //int mapWidth;
  //int mapHeight;

  // Tile variables
  PImage grass, stone, water;

  // Loaded tiles
  Tiles tiles;

  // Map
  int[][] map;

  public Map(Tiles tiles, String mapName) {
    BufferedReader reader = createReader("maps/" + mapName);
    this.tiles = tiles;
    map = new int[rows][cols];

    String line;
    String[] split;
    int rowCounter = 0;
    try {
      while ( (line = reader.readLine ()) != null) {
        split = split(line, ',');
        for (int i=0; i<split.length; i++) {
          map[rowCounter][i] = Integer.parseInt(split[i]);
        }
        rowCounter += 1;
      }
    } 
    catch (IOException e) {
    } 
    finally {
      try {
        reader.close();
      } 
      catch (IOException e) {
      }
    }
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
        if (map[j][i] != -1) {
          image(tiles.get(map[j][i]), x, y);
        }
      }
    }
  }

  public boolean isStepable(int x, int y) {
    if (y>rows-1 || x>cols-1) return false;
    if (y<0 || x<0) return false;
    if (dynamicsPositionMap.get(x, y) != null) return false;
    if (map[y][x] < 2) {
      return true;
    } else {
      return false;
    }
  }
}

