class Map {

  // Map
  int[][] map;
  int mapType;

  public Map(String mapName) {
    BufferedReader reader = createReader("maps/" + mapName);
    map = new int[rows][cols];

    String line;
    String[] split;
    int rowCounter = 0;

    try {
      // Read map from .map file and populate 2D array
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

        // For every column and row, a tiles is drawn at an (x,y) location scaled and sized by videoScale.
        if (map[j][i] != -1) {
          //if (abs(j - p.posY) < 7 && abs(i - p.posX) < 7) {
          image(loadedTiles.get(map[j][i]), x, y);
          //} else {

          //}
        }
      }
    }
  }

  public boolean isStepable(int x, int y) {
    // Out of bounds?
    if (y>rows-1 || x>cols-1) return false;
    if (y<0 || x<0) return false;
    
    // Is there a dynamic here?
    if (dynamicsPositionMap.get(x, y) != null) return false;
    
    // Is it a stepable tile? Right now tiles with a number under 100 are stepable
    if (map[y][x] < 100) {
      return true;
    } else {
      return false;
    }
  }
}

