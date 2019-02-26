# Automation in Container and VM deployment using KVM and Docker

The main goal of this project is to automate the deployment of both docker containers and virtuam machines using KVM.

Tasks that need to be completed:

-----

- [x] 1. Use ansible to automate package installation and put the system in a "ready" state for deployments.
  - system update
  - system upgrade
  - qemu-kvm qemu-img virt-manager libvirt libvirt-python libvirt-client virt-install virt-viewer bridge-utils
  - make sure libvirtd is enabled and started
  - "@X Window System" xorg-x11-xauth xorg-x11-fonts-* xorg-x11-utils
  - wget, git, zip, unzip, nano, vim
  - stop / disable / mask firewalld
  - install docker / enable / start
  - install and configure iptables

- [x] 2. Setup Ansible playbooks for VM creation.
  - [x] They will be kvm based with 3 variables and 3 operating systems. Networking and exposure will be hard but will be NAT-ed probably.
  - [x] Qcow2 based image for easy store, would need to be changed over to LVM in the future for faster I/O
  - [ ] Resize of images. This can be quite nieche to do as the VM needs to be shutdown -> Resize -> Login -> xfs_growfs / -D with new size.
  - [ ] make a bash script for port exposure over NAT. e.g if httpd is installed on VM1 with IP 192.168.122.200 -> would need to export port on the main dedi to a new port which is not used. -> iptables -t nat -I PREROUTING -p tcp --dport 80 -j DNAT --to 192.168.111.36:(4444) // need to keep track of the ports.

- [ ] 3. Setup docker containers
  - will have the option to deploy containers and export ports through networks (this will be a living hell NAT-ing class B network over the docker bridge)
  - containers will be built through the docker hub and exposed the same way as the VMs will be.
  - would need to have images created customly but that is in a later period (TODO)
  - VNC for containers that have a GUI will need to be exposed as well.

- [x] 4. Setup Ansible AWX for GUI managment.

- [ ] 5. Setup Exim / Dovecot / Webmail
  - Would most likely be a cluster of containers handling emails and have a bash script automate some of the processes inside the containers.

- [x] 6. Slack
  - Add slack webhooks for handling and easy managment without the requirmenet of SSHing and running ansible playbooks / commands.
  - e.g In the channel I will create just send "Create VM 2 512 CentOS" which will spin a VM with 2 cores and 512 RAM with CentOS as operating system and send the info to the request 'Your VM has been created and has an IP 192.168.122.*' and SSH port exposed on {publicIP}:4444(example)
  - e.g For containers it would be the same as above with slight changes to the outputs / inputs which I am yet to think of.
