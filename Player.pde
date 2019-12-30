class Player
{
  float x;
  float y;
  
  float initialX;
  float initialY;
  
  float longSide;
  float shortSide;
  float maxY;
  float minY;
  float maxX;
  float minX;
  
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
    maxY = y + (longSide/2);
    
    minY = y - (longSide/2);
    minX = x - (shortSide / 2); 
    maxX = x + (shortSide / 2);
    
    line(minX, maxY, 0, maxY);
    line(maxX, minY,0,minY);
    line(minX, 0, minX, height);
    line(maxX, 0, maxX, height);
  }
  
  void reset()
  {
    x = initialX;
    y = initialY;
  }
}
