void setup(){
size(300, 300);//set window size
}
int x=50;
int y=150;
boolean ytoggle=false;//for monitoring if the ball should turn around
boolean xtoggle=false;//the same, but for Y

void draw(){
  background(230);
  if(x>=275) xtoggle=true;//not quite 300 to account for the radius
  if(x<=25) xtoggle=false;
  
  if(y>=275) ytoggle=true;
  if(y<=25) ytoggle=false;
  
  if(xtoggle==false) x=x+1;//changes X depending on the toggle
  else x=x-1;
  
  if(ytoggle==false) y=y+1;
  else y=y-1;
  
  fill(224, 102, 0);//color orange
  ellipse(x,y,50,50);//draw a circle
}
