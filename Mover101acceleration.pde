
/* base on Daniel Shiffman 's code 
   2017.06.01 
*/

class Mover {
  
  PVector location ;
  PVector velocity ;
  PVector acceleration ;
  
  Mover() {
    location = new PVector( width/2 , height/2 ) ;
    velocity = new PVector( 0 , 0 ) ;
    acceleration = new PVector( 0.2 , -0.3 ) ;
  }
  
  void update() {
    velocity.add( acceleration ) ;
    velocity.limit(10) ;
    location.add( velocity ) ;
  }
  
  void checkEdge() {
    if( location.x < 0 || location.x > width ) {
      velocity.x *= (-1) ;
    }
    if( location.y < 0 || location.y > height ) {
      velocity.y *= (-1) ;
    }
  }
  
  void display() {
    ellipse( location.x , location.y , 32 , 32 ) ;
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

