/* THAT'S PONG!
*  But which are the commands?
*  P1: W for going up, S for going down
*  P2: U for going up, J for goind down
*  Space: Play the game, after leaving the menu.
*/


Ball ball;
Player player1;
Player player2;
void setup()
{
  size(800,600);
  background(0);
  frameRate(60);
  
  ball = new Ball(width/2, height/2);
  player1 = new Player(100, height/2);
  player2 = new Player(700, height/2);
}

void draw()
{
  clear(); 
  
  ball.show();
  player1.show();
  player2.show();
  ball.move();
  ball.checkCollisionsScreen();
}

void keyPressed()
{
  if(key == 'w')
  {
    player1.move(Player.UP_DIRECTION);
  }
  
  if(key == 's')
  {
    player1.move(Player.DOWN_DIRECTION);
  }
  
  if(key == 'u')
  {
    player2.move(Player.UP_DIRECTION);
  }
  
  if(key == 'j')
  {
    player2.move(Player.DOWN_DIRECTION);
  }
}
