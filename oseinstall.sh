mkdir ~/1sarvani && cd ~/1sarvani
wget https://github.com/openshift/origin/releases/download/v1.5.0/openshift-origin-client-tools-v1.5.0-031cbe4-linux-64bit.tar.gz
tar -xvzf openshift-origin-client-tools-v1.5.0-031cbe4-linux-64bit.tar.gz
mkdir /usr/local/bin/
cp openshift-origin-client-tools-v1.5.0-031cbe4-linux-64bit/* /usr/local/bin/
oc cluster up --skip-registry-check=true
