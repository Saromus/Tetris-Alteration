class Block{
  double x;
  double y;
  double blockSize;
  PImage blockType;
  String block;
  Ground ground;
  
  Block(String bloc,double X,double Y,double sizes, Ground g){
    block = bloc;
    x = X;
    y = Y;
    ground = g;
    blockSize = sizes;
    blockType = loadImage(block);
    showSelf();
  }
  
  void showSelf(){
    image(blockType,(float)x,(float)y,(float)blockSize,(float)blockSize);
  }
  
  void moveSelf(double speedDown, double speedRight){
    y += speedDown;
    x += speedRight;
    showSelf();
  }
  
  void moveDownARow(){
    y += 50;
    showSelf();
  }
  
  boolean touchingGround(){
    return ground.touchingGround(x,y);
  }
  
  boolean touchingLeftWall(){
    return ground.touchingLeftWall(x,y);
  }
  
  boolean inLeftWall(){
    return ground.inLeftWall(x,y);
  }
  
  boolean touchingRightWall(){
    return ground.touchingRightWall(x,y);
  }
  
  boolean inRightWall(){
    return ground.inRightWall(x,y);
  }
  
  double getX(){
    return x;
  }
  
  double getY(){
    return y;
  }
  
  void adjustXY(double newX, double newY){
    x = newX;
    y = newY;
  }
  
  String getType(){
    return block;
  }
  
  double getSize(){
    return blockSize;
  }
  
  boolean checkBomb(){
    String name = getType();
    if (name.charAt(name.length()-5)==('b')){
      return true;
    }
    return false;
  }
  
  boolean checkGBomb(){
    String name = getType();
    if (name.charAt(name.length()-5)==('g')){
      return true;
    }
    return false;
  }
  
  boolean checkx2(){
    String name = getType();
    if (name.charAt(name.length()-5)==('2')){
      return true;
    }
    return false;
  }
  
  boolean checkx4(){
    String name = getType();
    if (name.charAt(name.length()-5)==('4')){
      return true;
    }
    return false;
  }
  
  boolean checkPika(){
    String name = getType();
    if (name.charAt(name.length()-5)==('p')){
      return true;
    }
    return false;
  }
}
