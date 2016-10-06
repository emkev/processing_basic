
/* noise walker , 20150430 15:19 */

class walker
{
  float x , y ;
  float tx , ty ;
  
  walker()
  {
    x = 0 ;
    y = 0 ;
    tx = 0 ;
    ty = 10000;
  }
  
  void step()
  {
    x = map(noise(tx) , 0 , 1 , 0 , width);
    y = map(noise(ty) , 0 , 1 , 0 , height);
    tx += 0.01;
    ty += 0.01;
  }
  
  void display()
  {
    ellipse(x , y , 16 , 16);
  }
}

walker w ;
/*
void setup()
{
  size(640 , 360);
  w = new walker();
  background(255);
}

void draw()
{
  w.step();
  w.display();
}
*/
