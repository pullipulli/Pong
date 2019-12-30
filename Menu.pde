class Menu
{
  
  MenuButton PlayButton;
  MenuButton QuitButton;

  Menu()
  {
    PlayButton = new MenuButton("Play Pong!", width/2, 150);
    QuitButton = new MenuButton("Quit :c", width/2, 300);
  }

  void show()
  {
    PlayButton.show();
    QuitButton.show();
  }
  
  void quitGame()
  {
    exit();
  }
}
