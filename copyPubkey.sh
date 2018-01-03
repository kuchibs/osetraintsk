#!/bin/sh -x
while read SERVER PASSWORD
do
   sshpass -p "$PASSWORD" ssh root@"$SERVER" "mkdir -m 700 /root/.ssh"
   sshpass -p "$PASSWORD" scp ~/.ssh/id_rsa.pub "$SERVER":/root/.ssh/id_rsa_9023Control.pub
   
   sshpass -p "$PASSWORD" ssh root@"$SERVER" "cat /root/.ssh/id_rsa_9023Control.pub >> /root/.ssh/authorized_keys"
   sshpass -p "$PASSWORD" ssh root@"$SERVER" "chmod 600 /root/.ssh/authorized_keys"

   #chmod 644 filename>>filename
   #cat id_rsa.pub >> ~/.ssh/authorized_keys


   #cat ~/.ssh/id_rsa.pub | ssh root@"$SERVER" "mkdir /root/.ssh;cat >> /root/.ssh/id_rsa.pub"

  #sshpass -p "interOP@9159" scp file.txt "osetrain-i9159":/root/.ssh/id_rsa_9023Control.pub
  # scp .ssh/id_rsa.pub root@kucsa02-i9021:/root/.ssh/id_rsa_9023Control.pub
done <./server.txt
