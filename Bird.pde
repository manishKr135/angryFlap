class Bird{
PVector pos;
  Bird(){
  pos=new PVector(0,(int)random(300,height));
  }
  
  void show(){
   // ellipseMode(CORNER);
   fill(55,108,135);
   noStroke();
    image(birdy,pos.x+60,pos.y,70,70);
  }
  void update(){
    keyPressed();
   
  }  
  void keyPressed(){
   if(keyPressed && (key=='w' ||key=='W')){
       pos.y-=15;
    } 
    else {
     pos.y+=15;
  } 
   if(keyPressed && (key=='d' ||key=='D')){
  pos.x+=10;
  }
  if(keyPressed && (key=='a' ||key=='A')){
     pos.x-=10;
  }
    }
    
  }
  
