abstract class Shape{
  Block[] blocks = new Block[4];
  double x;
  double y;
  double minSpeed = 1;
  double speedDown = minSpeed;
  double speedRight = 0;
  double bsize;
  Ground ground;
  
  Shape(double wWidth,double bRatio,double xpos, double ypos, Ground g){ 
    x = xpos; 
    y = ypos;
    ground = g;
    double blockSize = wWidth / (double)bRatio;
    bsize = blockSize;
    createShape(blockSize,x,y);
  }
  
  void drop(){
    while(!touchingGround())
      moveSelf();
      ground.addShape(this);
    stop();
  }
  
  boolean touchingGround(){
    for(Block block: blocks){
      if(block.touchingGround())
        return true;
    }
    return false;
  }
  
  boolean touchingLeftWall(){
    for(Block block: blocks){
      if(block.touchingLeftWall())
        return true;
    }
    return false;
  }
  
  boolean inLeftWall(){
    for(Block block: blocks){
      if(block.inLeftWall())
        return true;
    }
    return false;
  }
  
  boolean touchingRightWall(){
    for(Block block: blocks){
      if(block.touchingRightWall())
        return true;
    }
    return false;
  }
  
  boolean inRightWall(){
    for(Block block: blocks){
       if(block.inRightWall()) 
        return true;
    }
    return false;
  }
  
  void setSpeed(double speed){
    speedDown = speed;
  }
  
  double getSpeed(){
    return speedDown;
  }
  
  void resetSpeed(){
    speedDown = minSpeed;
  }
  
  double getX(){
    return x;
  }
  
  double getY(){
    return y;
  }
  
  Block[] getBlocks(){
    return blocks;
  }
  
  void setBlocks(Block[] blockes){
    blocks[0] = blockes[0];
    blocks[1] = blockes[1];
    blocks[2] = blockes[2];
    blocks[3] = blockes[3];
  }
  
  void moveSelf(){
    if(speedRight > 0 && touchingRightWall())
      speedRight = 0;
    if(speedRight < 0 && touchingLeftWall())
      speedRight = 0;
    for(Block block:blocks){
      block.moveSelf(speedDown,speedRight);
    }
    x += speedRight;
    y += speedDown;
    speedRight = 0;
  }
  
  void moveRight(double speed){
    speedRight = speed;
  }
  
  Ground getGround(){
    return ground;
  }
  
  void stop(){
    speedDown = 0;
  }
  
  Block makeCopy(Block block){
    return new Block(block.getType(),block.getX(),block.getY(),block.getSize(),ground);
  }
  
  boolean invalidMovement(){
    if(inRightWall())
      return true;
    if(inLeftWall())
      return true;
    if(touchingGround())
      return true;
    return false;
  }
  
  abstract void rotateClockwise();
  abstract void rotateCounterClockwise();
  abstract void createShape(double blockSize,double x, double y);
  abstract void makeBlocks();
}
