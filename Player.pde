class Player
{
  float x;
  float y;
  
  static final byte UP_DIRECTION = -1;
  static final byte DOWN_DIRECTION = 1;
  
  final float speed = 10;
  
  Player(float _x, float _y)
  {
    x = _x;
    y = _y;
    rectMode(CENTER);  //sets the origin of the player to his center 
  }
  
  void show()
  {
    fill(255);
    rect(x, y, 50, 250);
  }
  
  public void move(byte direction)
  {
    y += direction * speed;
  }
}
