class Balls{
  //balls start off small using x,y,z
  //grow bigger using the variables xx, yy
  float x;
  float y;
  float z;
  float previousz;
  
  Balls(){
    x = random(-width,width);
    y = random(-height,height);
    z = random(width);
    previousz = z;
  }
  
  void update(){
    z=z-speed;
    if(z<1){
      z = width;
      x = random(-width,width);
      y = random(-height,height);
      previousz = z;
    }
    

  }
  
  void show(){
    fill(255);
    noStroke();
    float xx = map(x/z,0,1,0,width);
    float yy = map(y/z,0,1,0,height);
    float rad = map(z,0,width,100,0);
    ellipse(xx,yy,rad,rad);
    float previousx = map(x/previousz,0,1,0,width);
    float previousy = map(y/previousz,0,1,0,height);
    previousz = z;
    stroke(255);
    line(previousx,previousy,xx,yy);
    
    //collision: if the player collides with a ball, that particular ball will be reset and the gameState will be changed
    if (Math.abs(xpos - xx) < rad && Math.abs(height-290 - yy) < rad) 
    {
      clear();
      x = 0;
      y = 0;
      z = 0;
      previousz = 0;
      gameState = 1;
    }
  }
}