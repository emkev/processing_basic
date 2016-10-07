
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
  
  translate(width / 2 , height / 2 , -(width / 2));
  rotateY(map(mouseX , 0 , width , -PI , PI));
  stroke(100);
  box(400);
  
  rotateX(map(mouseY , 0 , height , PI , -PI));
  stroke(150);
  box(200);
}
