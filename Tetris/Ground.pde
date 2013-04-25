class Ground{
  Block[][] grid;
  double blockSize;
  
  Ground(double windowH, double windowW, double blockRatio){
    blockSize = windowW / blockRatio;
    grid = new Block[(int)(windowH / blockSize) + 1][(int)blockRatio + 1];
    for(int x = 0; x <= blockRatio; x ++){
      grid[(int)(windowH / blockSize)][x] = new Block("blank.png",x * blockSize,windowHeight,blockSize,this);
    }
    for(int x = 0; x <= (int)(windowH / blockSize); x ++){
      grid[x][(int)blockRatio] = new Block("blank.png",windowWidth,x * blockSize,blockSize,this);
    }
  }
  
  boolean touchingGround(double xpos,double ypos){
    int x = (int)(xpos / blockSize);
    int y = (int)(ypos / blockSize) + 1;
    if(x < 0 || x > grid.length || y > grid.length || y < 0 || grid[y][x] != null){
      return true;
    }
    return false;
  }
  
  boolean touchingRightWall(double xpos,double ypos){
    int x = (int)(xpos / blockSize) + 1;
    int y = (int)(ypos / blockSize);
    if(y < 0 && x <= grid[0][grid[0].length - 1].getX())
      return false;
    if(x >= grid[y].length || grid[y][x] != null){
      return true;
    }
    return false;
  }
  
  boolean inRightWall(double xpos,double ypos){
    int x = (int)(xpos / blockSize);
    int y = (int)(ypos / blockSize);
    if(y < 0 && x <= grid[0][grid[0].length - 1].getX())
      return false;
    if(x < 0 || x >= grid[y].length || grid[y][x] != null){
      return true;
    }
    return false;
  }
  
  boolean touchingLeftWall(double xpos,double ypos){
    int x = (int)(xpos / blockSize) - 1;
    int y = (int)(ypos / blockSize);
    if(y < 0 && x >= 0)
      return false;
    if(x < 0 || grid[y][x] != null){
      return true;
    }
    return false;
  }
  
  boolean inLeftWall(double xpos,double ypos){
    int x = (int)(xpos / blockSize);
    int y = (int)(ypos / blockSize);
    if(y < 0 || x >= 0)
      return false;
    if(x < 0 || grid[y][x] != null){
      return true;
    }
    return false;
  }
  
  
  void showSelf(){
    int count = 0;
    for(Block[] blocks:grid){
      for(Block block:blocks){
        if(block == null)
          continue;
        block.showSelf();
      }
    }
  }
  
  boolean addShape(Shape shape){
    Block[] blocks = shape.getBlocks();
    for(Block block:blocks){
      if(copy(block)){
        return true;
      }
    }
    checkForLines();
    return false;
  }
  
  boolean copy(Block block){
    Block copy;
    int x = (int)(block.getX() / 50);
    int y = (int)(block.getY() / 50);
    if(y < 0)
      return true;
    String type = block.getType();
    copy = new Block(type,(double)x * 50,(double)y * 50,blockSize,this);
    grid[y][x] = copy;
    return false;
  }
  
  void checkForLines(){
    for(int y = 0; y < grid.length - 1; y ++){
      boolean full = true;
      for(int x = 0; x < grid[y].length - 1; x ++){
        Block block = grid[y][x];
        if(block == null){
          full = false;
          break;
        }
      }
      if(full){
        for(int x = 0; x < grid[y].length; x ++)
          grid[y][x] = null;
        for(int y2 = y; y2 > 0; y2 --){
          for(int x2 = 0; x2 < grid[y2].length; x2 ++){
            if(grid[y2][x2] != null)
              grid[y2][x2].moveDownARow();
              grid[y2][x2] = grid[y2 - 1][x2];
          }
        }
      }
    }
  }
}
