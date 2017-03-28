
/* 2016.10.05 */

void setup()
{
  size(500 , 500 , P3D);
  noFill();
  smooth(); 
}

void draw()
{
  background(255);
  
  translate( width/2 , height/2 , (-1)*(width/2) ) ;
  
  /*  If rotateY() is called within the draw() , 
      the transformation is RESET when the loop begins again .
   */

  rotateY( map(mouseX , 0 , width , 0 , PI*2) ) ;
  
  stroke(100);
  box(400);
  
  rotateX( map(mouseY , 0 , height , 0 , PI*2) ) ;
  
  stroke(150);
  box(200);
}
