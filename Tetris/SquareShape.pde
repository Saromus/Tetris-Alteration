class SquareShape extends Shape{
  ArrayList <String> blocks;
  String[] block;
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
    blocks[0] = new Block(block[0],x - blockSize,y - blockSize,blockSize,ground);
    blocks[1] = new Block(block[1],x,y - blockSize,blockSize,ground);
    blocks[2] = new Block(block[2],x - blockSize,y,blockSize,ground);
    blocks[3] = new Block(block[3],x,y,blockSize,ground);
    setBlocks(blocks);
  }
  
  void makeBlocks(){
    blocks = new ArrayList <String>();
    block = new String[4];
    blocks.add("tetrisyellow.jpg");
    blocks.add("tetrisyellowb.jpg");
    blocks.add("tetrisyellowg.png");
    blocks.add("tetrisyellowp.png");
    blocks.add("tetrisyellowx2.png");
    blocks.add("tetrisyellowx4.png");
    int count = 0;
    while(count < 4){
      int choose = (int)random(200);
      int chosenblock = 0;
      if ((choose > 10) && (choose < 15)) {
        chosenblock = 1;
      }else
      if ((choose > 50) && (choose < 55)) {
        chosenblock = 2;
      }else
      if ((choose > 80) && (choose < 85)) {
        chosenblock = 3;
      }else
      if ((choose > 110) && (choose < 115)) {
        chosenblock = 4;
      }else
      if ((choose > 148) && (choose < 152)) {
        chosenblock = 5;
      }
      block[count ++] = blocks.get(chosenblock);
    }
  }
}
