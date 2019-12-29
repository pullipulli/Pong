class ScoreUI
{
  PFont scoreFont;
  int player1Score = 0;
  int player2Score = 0;
  String scoreString;
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
}
