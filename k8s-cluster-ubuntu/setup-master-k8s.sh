#Initialize the cluster using the IP range for Flannel.
# Need to store last command containing
# token and ca-cert in variables from below output
# tail -n 1 piped

sudo kubeadm init --pod-network-cidr=10.244.0.0/16

#Copy the kubeadmn join command that is in the output. We will need this later.
#Exit sudo and copy the admin.conf to your home directory and take ownership.

mkdir -p $HOME/.kube

sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

sudo chown $(id -u):$(id -g) $HOME/.kube/config


sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/bc79dd1505b0c8681ece4de4c0d86c5cd2643275/Documentation/kube-flannel.yml

