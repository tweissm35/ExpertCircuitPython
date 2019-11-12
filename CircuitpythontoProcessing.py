import board#pylint: disable-msg=import-error
import busio#pylint: disable-msg=import-error
from analogio import AnalogIn #pylint: disable-msg=import-error
import time
from myfunction import mapp

uart = busio.UART(board.TX, board.RX, baudrate=9600)
potpin = AnalogIn(board.A5)
test = 0

while True:
    test = int(mapp(potpin.value,0,65535,0,255))
    uart.write(bytes([test])) 
    time.sleep(0.1)
 
        