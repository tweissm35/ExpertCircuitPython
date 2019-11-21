import board #pylint: disable-msg=import-error
import busio #pylint: disable-msg=import-error
import time
import adafruit_motor #pylint: disable-msg=import-error

uart = busio.UART(board.TX, board.RX, baudrate=9600)

#servo1angle = 0
#servo2angle = 0
temp = ''
between = 0

while True:
    temp = uart.read(1)
    if temp is not None:
        temp = temp.decode("utf-8")
        between+=1
        if  temp == '%' or temp == "#":
            between = 0
        print(temp)
           
    time.sleep(0.1)