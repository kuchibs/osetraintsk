#!/bin/sh -x
: <<'END'
while read p; do
  echo $p
done <peptides.txt


for word in $sentence
do
    echo $word
done
END

while read -r file PASSWORD SERVER XYZ
do
   
   echo "p:"$PASSWORD "s"$SERVER "cmd:"$cmd "file:"$file
   sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no  root@"$file" "mkdir -m 700 /root/.ssh"
   sshpass -p "$PASSWORD" scp ~/.ssh/id_rsa.pub "$file":/root/.ssh/id_rsa_9023Control.pub
   
   sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no root@"$file" "cat /root/.ssh/id_rsa_9023Control.pub >> /root/.ssh/authorized_keys"
   sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no root@"$file" "chmod 600 /root/.ssh/authorized_keys"

done <./server.txt

