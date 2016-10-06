
/* 20150429 pm , 20150430 am */

class walker
{
  int x , y ;
  int x0 , y0 ;  

  walker()
  {
    x = width / 2 ;
    y = height / 2 ;
    
  }
  
  void display()
  {
    stroke(0);
    point (x,y);
  }
  
  void step()
  {
    /*
    move with 4 directions
    
    int choice = int (random(4));
    if (choice == 1){
      x++;
    }
    else if (choice == 2){
      x--;
    }
    else if (choice == 3){
      y++;
    }
    else
    {
      y--;
    }
    */
    
    /* move with 9 directions */    
    x0 = int(random(3)) - 1;
    y0 = int(random(3)) - 1;
    
    x += x0;
    y += y0;
  }
}

walker w ;

void setup()
{
  size(640,360);
  w = new walker();
  background(255);
  
}

void draw()
{

  /* random walker , start */
  w.step();
  w.display();
  /* random walker , end */
  
  /* gaussian */  
  /* about gaussian , start ,
  float num = randomGaussian();
  float sd = 60 ; 
  float mean = 320;
  float x = num * sd + mean ;
  
  noStroke();
  fill(0 , 10);
  //noStroke();
  ellipse(x , 180 , 32 , 16);
  //println(x);
  About gaussian , end */

}

