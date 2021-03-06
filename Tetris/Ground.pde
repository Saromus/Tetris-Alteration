class Ground{
  Block[][] grid;
  double blockSize;
  int playerScoreMultiplier = 0;
  boolean hasMultiplier = false;
  
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
    // Checks to see if there are lines.
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
          //empties the line
          if ((checkPowers(y,x)).equals("")){
            grid[y][x] = null;
          }
          else if ((checkPowers(y, x)).equals("two")) {
            println("x: " + y + " y: " + x);  // Debug Output
            setScoreMultiplier(2);
            grid[y][x] = null;
          }
          else if ((checkPowers(y, x)).equals("four")) {
            println("x: " + y + " y: " + x);
            setScoreMultiplier(4);
            grid[y][x] = null;
          }
          
          // Update player score, taking the score multiplier into consideration.
          // A single line clear gives the player +100 points.
          if (getScoreMultiplier() > 1)
            Tetris.accumulatePlayerScore(100 * getScoreMultiplier());
          else
            Tetris.accumulatePlayerScore(100);
          
          // Moves lines down.
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
    
  //checking if the block at grid[a][b] is a powerup
  String checkPowers(int a, int b){
    if (grid[a][b].checkBomb()){
      return "bomb";
    }
    if (grid[a][b].checkGBomb()){
      return "gravity";
    }
    if (grid[a][b].checkx2()){
      return "two";
    }
    if (grid[a][b].checkx4()){
      return "four";
    }
    if (grid[a][b].checkPika()){
      return "pikachu";
    }
    return "";
  }

  void setScoreMultiplier(int multiplier) {
    playerScoreMultiplier += multiplier;
  }
   
  int getScoreMultiplier() {
    return playerScoreMultiplier;
  }
  
}
