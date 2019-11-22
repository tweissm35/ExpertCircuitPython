import processing.serial.*;
Serial myPort;

color b = color(0, 0, 0);  // Define color 'b'
int servo1angle = 0;
int servo2angle = 0;
int oldmillis = 0;
int mills = 0;
String message = "";

void setup() {
    size(300, 400);  
    background(230);
    PFont f;
    f = createFont("Courier",20,true);//the size here doesn't matter because of the next line
    textFont(f,20);
  
    println("Available serial ports:");
    println(Serial.list());
    myPort = new Serial(this, Serial.list()[2], 9600);//change to 2
    
    
}
void draw() {
     servo1angle = round(map(mouseX,0,300,0,179));
     servo2angle = round(min(179,map(mouseY,0,300,0,179)));
     
     background(230);
     stroke(255,0,0);
     strokeWeight(1);
     line(150,0,150,300);
     line(0,150,300,150);
     stroke(150,0,255);
     strokeWeight(5);
     fill(0,0,0,0);
     rect(1,2,297,299);
     rect(1,300,297,97);
     textSize(30);
     fill(b);
     text("Servo 1:",20,335);
     text("Servo 2:",20,375);
     text(servo1angle+"°",160,335);
     text(servo2angle+"°",160,375);
     stroke(0);
     ellipse(mouseX,mouseY,1,1);
}
void mouseMoved(){
    message = servo1angle+"%"+servo2angle+"#"; 
    mills = millis();
    if(mills-oldmillis>=100){
       myPort.write(message);//writes the same thing if converted to bytes or not
       println(message);
       oldmillis = mills;
    }
}
