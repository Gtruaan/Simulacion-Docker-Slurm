import socket
import random
import time

time.sleep(random.randint(4, 10))

print("Hola desde {} :)".format(socket.gethostname()))
