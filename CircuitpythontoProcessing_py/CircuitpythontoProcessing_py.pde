import processing.serial.*;
Serial myPort = new Serial(this, Serial.list()[2], 9600);

color b = color(0, 0, 0);  // Define color 'b'
void setup() {
     size(300, 300);//sets the window size
     smooth(8);//makes the text "rounder"
     textAlign(CENTER);//makes text align its center with the coordinates you give it
     background(230);//makes the background light gray 
     PFont f;//these three line set up the font VVV
     f = createFont("Courier",20,true);
     textFont(f,20);
}
void draw() {
     fill(0);//black
     strokeWeight(2);//thickness
     if (myPort.available() > 0) { //check if there is data
          background(230);
          int myNum = myPort.read();
          //does some math, the important thing is I'm using sine (for y) and cosine (for x) and that I divide by 255. The rest just sets the size
          float sinend = (150+sin((float(myNum)/255)*(1.5*PI)+0.75*PI)*120);
          float cosend = (150+cos((float(myNum)/255)*(1.5*PI)+0.75*PI)*120);
          
          noStroke();//no outline
          fill(255);//white
          ellipse(150,150,200,200);//make a circle size, radius 100
          stroke(0);
          
          
          for(float i = (PI/4);i<2*PI;i+=PI/4){//makes the lines on the edge of the circle
          line(150+cos(i)*80,150+sin(i)*80, 150+cos(i)*100,150+sin(i)*100);
          }
          
          println(myNum);//this block makes the numbers that appear on the outside. It's essentially the same as the for loop
          textSize(20);
          fill(b);
          text("255",150+cos(PI/4)*125,150+sin(PI/4)*125);
          text("0",150+cos((3*PI)/4)*125,150+sin((3*PI)/4)*125);
          text("128",150+cos(-PI/2)*125,150+sin(-PI/2)*125);
          text("170",150+cos(-PI/4)*125,150+sin(-PI/4)*125);
          text("85",150+cos((-3*PI)/4)*125,150+sin((-3*PI)/4)*125);
          text("212",150+cos(0)*125,150+sin(0)*125);
          text("42",150+cos(PI)*125,150+sin(PI)*125);
          
          stroke(255,0,0);//this blockmakes the red line
          line(150,150,cosend,sinend);  
          textSize(30);
          text(myNum,150,150);
     } 
}
