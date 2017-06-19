
/*  base on LSD art lab 
2017.06.20 

*/

ArrayList<PVector> circle = new ArrayList<PVector>() ;

ArrayList<PVector> square = new ArrayList<PVector>() ;

ArrayList<PVector> morph  = new ArrayList<PVector>() ;

boolean state = false ;


void setup() {

  size( 640 , 360 ) ;
  
  for( int angle=0 ; angle<360 ; angle+=9 ) {
    
    // a normal-vector by fourty angles
    PVector v = PVector.fromAngle( radians(angle-135) ) ;
    v.mult(100);
    // fourty v is added to ArrayList
    circle.add(v);
    
    // same time , add same-number morph-factor 
    morph.add( new PVector() ) ;
    
  }
  
  // fourty 
  for( int x=-50 ; x<50  ; x+=10 ) { square.add(new PVector(x   , -50)); }
  for( int y=-50 ; y<50  ; y+=10 ) { square.add(new PVector(50  ,  y )); }
  for( int x=50  ; x>-50 ; x-=10 ) { square.add(new PVector(x   ,  50)); }
  for( int y=50  ; y>-50 ; y-=10 ) { square.add(new PVector(-50 ,  y )); }
  
}


void draw() {
  
  background(51);
  
  float totalDistance = 0 ;
  
  
  for( int i=0 ; i<circle.size() ; i++ ) {
    
    PVector v1 ;
    
    if(state) { v1 = circle.get(i) ; }
    else {      v1 = square.get(i) ; }
    
    PVector v2 = morph.get(i) ;
    
    /*  
        "get()" is different with "get(i)" . 
        "get()" means that Getting a copy of the array-object .
        But ,
        "get(i)" means The Object .
        Operating "v2" IS Operating the "morph.get(i)" .         
    */

    v2.lerp(v1 , 0.1 ) ;
    
    totalDistance += PVector.dist( v1 , v2 ) ;
  }
  
  
  if( totalDistance < 0.1 ) {
    state = !state ;
  } 
  
  translate( width/2 , height/2 ) ;
  strokeWeight(4) ;
  
  beginShape();
  noFill();
  stroke(255);
  for( PVector v : morph ) {
    vertex( v.x , v.y ) ;
  }
  endShape(CLOSE);
}






