import board #pylint: disable-msg=import-error
import busio #pylint: disable-msg=import-error
from analogio import AnalogIn #pylint: disable-msg=import-error
import time
from myfunction import mapp

uart = busio.UART(board.TX, board.RX, baudrate=9600)#set up uart
potpin = AnalogIn(board.A5)

while True:
    #turn the potentiometer value into 0-255, then make it integer, then make it a byte, then send over uart
    uart.write(bytes([int(mapp(potpin.value,0,65536,0,256))]))
    time.sleep(0.1)#wait a little bit