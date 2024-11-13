#!/bin/bash

ssh-keygen -f "$HOME/.ssh/known_hosts" -R "192.168.122.251"
sshpass -p hjgewkuoiwoincworn ssh -o StrictHostKeyChecking=no root@192.168.122.251
