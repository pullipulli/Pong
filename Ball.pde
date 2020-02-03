class Ball 
{
  private float x;
  private float y;
  private float initialX;
  private float initialY;
  private float radius = 30;

  private ScoreUI score = new ScoreUI();
  //collisions variables
  private float upperBorder = y - (radius / 2);
  private float bottomBorder = y + (radius / 2);
  private float rightBorder = x + (radius / 2);
  private float leftBorder = x - (radius / 2);
  
  final float collisionDelay = 500;      //the minimum time between 2 collisions, in milliseconds
  float collisionTime = 0;
  
  private float ySpeed = random (200, 300);
  private float xSpeed = random (200, 300);

  private byte xDirection = 1;
  private byte yDirection = 1;

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
    x += xSpeed * xDirection * deltaTime;
    y += ySpeed * yDirection * deltaTime;
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
      ySpeed = random (200, 300);
      xSpeed = random (200, 300);
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

    boolean isColliding = !(y < other.minY || y > other.maxY || x > other.maxX || x < other.minX);
    if(millis() - collisionTime >= collisionDelay)
    if (isColliding)  //if the ball is touching the paddle
    {
        collisionTime = millis();
        xDirection *= -1;
        ySpeed = random (200, 300);
        xSpeed = random (200, 300);
    }
    
  }
  
}
