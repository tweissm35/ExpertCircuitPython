import processing.serial.*;
Serial myPort = new Serial(this, Serial.list()[1], 9600);

void setup() {
     println("Available serial ports:");
     println(Serial.list());
     size(300, 300);
     background(230);
     PFont f;
     f = createFont("Arial",16,true);
     textFont(f,36);
}
void draw() {
     fill(255);
     background(230);
     if (myPort.available() > 0) 
     { 
          int myNum = myPort.read();
          text(myNum,150,150);
          println(myNum);
     } 

}
