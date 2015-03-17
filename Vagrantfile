unless Vagrant.has_plugin?('vagrant-omnibus')
  raise 'vagrant-omnibus is not installed! Install with `vagrant plugin install vagrant-omnibus`'
end

Vagrant.configure(2) do |config|
  config.vm.box_url = 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box'
  config.vm.box = 'trusty64'
  config.vm.hostname = 'made-trusty'

  config.vm.network 'forwarded_port', guest: 80, host: 8000
  config.vm.network 'forwarded_port', guest: 443, host: 4430
  config.vm.network 'forwarded_port', guest: 5000, host: 5000
  config.vm.network 'forwarded_port', guest: 5001, host: 5001

  config.vm.network 'private_network', ip: '192.168.0.100'

  config.vm.synced_folder 'www/', '/var/www/', type: :nfs

  config.vm.provider :virtualbox do |v|
    v.memory = 2048
  end

  config.omnibus.chef_version = '11.8.2'

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ['cookbooks', 'site-cookbooks']
    chef.roles_path = ['roles']

    chef.add_recipe 'apt'
    chef.add_recipe 'apt::update_cache'
    chef.add_recipe 'apt::packages'

    chef.add_role 'apache-webserver'
    chef.add_role 'mysql'
    chef.add_role 'php'
    chef.add_role 'ruby'
    chef.add_role 'python'
    chef.add_role 'source-control'
    chef.add_role 'development'
    chef.add_role 'imagemagick'
    chef.add_role 'test'

    chef.json = {
      :phpmyadmin => {
        :hostname => 'phpmyadmin.local'
      }
    }
  end
end
