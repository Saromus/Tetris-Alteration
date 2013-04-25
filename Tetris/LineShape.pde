class LineShape extends Shape{
  final String block = "tetrisblue.jpg";
  final String block2 = "tetrispink.jpg";
  Ground ground;
  double bsize;
  int position = 1;
  
  LineShape(double w,double r,Ground g){
    super(w,r,w / 2,(w / r),g);
  }
  
  void rotateClockwise(){
      Block[] blocks = getBlocks();
      if(position == 1){
        blocks[0].adjustXY(getX() + bsize,getY());
        blocks[1].adjustXY(getX(),getY());
        blocks[2].adjustXY(getX() - bsize,getY());
        blocks[3].adjustXY(getX() - (bsize * 2),getY());
        position = 2;
      } else if(position == 2){
        blocks[0].adjustXY(getX(),getY() + bsize);
        blocks[1].adjustXY(getX(),getY());
        blocks[2].adjustXY(getX(),getY() - bsize);
        blocks[3].adjustXY(getX(),getY() - (bsize * 2));
        position = 3;
      } else if(position == 3){
        blocks[3].adjustXY(getX() + bsize,getY());
        blocks[2].adjustXY(getX(),getY());
        blocks[1].adjustXY(getX() - bsize,getY());
        blocks[0].adjustXY(getX() - (bsize * 2),getY());
        position = 4;
      } else if(position == 4){
        createShape(bsize,getX(),getY());
        position = 1;
      }
      if(invalidMovement()){
        rotateCounterClockwise();
      }
  }
  
  void rotateCounterClockwise(){
    position -= 2;
    if(position <= 0)
      position += 4;
      rotateClockwise();
  }
  
  void createShape(double blockSize, double x, double y){
    Ground ground = getGround();
    bsize = blockSize;
    Block[] blocks = new Block[4];
    blocks[0] = new Block(block,x,y - (blockSize * 2),blockSize,ground);
    blocks[1] = new Block(block,x,y - blockSize,blockSize,ground);
    blocks[2] = new Block(block,x,y,blockSize,ground);
    blocks[3] = new Block(block,x,y + blockSize,blockSize,ground);
    setBlocks(blocks);
  }
}
