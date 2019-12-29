class Player
{
  float x;
  float y;
  
  float initialX;
  float initialY;
  
  float longSide;
  float shortSide;
  float upperY;
  float bottomY;
  float leftSideX;
  float rightSideX;
  
  static final byte UP_DIRECTION = -1;
  static final byte DOWN_DIRECTION = 1;
  static final byte NO_DIRECTION = 0;
  
  byte direction;
  
  final float speed = 10;
  
  Player(float _x, float _y)
  {
    x = _x;
    y = _y;
    initialX = x;
    initialY = y;
    rectMode(CENTER);  //sets the origin of the player to his center
    longSide = 250;
    shortSide = 25;
  }
  
  void show()
  {
    fill(150, 200, 30);
    rect(x, y, shortSide, longSide);
  }
  
  void move()
  {
    y += direction * speed;
    updateBorders();
  }
  
  void setDirection(byte _direction)
  {
    direction = _direction;
  }
  
  void updateBorders()
  {
    bottomY = y + (longSide/2);
    upperY = y - (longSide/2);
    leftSideX = x - (shortSide / 2); 
    rightSideX = x + (shortSide / 2);
  }
  
  void reset()
  {
    x = initialX;
    y = initialY;
  }
}
