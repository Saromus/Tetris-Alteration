class LineShape extends Shape {
  final String block1 = "tetrisblue.jpg";
  final String block2 = "tetrisblueb.jpg";
  final String block3 = "tetrisblueg.jpg";
  final String block4 = "tetrisbluep.png";
  final String block5 = "tetrisbluex2.png";
  final String block6 = "tetrisbluex4.png";
  
  Ground ground;
  double bsize;
  int position = 1;

  LineShape(double w, double r, Ground g) {
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

  void createShape(double blockSize, double x, double y) {
    Ground ground = getGround();
    bsize = blockSize;
    Block[] blocks = new Block[4];
    blocks[0] = new Block(chooseBlock(), x, y - (blockSize * 2), blockSize, ground);
    blocks[1] = new Block(chooseBlock(), x, y - blockSize, blockSize, ground);
    blocks[2] = new Block(chooseBlock(), x, y, blockSize, ground);
    blocks[3] = new Block(chooseBlock(), x, y + blockSize, blockSize, ground);
    setBlocks(blocks);
  }

  String chooseBlock() {
    int choose = (int)random(200);
    String chosenblock="";
    if ((choose>10)&&(choose<15)) {
      chosenblock=block2;
    }else
    if ((choose>50)&&(choose<55)) {
      chosenblock=block3;
    }else
    if ((choose>80)&&(choose<85)) {
      chosenblock=block4;
    }else
    if ((choose>110)&&(choose<115)) {
      chosenblock=block5;
    }else
    if ((choose>148)&&(choose<152)) {
      chosenblock=block6;
    /*int choose = (int)random(60);
    String chosenblock="";
    if ((choose>=10)&&(choose<20)) {
      chosenblock=block2;
    } else if ((choose>=20)&&(choose<30)) {
      chosenblock=block3;
    } else if ((choose>=30)&&(choose<40)) {
      chosenblock=block4;
    } else if ((choose>=40)&&(choose<50)) {
      chosenblock=block5;
    } else if ((choose>=50)&&(choose<=60)) {
      chosenblock=block6;*/
    } else {
      chosenblock=block1;
    }
    return chosenblock;
  }
}

