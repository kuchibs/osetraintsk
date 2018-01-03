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

#while read file SERVER PASSWORD
#while read file PASSWORD SERVER

while read file PASSWORD SERVER XYZ
do
   
   echo "p:"$PASSWORD "s"$SERVER "cmd:"$cmd "file:"$file
   sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no  root@"$file" "mkdir -m 700 /root/.ssh"
   sshpass -p "$PASSWORD" scp ~/.ssh/id_rsa.pub "$file":/root/.ssh/id_rsa_9023Control.pub
   
   sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no root@"$file" "cat /root/.ssh/id_rsa_9023Control.pub >> /root/.ssh/authorized_keys"
   sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no root@"$file" "chmod 600 /root/.ssh/authorized_keys"

done <./server.txt

   #chmod 644 filename>>filename
   #cat id_rsa.pub >> ~/.ssh/authorized_keys


   #cat ~/.ssh/id_rsa.pub | ssh root@"$SERVER" "mkdir /root/.ssh;cat >> /root/.ssh/id_rsa.pub"

  #sshpass -p "interOP@9159" scp file.txt "osetrain-i9159":/root/.ssh/id_rsa_9023Control.pub
  # scp .ssh/id_rsa.pub root@kucsa02-i9021:/root/.ssh/id_rsa_9023Control.pub
