import board #pylint: disable-msg=import-error
import busio #pylint: disable-msg=import-error
import servo #pylint: disable-msg=import-error
import time

uart = busio.UART(board.TX, board.RX, baudrate=9600)
while True:
    test = uart.read(1)
    #test =''
   # use = test.from_bytes(uart.read(1))
    #test = test.decode("utf-8")
    print(test)
    #time.sleep(100)