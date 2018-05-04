class Balls {
  float x,y;
  boolean b = true;
  Balls(int xpos, int ypos){
    x = xpos;
    y = ypos;
  }
  
  void display(){
    ellipseMode(CENTER);
    ellipse(x,y,50,50);
  }
    
  
  void move(){
    x = cup[1].x;
  }
  
  
}