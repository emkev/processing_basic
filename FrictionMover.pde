
/* 20150509 11:32 */

class fricmover
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed , mass;
  float mew , n , g;
  PVector gravity;
  PVector wind;
  
  fricmover()
  {
    location = new PVector(width / 2 , height /2);
    velocity = new PVector(0 , 0);
    acceleration = new PVector(0 , 0);
    topspeed = 10.0;  
    mass = 1.0;
    mew = 0.01;
    n = 1.0;
    g = 9.8;
    
    /* cache ? */
    //gravity = new PVector(0 , mass * g);
    //println(" mg = " , mass * g);
    
    gravity = new PVector(0 , 0.1);
    wind = new PVector(0.01 , 0.1);
  }
  
  void update()
  {
    applyforce(gravity);
    applyforce(wind);
    /* apply friction when mover reaches the edge of window . */
    /* note difference between = and == ! */
    if (location.x == 0 || location.x == width 
     || location.y == 0 || location.y == height)
    {    
      applyforce(calfriction());
    }
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    
    /* mover disappears after moving two or three times . 
       Because acceleration has not been cleared ( mult(0) ) 
       every time .  
    */
    acceleration.mult(0);
  }
  
  PVector calfriction()
  {
    PVector fr = velocity.get();
    fr.normalize();
    fr.mult((-1) * mew * n);
    return fr;
  }
  
  void applyforce(PVector force)
  {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }
  
  void checkedge()
  {
    if(location.x <= 0 || location.x >= width)
    {
      velocity.x = (-1) * velocity.x;  
    } 
    if(location.y <= 0 || location.y >= height)
    {
      velocity.y = (-1) * velocity.y;
    } 
  }
  
  void display()
  {
    ellipse(location.x , location.y , 16 , 16);
  }
  
}


/* part of main function  */

fricmover f ;

void setup()
{
  size(640 , 360);
  f = new fricmover();
  
}

void draw()
{
  background(200);
  
  f.update();
  f.checkedge();
  f.display();
  
}
