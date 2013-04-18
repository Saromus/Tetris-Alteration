class TShape extends Shape{
  final String block = "tetrisred.jpg";
  Ground ground;
  double bsize;
  
  TShape(double w,double r,Ground g){
    bsize = w - r;
    createSelf(w,r,-bsize / 2,g);
  }
  
  createSelf(double wWidth,double bRatio,double ypos, Ground g){
    x = (wWidth / 2) + (bsize / 2);
    y = ypos;
    ground = g;
    createShape(blockSize,x,y);
  }
  
  void createShape(double blockSize, double x, double y){
    Ground ground = getGround();
    bsize = blockSize;
    Block[] blocks = new Block[4];
    blocks[0] = new Block(block2,x,y - (blockSize * 2),blockSize,ground);
    blocks[1] = new Block(block,x,y - blockSize,blockSize,ground);
    blocks[2] = new Block(block,x,y,blockSize,ground);
    blocks[3] = new Block(block,x,y + blockSize,blockSize,ground);
    setBlocks(blocks);
  }
}
