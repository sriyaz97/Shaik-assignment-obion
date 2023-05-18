Create ec2 on same vpc for now I have chosen manully latter we can automate provision with terraform
ssh ec2 and install RKE follow below steps

1. kubectl:
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client

2. helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

3. Ansible
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user
python3 -m pip install --user ansible

4. Install Kubernetes with RKE:

Step 1: Update your Linux System
sudo apt update && sudo apt -y full-upgrade
[ -f /var/run/reboot-required ] && sudo reboot -f

Step 2: Create rke user and enable modules

Using Ansible Playbook:

ansible-playbook -i hosts playbook-user.yaml
ansible-playbook -i hosts playbook-module.yaml

Step 3: rke install
curl -s https://api.github.com/repos/rancher/rke/releases/latest | grep download_url | grep amd64 | cut -d '"' -f 4 | wget -qi -
chmod +x rke_linux-amd64
sudo mv rke_linux-amd64 /usr/local/bin/rke
rke --version

Step 4: Disable swap and Modify sysctl entries
ansible-playbook -i hosts playbook-swap.yaml

Step 5: Install Supported version of Docker
curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh

curl https://releases.rancher.com/install-docker/20.10.sh | sudo bash -
sudo systemctl enable --now docker
 sudo usermod -aG docker rke

Step 6: Open Ports on firewall
  - For a single-node installation, you only need to open the ports required to enable Rancher to communicate with downstream user clusters.

  - For a high-availability installation, the same ports need to be opened, as well as additional ports required to set up the Kubernetes cluster that Rancher is installed on.

Step 6: Allow SSH TCP Forwarding
sudo vi /etc/ssh/sshd_config
AllowTcpForwarding yes

Step 7: Generate RKE cluster configuration file.
rke config --name cluster.yml

If you want to create an empty template cluster.yml file instead, specify the --empty flag.


- rke config --empty --name cluster.yml

role: [controlplane, etcd, worker]

Step 7: Deploy Kubernetes Cluster with RKE
rke up

rke up --config ./rancher_cluster.yml

Step 8: Accessing your Kubernetes cluster
export KUBECONFIG=./kube_config_cluster.yml
kubectl get nodes

mkdir ~/.kube
cp ./kube_config_cluster.yml ~/.kube/config


