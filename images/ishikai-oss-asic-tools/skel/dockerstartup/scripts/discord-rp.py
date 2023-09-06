#!/usr/bin/env python
from pypresence import Presence
import time
import logging
import os
import sys

CHIPATHON2023='1147365718921330688'

def presence_main():
    client_id = CHIPATHON2023 # Fake ID, put your real one here
    RPC = Presence(client_id)  # Initialize the client class
    RPC.connect() # Start the handshake loop

    msg = RPC.update(state="Lookie Lookie", details="A test of qwertyquerty's Python Discord RPC wrapper, pypresence!")  # Set the presence

    while True:  # The presence will stay on as long as the program is running
        time.sleep(60) # Can only update rich presence every 60 seconds

def daemonize():
    pid = os.fork()
    if pid > 0:
        pid_file = open('/tmp/discord-rp.pid','w')
        pid_file.write(str(pid)+"\n")
        pid_file.close()
        # time.sleep(1);
        sys.exit()
    if pid == 0:
        presence_main()

if __name__ == '__main__':
    logging.basicConfig(filename='/tmp/discord.log', level=logging.INFO)
    logging.info('Started')

    daemonize()
