class ScoreUI
{
  private PFont scoreFont;
  private int player1Score = 0;
  private int player2Score = 0;
  private String scoreString;
  ScoreUI()
  {
    scoreFont = createFont("Arial", 64);
    textFont(scoreFont);
    textAlign(CENTER, CENTER);
    scoreString = new String();
  }
  
  void show()
  {
    scoreString = player1Score + " " + player2Score;
    
    text(scoreString, width/2, 30);
  }
  
  void incrementPlayer1Score()
  {
    player1Score++;
  }
  
  void incrementPlayer2Score()
  {
    player2Score++;
  }
  
  boolean someoneHasWon()
  {
    if(player1Score == 10 || player2Score == 10)
    {
      return true;
    }
    return false;
  }
  
  void reset()
  {
    player1Score = 0;
    player2Score = 0;
  }
}
