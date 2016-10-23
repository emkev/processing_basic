
/* 2016.10.15 */

float x , y , z ;   // current position
float velocity = 120.0 ;
float alpha = 30.0 ;
float gamma = 60.0 ;
float g = 9.8 ;   // acceleration due to gravity

float time = 0.0 ;
float dt = 0.1 ;   // changing rate of time
float rotX = 0.0 , rotY = 0.0 ;


void setup()
{
  size(300 , 400 , P3D) ;
  smooth();
  x = 0.0 ;
  y = 0.0 ;
  z = 0.0 ;
}


void draw()
{
  float b , Lx , Ly , Lz ;
  time += dt ;
  
  background(0);
  
  
  b = cos((90.0 - alpha) * 3.14 / 180.0) ;
  Lx = b * cos(gamma * 3.14 / 180.0) ;
  Ly = cos(alpha * 3.14 / 180.0) ;
  Lz = b * sin(gamma * 3.14 / 180.0) ;

  x = velocity * Lx * time ;
  // y = ... v*t - (1/2)*a*pow(t,2)
  y = (cos(alpha * 3.14 / 180.0)) + (velocity * Ly * time) 
      - (0.5 * g * time * time) ;   
  z = velocity * Lz * time ;
  
  rotX = PI / 256.0 ;
  rotY = PI / 128.0 ;
  
  // light sources ( blue and red )
  pointLight(0 , 100 , 255 , 0 , 0 , 0) ;
  pointLight(255 , 0 , 0 , 400 , 400 , 0) ;  
  
  // place the box in the display
  pushMatrix();
  translate(100 , 400-y , -z);
  rotateX(rotX);
  rotateY(rotY);
  box(90);
  popMatrix();
}
