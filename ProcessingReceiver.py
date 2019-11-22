import board #pylint: disable-msg=import-error
import busio #pylint: disable-msg=import-error
import time
from adafruit_motor import servo #pylint: disable-msg=import-error
import pulseio #pylint: disable-msg=import-error

uart = busio.UART(board.TX, board.RX, baudrate=9600)#transmit with pin tx, receive with rx, at a speed of 9600 pulses per second

pwm = pulseio.PWMOut(board.D3, frequency=50, duty_cycle=0)#set up the servos
pwm2 = pulseio.PWMOut(board.D4, frequency=50, duty_cycle=0)
servo1 = servo.Servo(pwm, min_pulse=500, max_pulse=2400)
servo2 = servo.Servo(pwm2, min_pulse=500, max_pulse=2400)

servo1angle = 0#servo angle 1
servo2angle = 0#servo angle 2
temp = ''#the most recent digit/symbol from the uart
store = []#an array of digits from the uart
empty = ''#used for combining strings into digits


while True:
    temp = uart.read(1)#read one byte frmo uart 
    if temp is not None:#check to see if there is data
        temp = temp.decode("utf-8")#turn the byte into a string

        if temp == "%":
            servo1angle = int(empty.join(store))#combine the contents of store with empty in between each element, then cast as an int
            store.clear()#remove every element from store
        elif temp == "#":
            servo2angle = int(empty.join(store))
            store.clear()
        else:
            store.append(temp)#add an element to store with value of temp
        servo1.angle = servo1angle#write an angle to a servo
        servo2.angle = servo2angle
    time.sleep(0.01)#wait a little bit