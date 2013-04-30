class LineShape extends Shape{
  ArrayList <String> blocks;
  String[] block;
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
    blocks[0] = new Block(block[0],x,y - (blockSize * 2),blockSize,ground);
    blocks[1] = new Block(block[1],x,y - blockSize,blockSize,ground);
    blocks[2] = new Block(block[2],x,y,blockSize,ground);
    blocks[3] = new Block(block[3],x,y + blockSize,blockSize,ground);
    setBlocks(blocks);
  }
  
  void makeBlocks(){
    blocks = new ArrayList <String>();
    block = new String[4];
    blocks.add("tetrisblue.jpg");
    blocks.add("tetrisblueb.jpg");
    blocks.add("tetrisblueg.jpg");
    blocks.add("tetrisbluep.png");
    blocks.add("tetrisbluex2.png");
    blocks.add("tetrisbluex4.png");
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
