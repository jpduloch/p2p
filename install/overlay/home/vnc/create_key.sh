#!/bin/bash

### get a random port number between 1025-65535
### check to make sure that it is not already used
port=$(shuf -i 1025-65535 -n 1)
while netcat -zv 127.0.0.1 $port <<<'' &> /dev/null
do
    port=$(shuf -i 1025-65535 -n 1)
done

### generated a random keyl, only numerical
key=$(shuf -i 100000000-1000000000 -n 1)
#key=$(mcookie | head -c 10)

### generate the key pair
file=keys/$key
ssh-keygen -t rsa -f $file -q -N ''

### Upload key
uploadfile=keys/$key-upload
ssh-keygen -t rsa -f $uploadfile -q -N ''

### insert the port to the first line of the private key
sed -e "1i $port" -i $file

### put some restrictions on the public key
### and append it to authorized_keys
restrictions='command="/bin/sleep 2",no-agent-forwarding,no-user-rc,no-X11-forwarding,permitopen="localhost:'$port'" '
sed -e "s#^#$restrictions#" -i $file.pub
cat $file.pub >> /home/vnc/.ssh/authorized_keys

restrictions='command="scp -v -r -t ~/content/",no-agent-forwarding,no-user-rc,no-X11-forwarding'
sed -e "s#^#$restrictions#" -i $uploadfile.pub
cat $uploadfile.pub >> /home/vnc/.ssh/authorized_keys

### output the private key
echo $key
cat $file
cat $uploadfile
