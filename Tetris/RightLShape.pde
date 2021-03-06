class RightLShape extends Shape{
  ArrayList <String> blocks;
  String[] block;
  Ground ground;
  double bsize;
  int position = 1;
  
  RightLShape(double w,double r,Ground g){
    super(w,r,(w / 2) + ((w / r) / 2),0,g);
  }
  
  void rotateClockwise(){
      Block[] blocks = getBlocks();
      if(position == 1){
        blocks[0].adjustXY(getX() - (bsize / 2),getY() + (bsize / 2));
        blocks[2].adjustXY(getX() - (bsize / 2),getY() - bsize - (bsize / 2));
        blocks[3].adjustXY(getX() - bsize - (bsize / 2),getY() + (bsize / 2));
        position = 2;
      } else if(position == 2){
        blocks[0].adjustXY(getX() - (bsize / 2) - bsize,getY() - (bsize / 2));
        blocks[2].adjustXY(getX() + (bsize / 2),getY() - (bsize / 2));
        blocks[3].adjustXY(getX() - (bsize / 2) - bsize,getY() - (bsize / 2) - bsize);
        position = 3;
      } else if(position == 3){
        blocks[0].adjustXY(getX() - (bsize / 2),getY() - (bsize / 2) - bsize);
        blocks[2].adjustXY(getX() - (bsize / 2),getY() + (bsize / 2));
        blocks[3].adjustXY(getX() + (bsize / 2),getY() - (bsize / 2) -bsize);
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
    blocks[0] = new Block(block[0],x + (bsize / 2),y - (bsize / 2),blockSize,ground);
    blocks[1] = new Block(block[1],x - (bsize / 2),y - (bsize / 2),blockSize,ground);
    blocks[2] = new Block(block[2],x - (bsize / 2) - bsize,y - (bsize / 2),blockSize,ground);
    blocks[3] = new Block(block[3],x+ (bsize / 2),y + (bsize / 2),blockSize,ground);
    setBlocks(blocks);
  }
  
  void makeBlocks(){
    blocks = new ArrayList <String>();
    block = new String[4];
    blocks.add("tetrisgreen.jpg");
    blocks.add("tetrisgreenb.jpg");
    blocks.add("tetrisgreeng.png");
    blocks.add("tetrisgreenp.png");
    blocks.add("tetrisgreenx2.png");
    blocks.add("tetrisgreenx4.png");
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
