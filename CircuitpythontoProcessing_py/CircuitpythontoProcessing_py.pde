import processing.serial.*;
Serial myPort = new Serial(this, Serial.list()[2], 9600);

void setup() {
     println("Available serial ports:");
     printArray(Serial.list());
     size(300, 300);
     smooth(8);
     background(230);
     PFont f;
     f = createFont("Comic Sans MS",20,true);//the size here doesn't matter because of the next line
     textFont(f,20);
     
     
}
color b = color(0, 0, 255);  // Define color 'c'
void draw() {
  //print(myPort.available());
     fill(0);
     strokeWeight(2);
     if (myPort.available() > 0) { 
          background(230);
          int myNum = myPort.read();
          
          float sinend = (150+sin((float(myNum)/255)*(1.5*PI)+0.75*PI)*120);
          float cosend = (150+cos((float(myNum)/255)*(1.5*PI)+0.75*PI)*120);
          
          noStroke();
          fill(255);
          ellipse(150,150,200,200);
          stroke(0);
          
          
          for(float i = (PI/4);i<2*PI;i+=PI/4){
          line(150+cos(i)*80,150+sin(i)*80, 150+cos(i)*100,150+sin(i)*100);
          }
          
          println(myNum);
          
          
          
          line(150,150,cosend,sinend);  
          fill(b);
          text(myNum,cosend,sinend);
     } 
}
