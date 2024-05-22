
Vagrant.configure("2") do |config|      
  config.vm.define "web-server" do |config|
    config.vm.box = "ubuntu/bionic64"
    config.vm.network "private_network", ip: "192.168.53.10"
    config.vm.hostname = "web-server"
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
      vb.cpus = 1
    end
  end
  
    config.vm.boot_timeout = 600 # to give more time to the virtual machine to establish an ssh connexion, the default value is 300
  config.vm.provision "ansible" do |ansible|
   
    ansible.playbook = "iac-ansible/playbook.yml"
    ansible.inventory_path = "iac-ansible/inventory.ini"
    
  end
end