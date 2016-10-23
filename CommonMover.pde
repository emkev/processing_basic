

/* 20150501 18:43
20150502 14:01 add acceleration , 
14:18 add perlin as acceleration
*/

class Mover
{
  PVector location ;
  PVector velocity ;
  PVector acceleration ;
  float topspeed ;
  /* acceleration from noise function .   noise fac , start */
  //float tx , ty , ax , ay;
  /* noise fac , end */
  
  Mover()
  {
    location = new PVector(width / 2 , height / 2);
    velocity = new PVector(0 , 0);
    acceleration = new PVector(4 , 3);
    topspeed = 10;
    /* noise fac , start */
    //tx = 0;
    //ty = 10000;
    /* noise fac , end */
  }
  
  void update()
  {
    /* noise fac , start */
    
    //ax = noise(tx);
    //ay = noise(ty);
    /* how to regive value to a vector ? 
    20150505 12:30 , make vector noisevec with ax and ay .  
    */
    //PVector noisevec = new PVector(ax , ay);

    //acceleration = noisevec;
    //println(" ax = " , ax);
    //println(" ay = " , ay);
    
    /* noise fac , end */
    
    /* " limit() " limit value , but acce forever change */
    /* move direction by vector acce and vector velo adding */
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    
    acceleration.mult(0);
    /* noise fac , start */
    //tx += 0.01;
    //ty += 0.01;
    /* noise fac , end */
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


/* part of  main function  */

Mover m ;

void setup()
{
  size(640 , 360) ;
  m = new Mover() ;
}

void draw()
{
  background(200) ;
  
  m.update();
  m.checkedge();
  m.display();
  
}
