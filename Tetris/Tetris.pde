Shape shape;
Ground ground;
int numShapes = 2;
double windowWidth = 500;
double windowHeight = 750;
double blockRatio = 10;
double blockSize = windowWidth / blockRatio;
static int playerScore = 0;
boolean onlyOnce;
boolean playing = true;

void setup() {
  size((int)windowWidth + 300, (int)windowHeight);
  background(255);
  ground = new Ground(windowHeight, windowWidth, blockRatio);
  getNewShape();
  onlyOnce = true;
  PFont f = createFont("Arial", 16, true);
  textFont(f);
}

void draw() {
  if (playing) {
    fill(255);
    printGrid();
    ground.showSelf();
    showScoreboard();
    shape.moveSelf();
    if (shape.touchingGround()) {
      shape.stop();
      delay(200);
      if (ground.addShape(shape)) {
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
  if (random == 1)
    shape = new SquareShape(windowWidth, blockRatio, ground);
  else if (random == 2)
    shape = new LineShape(windowWidth, blockRatio, ground);
}

void printGrid() {
  for (int x = 0; x < windowWidth; x += blockSize) {
    for (int y = 0; y < windowHeight; y += blockSize) {
      rect((float)x, (float)y, (float)blockSize, (float)blockSize);
    }
  }
}

void keyPressed() {
  if (key == 'd' && onlyOnce) {
    shape.moveRight(blockSize);
    onlyOnce = false;
  }
  if (key == 'a' && onlyOnce) {
    shape.moveRight(-blockSize);
    onlyOnce = false;
  }
  if (key == 'w' && onlyOnce) {
    shape.drop();
    getNewShape();
    onlyOnce = false;
  }
  if (key == 's' && onlyOnce) {
    shape.setSpeed(shape.getSpeed() * 2);
    onlyOnce = false;
  }
  if (key == 'e' && onlyOnce) {
    shape.rotateClockwise();
    onlyOnce = false;
  }
  if (key == 'q' && onlyOnce) {
    shape.rotateCounterClockwise();
    onlyOnce = false;
  }
}

void keyReleased() {
  onlyOnce = true;
  shape.resetSpeed();
}

void showScoreboard() {
  int xPos = 584;
  String scoreboard = "Player Score: " + getPlayerScore();
  fill(255);
  textSize(20);
  rect(xPos, 227, scoreboard.length() * 10, 30);
  fill(0);
  text(scoreboard, xPos + 6, 250);
  
}

static void setPlayerScore(int score) {
  playerScore = score;
}

static int getPlayerScore() {
  return playerScore;
}
