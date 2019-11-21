import board #pylint: disable-msg=import-error
import busio #pylint: disable-msg=import-error
import time
from adafruit_motor import servo #pylint: disable-msg=import-error
import pulseio #pylint: disable-msg=import-error

uart = busio.UART(board.TX, board.RX, baudrate=9600)

pwm = pulseio.PWMOut(board.D13, frequency=50, duty_cycle=0)
servo = servo.Servo(pwm, min_pulse=500, max_pulse=2400)

servo1angle = 0
servo2angle = 0
temp = ''
store = []
empty = ''#empty.join(store)


while True:#problem that it sometimes receives dupelicates and too big numbers
            #this program assumes that is not the case
    temp = uart.read(1)
    if temp is not None:
        temp = temp.decode("utf-8")

        if temp == '%':
            servo1angle = int(empty.join(store))
            store.clear()
        if temp == '#':
            print(store)
            servo2angle = int(empty.join(store))
            store.clear()
        else:
            store.append(temp)
        servo.angle = servo1angle
    time.sleep(0.1)