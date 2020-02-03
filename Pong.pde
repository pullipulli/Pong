/* THAT'S PONG!
 *  But which are the commands?
 *  P1: W for going up, S for going down
 *  P2: U for going up, J for goind down
 *  Space: Play the game, after leaving the menu.
 */

Ball ball;
Player player1;
Player player2;
ScoreUI score;
Menu mainMenu;

boolean playGame = false;
boolean ballLaunched = false;

final int FRAMERATE = 60;
final float deltaTime = 1f / FRAMERATE;

void setup()
{
  size(800, 600);
  background(0);
  frameRate(FRAMERATE);

  ball = new Ball(width/2, height/2, score);
  player1 = new Player(100, height/2);
  player2 = new Player(700, height/2);
  score = new ScoreUI();
  mainMenu = new Menu();
}

void draw()
{
  clear(); 
  if(playGame)
  {
    player1.show();
    player2.show();
    ball.show();
    line(width/2, 0, width/2, height);
    if(ballLaunched)
    {
      player1.move();
      player2.move();
      ball.move();
      ball.updateScoreObject(score);
      ball.checkCollisionWith(player1);
      ball.checkCollisionWith(player2);
      ball.checkCollisionsScreen();
      if (ball.hasBeenMadeAPoint)
      {
        ballLaunched = false;
        reset();
        if(score.someoneHasWon())
        {
          score.reset();
          playGame = false;
        }
      }
    }
    score.show();
  }
  else
  {
    mainMenu.show();
  }
}

void keyPressed()
{
  if (key == 'w')
  {
    player1.setDirection(Player.UP_DIRECTION);
  } else if (key == 's')
  {
    player1.setDirection(Player.DOWN_DIRECTION);
  }
  if (key == 'u')
  {
    player2.setDirection(Player.UP_DIRECTION);
  } else if (key == 'j')
  {
    player2.setDirection(Player.DOWN_DIRECTION);
  }
}

void keyReleased()
{
  if (key == 'w' || key == 's')
  {
    player1.setDirection(Player.NO_DIRECTION);
  } else if (key == 'u' || key == 'j')
  {
    player2.setDirection(Player.NO_DIRECTION);
  }
  
  if(key == ' ')
  {
     ballLaunched = true;
  }
}

void mouseReleased()
{
  if (mouseButton == LEFT)
  {
    if(!playGame)
    {
      if (mainMenu.PlayButton.isInsideButton(mouseX, mouseY))
      {
        playGame = true;
      } else if (mainMenu.QuitButton.isInsideButton(mouseX, mouseY))
      {
        mainMenu.quitGame();
      }
    }
  }
}

void reset()
{
  ball.reset();
  player1.reset();
  player2.reset();
}
