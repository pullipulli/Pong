class Player
{
  float x;
  float y;
  
  
  float speed = 5;
  
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
  
  void move(byte direction)
  {
    y += direction * speed;
  }
}
