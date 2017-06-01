
/* base on Daniel Shiffman 's code 
   2017.06.01 
*/

class Mover {
  
  PVector location ;
  PVector velocity ;
  
  Mover() {
    location = new PVector( width/2 , height/2 ) ;
    velocity = new PVector( 1.7 , 1.3 ) ;
  }
  
  void update() {
    location.add( velocity ) ;
  }
  
  void applyForce() {
  }
  
  void checkEdge() {
    if( location.x > width || location.x < 0 ) {
      velocity.x *= (-1) ;
    } 
    if( location.y > height || location.y < 0 ) {
      velocity.y *= (-1) ;
    } 

  }
  
  void display() {
    ellipse( location.x , location.y , 16 , 16 ) ;
  }
  
}


Mover m ;

void setup() {
  size( 640 , 320 ) ;
  m = new Mover() ;
}

void draw() {

  background(200) ;
  
  m.update() ;
  m.checkEdge() ;
  m.display() ;
  
}


