/* THAT'S PONG!
*  But 
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
  player1 = new Player(700, height/2);
  player2 = new Player(100, height/2);
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
  if()
}
