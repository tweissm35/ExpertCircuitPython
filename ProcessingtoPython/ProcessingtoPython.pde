import processing.serial.*;
Serial myPort;

color b = color(0, 0, 0);  // Define color 'b'
int servo1angle = 0;
int servo2angle = 0;
int oldmillis = 0;
int mills = 0;
String message = "";

void setup() {
    size(300, 400);//creates the window size  
    background(230);
    PFont f;//creates the font 
    f = createFont("Courier",20,true);
    textFont(f,20);
    myPort = new Serial(this, Serial.list()[2], 9600);//connect to the third serial port
    
    
}
void draw() {
     servo1angle = round(map(mouseX,0,300,0,179));//maps the X position into something the servo would like
     servo2angle = round(min(179,map(mouseY,0,300,0,179)));//here the min is needed because part of the screen is for displaying the number
     
     background(230);//makes the background gray
     stroke(255,0,0);//gets the color to red
     strokeWeight(1);//makes the pen thickness very thin
     line(150,0,150,300);//draws a line
     line(0,150,300,150);
     stroke(150,0,255);//sets the color to purple
     strokeWeight(5);
     fill(0,0,0,0);//makes it so there's only an outline, so the rectangles will be border only
     rect(1,2,297,299);//draw a rectangle
     rect(1,300,297,97);
     textSize(30);//set text size
     fill(b);//set color
     text("Servo 1:",20,335);//write text
     text("Servo 2:",20,375);
     text(servo1angle+"°",160,335);
     text(servo2angle+"°",160,375);
     stroke(0);
     ellipse(mouseX,mouseY,1,1);//draw a little circle where the cursor is 
}
void mouseMoved(){
    message = servo1angle+"%"+servo2angle+"#"; //creates the string that will be sent
    mills = millis();
    if(mills-oldmillis>=100){//check if it has been 100 milliseconds since it last sent a message
       myPort.write(message);//send the string over uart
       oldmillis = mills;
    }
}
