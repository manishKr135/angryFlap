 
class Spear{
  PVector pos;
 // int velocity=0;
  
  int ht=(int)random(150,350);
   int ht2=(int)random(100,350);
  Spear(int x,int y){
  pos= new PVector(x,y);
  }
  
    void show(){
  

      fill(60,99,10);
  image(img,pos.x,0,60,ht);
    image(img2,pos.x,height-ht2,60,ht2);
 //  //  fill(255,50,20);
 //  rect(pos.x,0,50,ht);
 //   rect(pos.x,height-ht,50,ht);
  }
  void update(){
    //if(mousePressed)pos.x-=10;
  //  else  pos.x-=5;
  keyPressed();
  
  }
  void keyPressed(){
   
    if(key==' ')pos.x-=10;
    else  pos.x-=5;
    
    
  }

}
