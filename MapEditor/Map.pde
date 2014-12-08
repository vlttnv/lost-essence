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

    for (int i = 0; i < cols; i++) {
      // Begin loop for rows
      for (int j = 0; j < rows; j++) {

        int x = i*videoScale;
        int y = j*videoScale;


        if (map[j][i] != -1) {
          image(tiles.get(map[j][i]), x, y);
        }
      }
    }
  }

  public void set(int x, int y, int z) {
    map[y][x] = z;
  }

  public void saveMap() {

    for (int i = 0; i < rows; i++) {

      String line = "";
      for (int j = 0; j < cols; j++) {

        int x = i*videoScale;
        int y = j*videoScale;

        println(cols);
        println(j);
        if (cols - 1 == j) {
          println("lol");
          line = line + Integer.toString(map[i][j]);
        } else {
          line = line + Integer.toString(map[i][j]) + ",";
        }
      }
      output.println(line);
    }
    output.flush();  
    output.close();  
    exit();
  }

  public void generateMap() {
    for (int i = 0; i < cols; i++) {

      for (int j = 0; j < rows; j++) {

        int x = i*videoScale;
        int y = j*videoScale;

        if (j == 0 || j == rows-1) {
          map[j][i] = 141;
        } else if (i ==0 || i == cols-1) {
          map[j][i] = 141;
        } else {
          map[j][i] = 41;
        }
      }
    }
    goDeeper(0, cols-1, 0, rows-1, 0);
  }

  private void goDeeper(int x_0, int x_max, int y_0, int y_max, int level) {
    if (level == 3) return;


    float rnd = random(2);

    if (rnd < 1) {
      int border = (int)random(x_0, x_max);

      int door = (int)random(y_0+1, y_max-1);
      for (int i=y_0; i<=y_max; i++) {
        if (i==door) {
          println("lol");
          map[i][(x_max-x_0)/2 + x_0]=41;
        } else {
          map[i][(x_max-x_0)/2 + x_0]=141;
        }
      }
      goDeeper(x_0, x_max/2, y_0, y_max, level+1);
      goDeeper((x_max-x_0)/2 + x_0, x_max, y_0, y_max, level+1);
    } else if (rnd >= 1) {
      int border = (int)random(y_0, y_max);
      int door = (int)random(x_0+1, x_max-1);
      for (int i=x_0; i<=x_max; i++) {
        if (i==door) {
          map[(y_max-y_0)/2 + y_0][i]=41;
        } else {
          map[(y_max-y_0)/2 + y_0][i]=141;
        }
      }
      goDeeper(x_0, x_max, y_0, y_max/2, level+1);
      goDeeper( x_0, x_max, (y_max-y_0)/2 + y_0, y_max, level+1);
    }
  }
}

