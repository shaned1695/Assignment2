Balls[] ball = new Balls[150];
float speed = 1;
float xpos = 0;
int start;
int gameState = 0;

void setup(){
  //p2d  enhances grahpics
  size(1000,800,P2D);
  //this start this timer
  start = millis();
  for(int i=0; i<ball.length; i++){
    ball[i] = new Balls();
  }
}

//this for the game to reset if you press space
void keyPressed()
{
  if(key == ' ' && gameState == 1)
  {
    gameState = 0;
  }
}

void draw(){
  //this increases the speed over time
  speed = speed+0.01;
  //gameState starts at 0 which plays the game
   switch(gameState)
   {
     case 0:
     background(0);
     translate(width/2,height/3);
     //this for loop spawn the stars
     for(int i=0; i<ball.length; i++)
     {
        ball[i].update();
        ball[i].show();
     }
     drawPlayer();
     drawTimer();
     fill(255);
     noStroke();
       break;
       //when the gameState is set to 1, the game freezes and GAME OVER will be displayed
     case 1:
       textSize(30);
       text("GAME OVER", 400,400);
       break;
   }
       
}

void drawPlayer()
{
  noStroke();
  fill(255,165,0);
  rect(xpos, height-290,20,20);
  //arrow key used to move the user
  if(keyPressed)
  {
    if (keyCode == RIGHT)
    {
      xpos += 7;
      
    }
    else if (keyCode == LEFT)
    {
      xpos -= 7;
    }
  }
  //to stop the user going off the screen
  if (xpos <-500 )
  {
    xpos = -495;
  }
  else if(xpos >480 )
  {
    xpos = 475;
  }
}
 //this keeps track of the time 
void drawTimer(){
  int timer = millis()-start;
  textSize(20);
  text("Score",  -475,0 - (height/4)-20);
  text(timer, -475,0 - (height/4));
 
  //THIS IS TRYING TO RESET THE TIMER WITH A NEW GAME
 /* 
  if(gameState == 1)
  {
    timer = 0;
  }
  */
}