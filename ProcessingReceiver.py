import board #pylint: disable-msg=import-error
import busio #pylint: disable-msg=import-error
import time
import adafruit_motor #pylint: disable-msg=import-error
#import base64


uart = busio.UART(board.TX, board.RX, baudrate=9600)

servo1angle = 0
servo2angle = 0
temp = ''

while True:
    test =''
    temp = uart.read(1)
    print(temp.decode('utf-8'))
    #use = test.from_bytes(uart.read(1))
    #test = test.decode("utf-8")
    time.sleep(0.1)