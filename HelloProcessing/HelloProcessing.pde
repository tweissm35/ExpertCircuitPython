void setup(){
size(300, 300);
}
int x=50;
int y=150;
boolean ytoggle=false;
boolean xtoggle=false;

void draw(){
  background(230);
  if(x>=275){
  xtoggle=true;
  }
  if(x<=25){
  xtoggle=false;
  }
  if(y>=275){
  ytoggle=true;
  }
  if(y<=25){
  ytoggle=false;
  }
  if(xtoggle==false){
  x=x+1;
  }
  else{
  x=x-1;
  }
  if(ytoggle==false){
  y=y+1;
  }
  else{
  y=y-1;
  }
  fill(224, 102, 0);
  ellipse(x,y,50,50);
}
