class Cups {
  float x,y;
  boolean down = true;
  Cups(int xpos, int ypos){
    x = xpos;
    y = ypos;
  }
  
  void display(){
    rectMode(CENTER);
    rect(x,y,75,75);
  }
  void RaiseLowerCup(){
    y -= 100;
  }
  
  
  void move1(){
    if (cup[r1].x < xpos2)
    {
      cup[r1].x += speed;
    }
    if (cup[r1].x > xpos2)
    {
      cup[r1].x -= speed;
    }
  }
  
  void move2(){
    if (cup[r2].x < xpos1)
    {
      cup[r2].x += speed;
    }
    if (cup[r2].x > xpos1)
    {
      cup[r2].x -= speed;
    }
  }
}
