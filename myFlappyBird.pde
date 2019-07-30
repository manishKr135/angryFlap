import processing.sound.*; //Importing the Processing sound package.
SoundFile sound;
PFont ravie,Rosewood; //Creating Processing font object.
Spear[] s=new Spear[100]; //Creating an array of spear Object.
Bird b=new Bird();  //Creating the bird object.
PImage img,img2,backimg,birdy,menuimg; //Creating Processing Image object.
  int score=0;
   int highScore=0;
   int flag=0;
   int flagOver=0;
   int countFlag=0;
    int seperation=250;
  int incr=500;
void setup(){
  ravie=loadFont("Ravie-100.vlw");                    //Loading the 
  Rosewood=loadFont("RosewoodStd-Regular-100.vlw");  //Fonts
sound =new SoundFile(this,"music.wav"); //Loading the sound
sound.loop(); //Calling the loop fucntion/
  img = loadImage("spear111.png"); 
  img2 = loadImage("spear222.png");  //Loading the images.
  backimg= loadImage("background.jpg");
  birdy=loadImage("bird.png");
  menuimg=loadImage("angryBack.jpg");
 
  size(1360,765);
  for(int i=0;i<s.length;i++){
    incr +=seperation;
   s[i] =new Spear(incr,0);
  }

   noLoop();
  keyPressed();
}

void draw(){
  //background(50,54,77);
  if(flag==0){
      image(menuimg,0,0,width,height);
      noLoop();
      if(frameCount<2){
   // textSize(10);
    textFont(Rosewood,50);
    fill(128,0,0);
    text("Press SpaceBar to Play",10,400);
    
  }
  textFont(ravie);
  }
  if(flag==1){
  image(backimg,0,0,width,height);
  if(frameCount%30==0)score++;
 
  textSize(18);
  fill(0);
  text("Score: "+score,1200,70); //Settin scores
  text("HighScore: "+highScore,1000,70);
  //text("Score: "+score,1200,70);
  //text("HighScore: "+highScore,950,70);
  
  
  for(int i=0;i<s.length;i++){
  s[i].show();
  s[i].update();
  if((b.pos.x+80==s[i].pos.x||b.pos.x==s[i].pos.x-20) && (b.pos.y+60>=height-s[i].ht2 || b.pos.y<=s[i].ht-30) ||b.pos.y>height){  //Collision algorithm
     
       flagOver=1;
      textSize(100);    
      text("Game Over",400,370);
      textSize(30);
      text("Press 'R' to Play Again",450,430);
      text("Press 'F' to go back to Menu",430,480);
      frameCount=0;
     noLoop();
    
  print("Collide\n");
  }
  }
  b.show();
  b.update();  
   if(highScore<=score){
    highScore=score;
  }
  }
}

void keyPressed(){
  if(flagOver==0 && key==' '){
    flag=1;
   // countDown();
   // if(countFlag==3){
  loop();
   // }
  }
  else if(flagOver==1 && (key=='r' || key=='R')){
    flagOver=0;
  int i=1;
  while(i<=5){
  reset();
//redraw();
 loop();
 i++;
  }
  }
  else    if(flagOver==1 && (key=='f'||key=='F')){
    flagOver=0;
    int i=1;
   while(i<=5){
    reset();
    redraw();
    i++;
   }
  
    flag=0;
    loop();
    
  }
  
}
void reset(){
   incr=500;
  score=0;
  b.pos.x=60;
  b.pos.y=(height/2)-20;
  for(int i=0;i<s.length;i++){
    //s[i].pos.x+=seperation;
    // s[i].ht=(int)random(150,350);
    // s[i].ht2=(int)random(100,350);
     incr +=seperation;
   s[i] =new Spear(incr,0);
  }
  
   
}
boolean countDown(){
 // boolean val=true;
  if(countFlag==0 && frameCount%60==0){
    textSize(300);
    text("3",width/2,height/2);
    countFlag=1;
  }
   else if(countFlag==1 && frameCount%60==0){
     textSize(300);
    text("2",width/2,height/2);
    countFlag=2;
  }
  
   else if(countFlag==2 && frameCount%60==0){
     textSize(300);
    text("1",width/2,height/2);
    countFlag=3;
  }
  //if(countFlag==3){}
  return true;
}
