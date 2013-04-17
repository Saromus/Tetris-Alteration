Shape shape;
Ground ground;
int numShapes = 2;
double windowWidth = 500;
double windowHeight = 750;
double blockRatio = 10;
double blockSize = windowWidth / blockRatio;
boolean onlyOnce;
boolean playing = true;

void setup() {
  size((int)windowWidth,(int)windowHeight);
  background(255);
  ground = new Ground(windowHeight,windowWidth,blockRatio);
  getNewShape();
  onlyOnce = true;
}

void draw() {
  if(playing){
    printGrid();
    ground.showSelf();
    shape.moveSelf();
    if(shape.touchingGround()){
      shape.stop();
      delay(200);
      if(ground.addShape(shape)){
        System.out.println("Game Over");
        playing = false;
        return;
      }
      getNewShape();
    }
  }
}

void getNewShape() {
  int random = (int)(Math.random() * numShapes) + 1;
  if(random == 1)
    shape = new SquareShape(windowWidth,blockRatio,ground);
  else if(random == 2)
    shape = new LineShape(windowWidth,blockRatio,ground);
}

void printGrid(){
  for(int x = 0; x < windowWidth; x += blockSize){
    for(int y = 0; y < windowHeight; y += blockSize){
      rect((float)x,(float)y,(float)blockSize,(float)blockSize);
    }
  }
}

void keyPressed(){
  if(key == 'd' && onlyOnce){
    shape.moveRight(blockSize);
    onlyOnce = false;
  }
  if(key == 'a' && onlyOnce){
    shape.moveRight(-blockSize);
    onlyOnce = false;
  }
  if(key == 'w' && onlyOnce){
    shape.drop();
    getNewShape();
    onlyOnce = false;
  }
  if(key == 's' && onlyOnce){
    shape.setSpeed(shape.getSpeed() * 2);
    onlyOnce = false;
  }
  if(key == 'e' && onlyOnce){
    shape.rotateClockwise();
    onlyOnce = false;
  }
  if(key == 'q' && onlyOnce){
    shape.rotateCounterClockwise();
    onlyOnce = false;
  }
}

void keyReleased(){
    onlyOnce = true;
    shape.resetSpeed();
}

