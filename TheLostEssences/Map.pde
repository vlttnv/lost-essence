/**
 Used to represent the word and be used as a position map.
 Static maps are loaded from a file, dynamic dungeons are generated.
 */
class Map {
  public static final int NON_DUNGEON = 0;
  public static final int DUNGEON = 1;
  public static final int EAST = 0;
  public static final int WEST = 1;
  public static final int NORTH = 2;
  public static final int SOUTH = 3;

  // Map
  int[][] map;
  int mapType;
  String mapName;

  String eastMap;
  String westMap;
  String northMap;
  String southMap;

  int randWall;
  int randFloor;

  public Map(int type) {
    map = new int[rows][cols];
    mapType = type;
    generateMap();
  }

  public Map(String mapName) {
    // Load the map into memory
    BufferedReader reader = createReader("maps/" + mapName);
    this.mapName = mapName;
    map = new int[rows][cols];

    String line;
    String[] split;
    String[] props;
    String[] entrances;
    int rowCounter = 0;



    try {
      // Read the parameters
      mapType = Integer.parseInt(reader.readLine());
      eastMap = reader.readLine();
      westMap = reader.readLine();
      northMap = reader.readLine();
      southMap = reader.readLine();
      line = reader.readLine();

      // Insert props
      if (line.length() != 0) {
        props = split(line, ',');
        for (int i=0; i<props.length; i++) {

          String[] data = split(props[i], ' ');
          new Prop(Integer.parseInt(data[0]), Integer.parseInt(data[1]), Integer.parseInt(data[2]));
        }
      }

      // Insert entrances
      line = reader.readLine();
      if (line.length() != 0) {
        entrances = split(line, ',');
        for (int i=0; i<entrances.length; i++) {

          String[] data = split(entrances[i], ' ');
          new Entrance("", Integer.parseInt(data[0]), Integer.parseInt(data[1]), Integer.parseInt(data[2]), Integer.parseInt(data[3]), Integer.parseInt(data[4]), data[5], 1);
        }
      }


      // Populate map
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

  public int get(int x, int y) {
    return map[y][x];
  }

  /**
   Draw every single tile
   */
  public void drawOutdoors() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        int x = i*videoScale;
        int y = j*videoScale;

        image(loadedTiles.get(map[j][i]), x, y);
      }
    }
  }


  /**
   Draw with fog of war.
   This is done by checking if there are obstructions from the
   farthest tile that the player can see to the player. If so
   the tiles before the obstruction are not draw, but after it are(towards the player).
   This is done in all directions (the 4 for-loops).
   */
  public void drawMap() {

    for (int i=0; i<=7; i++) {
      boolean dr = true;
      PVector end = new PVector((p.posX-3)+i, p.posY-3);
      PVector start = new PVector(p.posX, p.posY);
      PVector middle;
      for (float z=0.0; z<=1; z=z+0.1) {
        middle = PVector.lerp(start, end, z);
        if (((int)middle.y>=0 && (int)middle.y<rows) && ((int)middle.x>=0 && (int)middle.x<cols)) {
          if (map[(int)middle.y][(int)middle.x] <100 && dr) {
            image(loadedTiles.get(map[(int)middle.y][(int)middle.x]), (int)middle.x * videoScale, (int)middle.y * videoScale);
          } else if (map[(int)middle.y][(int)middle.x] > 100 && dr) {
            image(loadedTiles.get(map[(int)middle.y][(int)middle.x]), (int)middle.x * videoScale, (int)middle.y * videoScale);
            dr = false;
          }
        }
      }
    }

    for (int i=0; i<=7; i++) {
      boolean dr = true;
      PVector end = new PVector((p.posX-3)+i, p.posY+4);
      PVector start = new PVector(p.posX, p.posY);
      PVector middle;
      for (float z=0.0; z<=1; z=z+0.1) {
        middle = PVector.lerp(start, end, z);
        if (((int)middle.y>=0 && (int)middle.y<rows) && ((int)middle.x>=0 && (int)middle.x<cols)) {
          if (map[(int)middle.y][(int)middle.x] <100 && dr) {
            image(loadedTiles.get(map[(int)middle.y][(int)middle.x]), (int)middle.x * videoScale, (int)middle.y * videoScale);
          } else if (map[(int)middle.y][(int)middle.x] > 100 && dr) {
            image(loadedTiles.get(map[(int)middle.y][(int)middle.x]), (int)middle.x * videoScale, (int)middle.y * videoScale);
            dr = false;
          }
        }
      }
    }

    for (int i=0; i<=7; i++) {
      boolean dr = true;
      PVector end = new PVector(p.posX+4, (p.posY-3)+i);
      PVector start = new PVector(p.posX, p.posY);
      PVector middle;
      for (float z=0.0; z<=1; z=z+0.1) {
        middle = PVector.lerp(start, end, z);
        if (((int)middle.y>=0 && (int)middle.y<rows) && ((int)middle.x>=0 && (int)middle.x<cols)) {
          if (map[(int)middle.y][(int)middle.x] <100 && dr) {
            if (((int)middle.y>=0 && (int)middle.y<rows-1) && ((int)middle.x>=0 && (int)middle.x<cols-1)) {
              image(loadedTiles.get(map[(int)middle.y][(int)middle.x]), (int)middle.x * videoScale, (int)middle.y * videoScale);
            }
          } else if (map[(int)middle.y][(int)middle.x] > 100 && dr) {
            if (((int)middle.y>=0 && (int)middle.y<rows-1) && ((int)middle.x>=0 && (int)middle.x<cols-1)) {
              image(loadedTiles.get(map[(int)middle.y][(int)middle.x]), (int)middle.x * videoScale, (int)middle.y * videoScale);
            }
            dr = false;
          }
        }
      }
    }

    for (int i=0; i<=7; i++) {
      boolean dr = true;
      PVector end = new PVector(p.posX-3, (p.posY-3)+i);
      PVector start = new PVector(p.posX, p.posY);
      PVector middle;

      for (float z=0.0; z<=1; z=z+0.1) {
        middle = PVector.lerp(start, end, z);
        if (((int)middle.y>=0 && (int)middle.y<rows) && ((int)middle.x>=0 && (int)middle.x<cols)) {
          if (map[(int)middle.y][(int)middle.x] <100 && dr) {
            image(loadedTiles.get(map[(int)middle.y][(int)middle.x]), (int)middle.x * videoScale, (int)middle.y * videoScale);
          } else if (map[(int)middle.y][(int)middle.x] > 100 && dr) {
            image(loadedTiles.get(map[(int)middle.y][(int)middle.x]), (int)middle.x * videoScale, (int)middle.y * videoScale);
            dr = false;
          }
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

  /**
   Random dungeon generation. Done recursively, dividing the dungeon in 2 pieces
   per call and calling the recursive methond on those 2 pieces up to a depth of 3.
   Doorways are inserted along the way.
   */
  public void generateMap() {
    int dunType = (int)Math.round(random(3));

    // Choose dungeon theme
    if (dunType == 3) {
      randWall = 141;
      randFloor = 41;
    } else if (dunType == 2) {
      randWall = 145;
      randFloor = 30;
    } else if (dunType == 1) {
      randWall = 146;
      randFloor = 52;
    } else if (dunType == 0) {
      randWall = 147;
      randFloor = 10;
    }

    // First split
    for (int i = 0; i < cols; i++) {
      // Begin loop for rows
      for (int j = 0; j < rows; j++) {
        // Scaling up to draw a rectangle at (x,y)
        int x = i*videoScale;
        int y = j*videoScale;

        if (j == 0 || j == rows-1) {
          map[j][i] = randWall;
        } else if (i ==0 || i == cols-1) {
          map[j][i] = randWall;
        } else {
          map[j][i] = randFloor;
        }
      }
    }
    goDeeper(0, cols-1, 0, rows-1, 0);
  }

  /**
   Recursively split the dungeon
   */
  private void goDeeper(int x_0, int x_max, int y_0, int y_max, int level) {
    if (level == 3) return;


    float rnd = random(2);

    if (rnd < 1) {
      int border = (int)random(x_0, x_max);

      int door1 = (int)random(y_0+1, y_max-1);
      int door2 = (int)random(y_0+1, y_max-1);
      for (int i=y_0; i<=y_max; i++) {
        if (i==door1 || i==door2) {
          map[i][(x_max-x_0)/2 + x_0]=randFloor;
        } else {
          map[i][(x_max-x_0)/2 + x_0]=randWall;
        }
      }
      goDeeper(x_0, x_max/2, y_0, y_max, level+1);
      goDeeper((x_max-x_0)/2 + x_0, x_max, y_0, y_max, level+1);
    } else if (rnd >= 1) {
      int border = (int)random(y_0, y_max);
      int door = (int)random(x_0+1, x_max-1);
      for (int i=x_0; i<=x_max; i++) {
        if (i==door) {
          map[(y_max-y_0)/2 + y_0][i]=randFloor;
        } else {
          map[(y_max-y_0)/2 + y_0][i]=randWall;
        }
      }
      goDeeper(x_0, x_max, y_0, y_max/2, level+1);
      goDeeper( x_0, x_max, (y_max-y_0)/2 + y_0, y_max, level+1);
    }
  }

  public boolean isDungeon() {
    if (mapType ==  1) {
      return true;
    } else {
      return false;
    }
  }

  /**
   Used for transitioning between overground screens
   */
  public String getMapDirection(int direction) {
    if (direction == EAST) {
      return eastMap;
    } else if (direction == WEST) {
      return westMap;
    } else if (direction == NORTH) {
      return northMap;
    } else if (direction == SOUTH) {
      return southMap;
    }
    return "";
  }

  public String getMapName() {
    return this.mapName;
  }

  public boolean inBounds(int x, int y) {
    if ((x<cols-1 && x>=0) && (y<rows-1 && y>=0)) {
      return true;
    } else {
      return false;
    }
  }
}

