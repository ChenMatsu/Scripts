#!/bin/bash

OS=$(uname)

if [ "$OS" = "Darwin" ]; then
    brew install kubectl

elif [ "$OS" = "Linux" ]; then
    # Disable swap
    sudo swapoff -a
    sudo sed -i '/ swap / s/^/#/' /etc/fstab

    sudo apt update 
    sudo apt upgrade -y
    sudo apt install -y kubectl

    sudo curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
    echo "deb https://apt.kebernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
    sudo apt update

    sudo apt install -y kubelet kubeadm kubectl
    sudo apt-mark hold kubelet kubeadm kubectl # prevent auto-upgrade

    sudo kubeadm init --pod-network-cidr=10.244.0.0/16

    mkdir -p $HOME/.kube
    sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    sudo chown $(id -u):$(id -g) $HOME/.kube/config
fi

echo "kubectl installed with version $(kubectl version --client)"