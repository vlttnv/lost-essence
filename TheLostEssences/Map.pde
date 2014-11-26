class Map {

  // Map
  int[][] map;
  int mapType;

  public Map(int type) {
    map = new int[rows][cols];
    generateMap();
  }

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
    //    for (int i = 0; i < cols; i++) {
    //      // Begin loop for rows
    //      for (int j = 0; j < rows; j++) {
    //        // Scaling up to draw a rectangle at (x,y)
    //        int x = i*videoScale;
    //        int y = j*videoScale;
    //
    //        // For every column and row, a tiles is drawn at an (x,y) location scaled and sized by videoScale.
    //        if (map[j][i] != -1) {
    //          if (abs(j - p.posY) < 5 && abs(i - p.posX) < 5) {
    //
    //
    //            boolean dr = true;
    //            PVector end = new PVector(i, j);
    //            PVector start = new PVector(p.posX, p.posY);
    //            for (float z=0.0; z<=1; z=z+0.1) {
    //              PVector middle = PVector.lerp(start, end, z);
    //              if (map[(int)middle.y][(int)middle.x] <100 && dr) {
    //                image(loadedTiles.get(map[j][i]), x, y);
    //              } else if (map[(int)middle.y][(int)middle.x] > 100 && dr) {
    //                //image(loadedTiles.get(map[j][i]), x, y);
    //                dr = false;
    //              }
    //            }
    //          }
    //        }
    //      }
    //    }

    for (int i=0; i<=7; i++) {
      boolean dr = true;
      PVector end = new PVector((p.posX*videoScale-3*videoScale)+i*videoScale, p.posY*videoScale-4*videoScale);
      PVector start = new PVector(p.posX*videoScale, p.posY*videoScale);
      
      PVector middle;
      for (float z=0.0; z<=1; z=z+0.1) {
        middle = PVector.lerp(start, end, z);
        if (((int)middle.y>=0 && (int)middle.y<rows*videoScale) && ((int)middle.x>=0 && (int)middle.x<cols*videoScale)) {
          
          if (map[(int)middle.y/ videoScale][(int)middle.x/ videoScale] <100 && dr) {
            println("test");
            image(loadedTiles.get(map[(int)middle.y/ videoScale][(int)middle.x/ videoScale]), (int)middle.x, (int)middle.y);
          } else if (map[(int)middle.y/ videoScale][(int)middle.x/ videoScale] > 100 && dr) {
            image(loadedTiles.get(map[(int)middle.y/ videoScale][(int)middle.x/ videoScale]), (int)middle.x, (int)middle.y);
            dr = false;
          }
        }
      }
      //line(((p.posX-3)+i) * videoScale, (p.posY-4)* videoScale, p.posX* videoScale, p.posY* videoScale);
    }

//    for (int i=0; i<=7; i++) {
//      boolean dr = true;
//      PVector end = new PVector((p.posX-3)+i, p.posY+4);
//      PVector start = new PVector(p.posX, p.posY);
//      PVector middle;
//      for (float z=0.0; z<=1; z=z+0.1) {
//        middle = PVector.lerp(start, end, z);
//        if (((int)middle.y>=0 && (int)middle.y<rows) && ((int)middle.x>=0 && (int)middle.x<cols)) {
//          if (map[(int)middle.y][(int)middle.x] <100 && dr) {
//            image(loadedTiles.get(map[(int)middle.y][(int)middle.x]), (int)middle.x * videoScale, (int)middle.y * videoScale);
//          } else if (map[(int)middle.y][(int)middle.x] > 100 && dr) {
//            image(loadedTiles.get(map[(int)middle.y][(int)middle.x]), (int)middle.x * videoScale, (int)middle.y * videoScale);
//            dr = false;
//          }
//        }
//      }
//    }
//
//    for (int i=0; i<=7; i++) {
//      boolean dr = true;
//      PVector end = new PVector(p.posX+4, (p.posY-3)+i);
//      PVector start = new PVector(p.posX, p.posY);
//      PVector middle;
//      for (float z=0.0; z<=1; z=z+0.1) {
//        middle = PVector.lerp(start, end, z);
//        if (((int)middle.y>=0 && (int)middle.y<rows) && ((int)middle.x>=0 && (int)middle.x<cols)) {
//          if (map[(int)middle.y][(int)middle.x] <100 && dr) {
//            if (((int)middle.y>=0 && (int)middle.y<rows-1) && ((int)middle.x>=0 && (int)middle.x<cols-1)) {
//              image(loadedTiles.get(map[(int)middle.y][(int)middle.x]), (int)middle.x * videoScale, (int)middle.y * videoScale);
//            }
//          } else if (map[(int)middle.y][(int)middle.x] > 100 && dr) {
//            if (((int)middle.y>=0 && (int)middle.y<rows-1) && ((int)middle.x>=0 && (int)middle.x<cols-1)) {
//              image(loadedTiles.get(map[(int)middle.y][(int)middle.x]), (int)middle.x * videoScale, (int)middle.y * videoScale);
//            }
//            dr = false;
//          }
//        }
//      }
//    }
//
//    for (int i=0; i<=7; i++) {
//      boolean dr = true;
//      PVector end = new PVector(p.posX-3, (p.posY-3)+i);
//      PVector start = new PVector(p.posX, p.posY);
//      PVector middle;
//
//      for (float z=0.0; z<=1; z=z+0.1) {
//        middle = PVector.lerp(start, end, z);
//        if (((int)middle.y>=0 && (int)middle.y<rows) && ((int)middle.x>=0 && (int)middle.x<cols)) {
//          if (map[(int)middle.y][(int)middle.x] <100 && dr) {
//            image(loadedTiles.get(map[(int)middle.y][(int)middle.x]), (int)middle.x * videoScale, (int)middle.y * videoScale);
//          } else if (map[(int)middle.y][(int)middle.x] > 100 && dr) {
//            image(loadedTiles.get(map[(int)middle.y][(int)middle.x]), (int)middle.x * videoScale, (int)middle.y * videoScale);
//            dr = false;
//          }
//        }
//      }
//    }
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

  public void generateMap() {
    for (int i = 0; i < cols; i++) {
      // Begin loop for rows
      for (int j = 0; j < rows; j++) {
        // Scaling up to draw a rectangle at (x,y)
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
      //      while (map[y_0][border+1] == 141 || map[y_0][border-1] == 141) {
      //        border = (int)random(x_0, x_max);
      //      }
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
      //goDeeper(x_max/2, x_max, y_0, y_max, level+1);
    } else if (rnd >= 1) {
      int border = (int)random(y_0, y_max);
      //      while (map[border+1][x_0] == 141 || map[border-1][x_0] == 141) {
      //        border = (int)random(y_0, y_max);
      //      }
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

