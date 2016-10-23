
/* 20150503 13:50
*/

class mouseball
{
  PVector location ;
  PVector velocity ;
  PVector acceleration ;
  float topspeed ;
  
  mouseball()
  {
    location = new PVector(random(0 , 200) , random(0 , 100));
    velocity = new PVector(0 , 0);
    acceleration = new PVector(0 , 0);
    topspeed = 10;
  }
  
  void update()
  {
    PVector mouse = new PVector(mouseX , mouseY);
    PVector dir = PVector.sub(mouse , location);
    dir.normalize();
    dir.mult(0.5);
    acceleration = dir;
    /* " limit() " limit value , but acce forever change */
    /* move direction by vector acce and vector velo adding */
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    
  }
  
  void checkedge()
  {
    if(location.x < 0 || location.x > width)
    {
      //velocity.mult(-1) ;
      velocity.x = (-1) * velocity.x ;
      
    }
    
    if(location.y < 0 || location.y > height)
    {
      //velocity.mult(-1);
      velocity.y = (-1) * velocity.y ; 
    }
    
  }
  
  void display()
  {
    ellipse(location.x , location.y , 16 , 16);
  }
}


/*  part of main function */

mouseball[] mbs = new mouseball[10] ;

void setup()
{
  size(640 , 360);

  for(int i = 0 ; i < mbs.length ; i++)
  {
    mbs[i] = new mouseball() ;
  }
}

void draw()
{
  background(200);
  
  for(int i = 0 ; i < mbs.length ; i++)
  {
    mbs[i].update();
    mbs[i].checkedge();
    mbs[i].display();
  }
  
}
