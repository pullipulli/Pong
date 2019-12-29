class Ball 
{
  float x;
  float y;
  float initialX;
  float initialY;
  float radius = 30;

  ScoreUI score = new ScoreUI();
  //collisions variables
  float upperBorder = y - (radius / 2);
  float bottomBorder = y + (radius / 2);
  float rightBorder = x + (radius / 2);
  float leftBorder = x - (radius / 2);

  float ySpeed = random (3, 5);
  float xSpeed = random (3, 5);

  byte xDirection = 1;
  byte yDirection = 1;

  boolean hasBeenMadeAPoint = false;

  Ball(float _x, float _y, ScoreUI _score)
  {
    x = _x;
    y = _y;
    initialX = x;
    initialY = y;
    score = _score;
  }

  void reset()
  {
    x = initialX;
    y = initialY;
    upperBorder = y - (radius / 2);
    bottomBorder = y + (radius / 2);
    rightBorder = x + (radius / 2);
    leftBorder = x - (radius / 2);
    hasBeenMadeAPoint = false;
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

  void updateScoreObject(ScoreUI _score)
  {
    score = _score;
  }

  void checkCollisionsScreen()
  {
    updateColliders();
    if ( bottomBorder >= height  ||  upperBorder <= 0)
    {
      yDirection *= -1;
      ySpeed = random (3, 5);
      xSpeed = random (3, 5);
    }

    if (leftBorder <= 0)
    {
      score.incrementPlayer1Score();
      hasBeenMadeAPoint = true;
    } 

    if (rightBorder >= width)
    {
      score.incrementPlayer2Score();
      hasBeenMadeAPoint = true;
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
    updateColliders();

    boolean isRightPlayer;

    if (other.x >= width/2) // I assume that  the right player is in the right part of the screen
    {
      isRightPlayer = true;
    } else
    {
      isRightPlayer = false;
    }

    if (isRightPlayer)
    {
        if (rightBorder >= other.leftSideX && leftBorder <= other.rightSideX)
        {
          if (y > other.upperY && y < other.bottomY) //if the ball is touching the paddle
          {
            xDirection *= -1;
            ySpeed = random (3, 5);
            xSpeed = random (3, 5);
          }
        }
    } else
    {
      if (leftBorder <= other.rightSideX && rightBorder >= other.leftSideX)
      {
        if (y > other.upperY && y < other.bottomY)
        {
          xDirection *= -1;
          ySpeed = random (3, 5);
          xSpeed = random (3, 5);
        }
      }
    }
  }
  

}
