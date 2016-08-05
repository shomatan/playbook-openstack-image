Vagrant.configure(2) do |config|

  if Vagrant.has_plugin?("vagrant-cachier")
      config.cache.scope = :box
  end

  config.vm.box = "centos-7.2"
  config.vm.provider :virtualbox do |vb|
    vb.linked_clone = true
    vb.cpus = 4;
    vb.memory = 4096
  end

  config.vm.define :default, primary: true do |machine|
    machine.vm.hostname = "default"
    machine.vm.network :private_network, ip: "192.168.33.17"
    machine.vm.synced_folder "shared-folder", "/var/www/html",
      :owner => "vagrant",
      :group => "vagrant",
      :mount_options => ["dmode=777,fmode=777"]
    machine.vm.provision :chef_zero do |chef|
      chef.log_level = "error"
      chef.nodes_path = "./nodes"
      chef.json = {
      }
      chef.run_list = %w{
      }
    end
  end
end
