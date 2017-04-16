#!/bin/bash
### output a private key
read -p "Enter key: " key
cat /home/vnc/keys/$key
cat /home/vnc/stun_dumps/$key.stn