#!/bin/bash

set -e -x

version="1.15.11-00"

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

cat <<EOF | tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

apt-get update
apt-get install -y kubelet=${version} kubeadm=${version} kubectl=${version}
apt-mark hold kubelet kubeadm kubectl