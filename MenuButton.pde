class MenuButton
{
  PFont buttonFont = createFont("Georgia", 42);
  String buttonText;
  float x;
  float y;
  
  float buttonWidth = 200;
  float buttonHeight = 100;
  
  private float maxX;
  private float maxY;
  private float minX;
  private float minY;
  
  MenuButton(String _buttonText, float _x, float _y)
  {
    x = _x;
    y = _y;
    buttonText = _buttonText;
    
    textFont(buttonFont);
    textAlign(CENTER, CENTER);
    
    maxX = x + buttonWidth/2;
    minX = x - buttonWidth/2;
    maxY = y + buttonHeight/2;
    minY = y - buttonHeight/2;
  }
  
  void show()
  {
    text(buttonText, x, y);
    noFill();
    stroke(100);
    rect(x, y, 200, 100);
  }
  
  boolean isInsideButton(float _x, float _y)
  {
    if(_x >= minX && _x <= maxX) //<>//
    {
      if(_y >= minY && _y <= maxY)
      {
        return true;
      }
    }   
    return false;
  }
  
}
