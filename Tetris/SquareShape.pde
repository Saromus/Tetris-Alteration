class SquareShape extends Shape{
  final String block = "tetrisyellow.jpg";
  Ground ground;
  double bsize;

  SquareShape(double w,double r,Ground g){
   super(w,r,w / 2,-(w / r),g);
  }
  
  void rotateClockwise(){
    Block[] blocks = getBlocks();
    blocks[0].adjustXY(getX(),getY() - bsize);
    blocks[1].adjustXY(getX(),getY());
    blocks[2].adjustXY(getX() - bsize,getY() - bsize);
    blocks[3].adjustXY(getX() - bsize,getY());
    Block temp = makeCopy(blocks[0]);
    blocks[0] = makeCopy(blocks[2]);
    blocks[2] = makeCopy(blocks[3]);
    blocks[3] = makeCopy(blocks[1]);
    blocks[1] = makeCopy(temp);
    setBlocks(blocks);
  }
  
  void rotateCounterClockwise(){
    rotateClockwise();
  }
  
  void createShape(double blockSize, double x, double y){
    Ground ground = getGround();
    bsize = blockSize;
    Block[] blocks = new Block[4];
    blocks[0] = new Block(block,x - blockSize,y - blockSize,blockSize,ground);
    blocks[1] = new Block(block,x,y - blockSize,blockSize,ground);
    blocks[2] = new Block(block,x - blockSize,y,blockSize,ground);
    blocks[3] = new Block(block,x,y,blockSize,ground);
    setBlocks(blocks);
  }
}
