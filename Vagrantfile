Vagrant.configure(2) do |config|

  if Vagrant.has_plugin?("vagrant-cachier")
      config.cache.scope = :box
  end

  config.ssh.insert_key = false
  config.vm.box = "centos-7.2"
  config.vm.provider :virtualbox do |vb|
    vb.linked_clone = true
    vb.cpus = 4;
    vb.memory = 4096
  end

  config.vm.define :builder, primary: true do |machine|
    machine.vm.hostname = "builder"
    machine.vm.network :private_network, ip: "192.168.33.17"
    machine.vm.synced_folder "shared-folder", "/var/www",
      :owner => "vagrant",
      :group => "vagrant",
      :mount_options => ["dmode=777,fmode=777"]
    machine.vm.provision :ansible_local do |ansible|
      ansible.playbook = "site.yml"
      ansible.inventory_path = 'inventory'
      ansible.limit = 'all'
      ansible.verbose = 'v'
    end
  end
end
