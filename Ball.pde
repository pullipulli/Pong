class Ball 
{
  float x;
  float y;
  float radius = 40;
  
  //collisions variables
  float upperBorder = y - (radius / 2);
  float bottomBorder = y + (radius / 2);
  float rightBorder = x + (radius / 2);
  float leftBorder = x - (radius / 2);
  
  float xSpeed = 3;
  float ySpeed = 3;
  
  byte xDirection = 1;
  byte yDirection = 1;
  
  Ball(float _x, float _y)
  {
    x = _x;
    y = _y;
  }
  
  void show()
  {
    fill(255);
    circle(x, y, radius);
  }

  void move()
  {
    x += xSpeed * xDirection;
    y += ySpeed * yDirection;
  }
  
  void checkCollisionsScreen()
  {
    updateColliders();
    if( bottomBorder >= height  ||  upperBorder <= 0)
    {
      yDirection *= -1;
    }
    
    if(rightBorder >= width)
    {
      //TODO add a point to the player 1
    }
    
    if(leftBorder <= 0)
    {
      //TODO add a point to the player 2
    } 
  }
  
  void updateColliders()
  {
    upperBorder = y - (radius / 2);
    bottomBorder = y + (radius / 2);
    rightBorder = x + (radius / 2);
    leftBorder = x - (radius / 2);
  }
  
  void checkCollisionWith(Player other)
  {
    //if a player collide with the ball
      //move the ball in the opposite direction
  }
}
