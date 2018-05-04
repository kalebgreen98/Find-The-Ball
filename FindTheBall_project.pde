Cups[] cup = new Cups[3]; //<>// //<>// //<>// //<>// //<>//
Balls b1 = new Balls(250, 250);
int r1, r2;
int i, x = 1;
float xpos1, xpos2, ypos1, ypos2;
float speed = 5;
boolean rndStrt = false, rndReset = false;
int rndCnt = 1, rndswtch = 3;
boolean trcker = false;
String tracker = "tracker v1.0";

void setup() {
  background(110);
  size(500, 500);
  textAlign(CENTER);
  textSize(25);
  cup[0] = new Cups(125, 250);
  cup[1] = new Cups(250, 250);
  cup[2] = new Cups(375, 250);
  key = 'r';
  for ( i = 0; i < 3; i++)
    cup[i].RaiseLowerCup();

  pickCup();
  ellipseMode(CENTER);
}

void draw() {
  background(110);

  //tracker button
  fill(50);
  noStroke();
  textSize(17);
  ellipse(width/2, (height/16) * 14, 50, 50);
  text(tracker, width/2, (height/16) * 14 + 40);

  fill(255, 30, 30);
  //stroke(50);
  //strokeWeight(4);
  b1.display();

  fill(255);
  stroke(100);
  strokeWeight(5);
  textSize(25);



  for ( i = 0; i < 3; i++)
    cup[i].display();
  //String mntr = x + "," + rndswtch;
  String instr1 = "Press 'x' to start round.";
  String instr2 = "Press 'x' for next round.";
  String rnd = "Round " + rndCnt;
  String reset = "Press 'r' to Reset";
  //displays text on screen
  if (rndStrt == false) { // displays intructions to start round 
    if (rndReset == false && rndCnt > 1)
      text(instr2, width/2, height/16);
    else if (rndReset == false && rndCnt == 1)
      text(instr1, width/2, height/16);
    else if (rndReset == true)
      text(reset, width/2, height/16);
  } else
    text(rnd, 400, 100); //displays round number

  tracker();

  //starts round
  if (rndReset == false && rndStrt == false && key == 'x') {
    rndStrt = true;
    for ( i = 0; i < 3; i++)
      cup[i].y = 250;
  }





  if (rndReset == true && key == 'r') {
    b1.move();
    text(instr1, width/2, height/16);
    rndReset = false;
  }


  //switches between rounds
  if (rndStrt == true) {
    key = 'b';
    if (x <= rndswtch)
      swtchem();
  }
}

void mouseClicked() {
  if (mouseX >= (width/2) - 50 && mouseX <= (width/2) + 50) {
    if (mouseY >= (height/16) * 14 - 50 && mouseY <= (height/16) * 14 + 50) {
      if (trcker == false) {
        tracker();
        trcker = !trcker;
      } else
        trcker = !trcker;
    }
  }

  if (rndStrt == true) {
    for (i=0; i <3; i++) {
      if (mouseX >= cup[i].x - (75/2) && mouseX <= cup[i].x + (75/2)) {
        if (mouseY >= cup[i].y - (75/2) && mouseY <= cup[i].y + (75/2)) {
          if ( i != 1) {
            rndStrt = false;
            x = 0;
            for (int j = 0; j < 3; j++)
              cup[j].RaiseLowerCup();
            rndswtch = 3;
            rndCnt = 1;
            reset();
          } else {
            rndStrt = false;
            x = 0;
            cup[1].RaiseLowerCup();
            rndswtch += 3;
            rndCnt++;
          }
        }
      }
    }
  }
}


void tracker() {
  if (trcker == true) {
    noStroke();
    fill(30, 255, 30);
    rect(b1.x, 350, 3, 15);
    ellipse(width/2, (height/16) * 14, 45, 45);
    //trcker = !trcker;
  }
}

void reset() {
  cup[0].x = 125;
  cup[1].x = 250;
  cup[2].x = 375;
  rndReset = true;
  pickCup();
} //<>//

void pickCup() {
  r1 = int(random(0, 3));
  r2 = int(random(0, 3));
  while (r2 == r1)
    r2 = int(random(0, 3));
  xpos1 = cup[r1].x;
  xpos2 = cup[r2].x;
}

void swtchem() {

  b1.move();
  if (cup[r1].x != xpos2)
    cup[r1].move1();
  if (cup[r2].x != xpos1)
    cup[r2].move2();

  if (x != rndswtch && cup[r1].x == xpos2 && cup[r2].x == xpos1) //picks two new cups to switch after previos cups reach their intended positions.
  {
    pickCup();
    x++;
  }
}
