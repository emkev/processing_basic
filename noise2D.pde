
/* 2d noise */

class cloud
{
  int x , y ;
  float n , t ;
  float tx , ty ;
  
  int a ;
  
  cloud()
  {
    t = 0 ; 
    a = 0 ;
  }

  void display()
  {
    a += 1 ;
    loadPixels();
    tx = 0.0;
    for(x = 0 ; x < width ; x++)
    {
      ty = 0.0;
      for(y = 0 ; y < height ; y++)
      {
        //n = map(noise(t) , 0 , 1 , 0 , 255);
        //t += 0.01;
        /* set pixel(x , y) with color value n */
        //float bright = n ;
        
        float bright = map(noise(tx , ty) , 0 , 1 , 0 , 255);
        /* 2015.12.21 , DANGEROUS code !!!
        println("noise = " , noise(tx , ty));
        println("bright = " , bright);
        Dangerous code !!!
        */
        pixels[x + y * width] = color(bright);
        ty += 0.01;
      }
      tx += 0.01;
    }
    updatePixels();
    
    println(" a = " , a) ;
  }

}

cloud c ; 

void setup()
{
  size(640 , 360);
  c = new cloud();
  background(255);
}

void draw()
{
  c.display();
}
